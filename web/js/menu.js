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