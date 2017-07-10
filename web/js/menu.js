function outlogin()
{      

 var URLactual = window.location;
  // console.log(URLactual);
   var url =URLactual.toString();
                if(/home#/.test(URLactual)){
                 // console.log(URLactual);
                  
                  // console.log(url);
                    url=url.replace("home#","autoriza?accion=outlogin");
                //  console.log('reemplazo');
                 // console.log(url);
                  // location.href="http://localhost:8080/nominaec/";
                }else if(/home/.test(URLactual)){
                 // console.log(URLactual);                  
                 //  console.log(url);
                    url=url.replace("home","autoriza?accion=outlogin");
                 // console.log('reemplazo');
                //  console.log(url);
                  // location.href="http://localhost:8080/nominaec/";
                }
              
    //if(confirm("¿Esta seguro que desea Salir?")){
         console.log(url); 
         console.clear()
    location.href=url;//"http://localhost:8080/nominaec/autoriza?accion=outlogin";
    //}
}

function empresa()
{       jQuery("#idContenido").html("<br/><br/><center><img alt='cargando' src='dist/img/hourglass.gif' /><center>"); 
        jQuery("#idContenido").load("empresa?accion=listar",{},function(){ });
}

function MsgSalidaModalE(msg){
var msg=msg;
var modal="<div class='modal fade' id='myModal' role='dialog'> "+
    "<div class='modal-dialog'> "+
      "<div class='modal-content'> "+
        "<div class='modal-header modal-header-warning'> "+
          "<button type='button' class='close' data-dismiss='modal'>&times;</button> "+
          "<h4 class='modal-title'> <span class='glyphicon glyphicon glyphicon-exclamation-sign text-danger'></span> <FONT COLOR='red'>ALERTA!!!... </FONT> </h4> "+
        "</div> "+
        "<div class='modal-body'> "+
          "<p>"+msg+"</p> "+
        "</div> "+
        "<div class='modal-footer'> "+
          "<button type='button' class='btn btn-primary' data-dismiss='modal'>Cerrar</button> "+
        "</div> "+
     " </div> "+      
   " </div> "+
  "</div>";
document.getElementById("mensajeSalida").innerHTML = modal; 
 $("#myModal").modal();

}

function MsgSalidaModal(msg){
var msg=msg;
var modal="<div class='modal fade' id='myModal' role='dialog'> "+
    "<div class='modal-dialog'> "+
      "<div class='modal-content'> "+
        "<div class='modal-header modal-header-warning'> "+
          "<button type='button' class='close' data-dismiss='modal'>&times;</button> "+
          "<h4 class='modal-title'>   <span class='glyphicon glyphicon glyphicon-check text-success'></span> <FONT COLOR='green'>Mensaje!!!...</FONT></h4> "+
        "</div> "+
        "<div class='modal-body'> "+
          "<p>"+msg+"</p> "+
        "</div> "+
        "<div class='modal-footer'> "+
          "<button type='button' class='btn btn-primary' data-dismiss='modal'>Cerrar</button> "+
        "</div> "+
     " </div> "+      
   " </div> "+
  "</div>";
document.getElementById("mensajeSalida").innerHTML = modal; 
 $("#myModal").modal();

}