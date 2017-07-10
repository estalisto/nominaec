function frm_empresa()
{       jQuery("#idContenido").html("<br/><br/><center><img alt='cargando' src='dist/img/hourglass.gif' /><center>"); 
        jQuery("#idContenido").load("empresa?accion=frm_agregar",{},function(){ });
}




function validaLongitudCED_RUC_HTML(){

                var Tipo_Identificacion = $("#t_identificacion").val();
                 var Identificacion = document.getElementById('identificacion').value;
                  
                   var  validaLength = document.getElementById('validaLength');
                  validaLength.innerText ="";
                  validaLength.style.display = 'none';
                var longuitud=Identificacion.length;
                  // console.log(">> Identificacion.length: "+longuitud);
                if (Tipo_Identificacion==="1"){
                   // console.log(">> Celuda"+Identificacion);
                    if(Identificacion.length>10){
                     //    console.log(">> Celuda >10"+Identificacion);
                       validaLength.innerText = "La cédula debe contener máximo 10 digitos";
                       validaLength.style.color="#f00";
                       validaLength.style.display = 'Block';
                     return;
                    }else{
                          $("#identificacion").validarCedulaEC({
                            onValid: function () {
                              var okok = Identificacion = document.getElementById('identificacion').value;
                               if((Tipo_Identificacion==="1")&&(okok.length===10)){
                                   //console.log("paso por aqui ced"+Tipo_Identificacion+" long: "+Identificacion.length+" okok "+okok.length);
                                    validaLength.innerText = "La cédula es Válida";
                                     validaLength.style.color="#31B404";
                                     validaLength.style.display = '';
                               }else{
                                     validaLength.innerText = "La cédula es inválida";
                                     validaLength.style.color="#f00";
                                    validaLength.style.display = '';
                               }
                              

                            },
                            onInvalid: function () {
                             // $('#no_value').css("display", "block");
                              //$('#valido').css("display", "none");
                               validaLength.innerText = "La cédula es inválida";
                               validaLength.style.color="#f00";
                              validaLength.style.display = '';
                            }
                          }); 
                    }
                    
                }
                 if (Tipo_Identificacion==="2"){
                    if(Identificacion.length>13){
                       validaLength.innerText = "El RUC debe contener máximo 13 digitos";
                       validaLength.style.color="#f00";
                        validaLength.style.display = '';
                        return;
                    }else if(Identificacion.length===10){
                       validaLength.innerText = "El RUC debe contener 13 digitos";
                       validaLength.style.color="#f00";
                        validaLength.style.display = '';
                        return;
                    }else{
                        $("#identificacion").validarCedulaEC({
                            onValid: function () {
                                var okok2 = Identificacion = document.getElementById('identificacion').value;
                                 if((Tipo_Identificacion==="2")&&okok2.length===13){
                                   console.log("paso por aqui RUC");
                                  validaLength.innerText = "El R.U.C. es Válido";
                                  validaLength.style.color="#31B404";
                                  validaLength.style.display = '';  
                                }else{
                                    validaLength.innerText = "El R.U.C. es inválida";
                                    validaLength.style.color="#f00";
                                    validaLength.style.display = '';
                                }
                              

                            },
                            onInvalid: function () {
                               validaLength.innerText = "La R.U.C. es inválida";
                               validaLength.style.color="#f00";
                              validaLength.style.display = '';
                            }
                          }); 
                        
                    }
                    
                }
               
}

function validaLongitudCED_RUC_OK(){               
    var  validaLength = document.getElementById('validaLength').innerHTML;
     var t_ident= document.getElementById('t_identificacion').value;
          var ident= document.getElementById('identificacion').value;
    if((validaLength==="La cédula es Válida")&&(t_ident==="1")&&(ident.length ===10)){
        return true;
    }else  if((validaLength==="El R.U.C. es Válido")&&(t_ident==="2")&&(ident.length ===13)){
     return true;
    }
    else if(validaLength===""){
        return false;
    }else{
         return false;
    }       
}

function obtenerProvincias(){
    var idPais=document.getElementById("pais").value;
    var accion = "obtenerProvincias";
   
    if(idPais=="0"){
        document.getElementById("provincias").innerHTML="";
        document.getElementById("provincias").innerHTML=selectProvincias(); 
        document.getElementById("provincia").disabled=false;
        document.getElementById("ciudades").innerHTML="";
        document.getElementById("ciudades").innerHTML=selectCiudades(); 
        document.getElementById("ciudades").disabled=false;
    }
   // return;
     var parametros = {
            "accion": accion,
            "idPais": idPais          
        };
        $.ajax({
            data: parametros,
            url: 'empresa',
            type: 'GET',
            beforeSend: function () {
            },
            success: function (response) {
               document.getElementById("provincias").innerHTML="";
               console.log(response.toString());
               document.getElementById("provincias").innerHTML=selectProvincias()+response.toString();
               //document.getElementById("provincias").innerHTML=selectProvincias()+response.toString();
            }
        });
    
    
}
function selectProvincias(){
    var valor="";
    valor="<select class='form-control  input-sm' name='provincia' required='required' id='provincia' onchange='obtenerCiudades()'><option value='0' > - Seleccionar Provincias - </option>";
    return valor;
}

function selectCiudades(){
    var valor="";
    valor="<select class='form-control  input-sm' name='ciudad' required='required' id='ciudad'  ><option value='0' > - Seleccione Ciudad - </option>";
    return valor;
}

function obtenerCiudades(){
    var idProvincia=document.getElementById("provincia").value;
    var accion = "obtenerCiudades";
 //  alert(idProvincia);
    if(idProvincia=="0"){
        document.getElementById("ciudades").innerHTML="";
        document.getElementById("ciudad").innerHTML=selectCiudades(); 
        document.getElementById("ciudades").disabled=false;
    }

     var parametros = {
            "accion": accion,
            "idProvincia": idProvincia          
        };
        $.ajax({
            data: parametros,
            url: 'empresa',
            type: 'GET',
            beforeSend: function () {
            },
            success: function (response) {
               document.getElementById("ciudades").innerHTML="";
               console.log(selectCiudades()+response.toString());
               document.getElementById("ciudades").innerHTML=selectCiudades()+response.toString();
               //document.getElementById("provincias").innerHTML=selectProvincias()+response.toString();
            }
        });
    
    
}

function grabaempresa(){
  
    var id_tipo_identificacion=$("#t_identificacion").val();
    var identificacion=$("#identificacion").val();
    var razon_social=$("#razon_social").val();
    var id_pais=$("#pais").val();
    var id_provincia=$("#provincia").val();
    var id_ciudad=$("#ciudad").val();
    var direccion=$("#direccion").val();
    var telefono1=$("#telefono1").val();
    var telefono2=$("#telefono2").val();
    var celular=$("#celular").val();
    var email=$("#mail").val();
    var accion="crea_empresa";
    
    if(id_tipo_identificacion == 0){ MsgSalidaModalE("Debe seleccionar un tipo de identificación");  return;    }
    if(identificacion.length == 0){ MsgSalidaModalE("Debe ingresa el numero de Identificación"); return; }
    if(razon_social.length == 0){  MsgSalidaModalE("Debe de ingresar el nombre de la razón socila");  return; }
    if(id_pais == 0){  MsgSalidaModalE("Seleccione un País"); return; }
    if(id_provincia == 0){  MsgSalidaModalE("Seleccione una Provincia"); return; }
    if(id_ciudad == 0){  MsgSalidaModalE("Seleccione una Ciudad"); return; }
    if(direccion.length == 0){  MsgSalidaModalE("Ingrese la dirección de empresa"); return; }
    if(telefono1.length == 0 && telefono2.length == 0 && celular.length == 0 )
    {  MsgSalidaModalE("Ingrese por lo menos un numero de teléfono"); return; }
    if(email.length == 0){  MsgSalidaModalE("Ingrese un correo"); return; }
    // MsgSalidaModal("ok");
    // return;
         var parametros = {
            "accion": accion,
            "id_tipo_identificacion": id_tipo_identificacion,
            "identificacion":identificacion,
            "razon_social": razon_social,
            "id_pais": id_pais,
            "id_provincia": id_provincia,
            "id_ciudad": id_ciudad,
            "direccion": direccion,
            "telefono1": telefono1,
            "telefono2": telefono2,
             "celular": celular,
            "email": email            
        };
        
         $.ajax({
            data: parametros,
            url: 'empresa',
            type: 'post',
            beforeSend: function () {
            },
            success: function (response) {
               MsgSalidaModal(response.toString());
               frm_empresa();
            }
        });
    
    
}



