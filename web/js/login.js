$('#btningresar').click(function(e){
   e.preventDefault();

var user=$('#user').val();
var pass=$('#pass').val();
var accion="autorizar";

 if(user == "" ||  user == null){ MsgOutPut("Debe ingresar Usuario"); return false;}
 if(pass == "" ||  pass == null){ MsgOutPut("Debe ingresar Contraseña"); return false;}

  var parametros = {
              "user" : user,
              "pass" : pass,
              "accion":accion
                 };
        $.ajax({
                data:  parametros,
                url:   'autoriza',
                type:  'post',
                beforeSend: function () {                      
                } ,
               success:  function (response) {
                   var repuesta=response.toString();
                   
                      if(/true/.test(repuesta)){                 
                      		window.location="/nominaec/home";
                      }else{
                        document.getElementById("user").value = ""; 
                        document.getElementById("pass").value = "";  
                      	MsgOutPut('Usuario Incorrecto');
                        
                      	//location.reload(true);
                      	}                   
                }
        });



});

$('#btnsalir').click(function(e){
   e.preventDefault();

 var r = confirm("Esta seguro que desea salir del sistema?");
    if (r) {
       window.location.href = 'logout.php'
    }

});




function MsgOutPut(msg){
var msg=msg;
var modal="<div class='modal fade' id='myModal' role='dialog'> "+
    "<div class='modal-dialog'> "+
      "<div class='modal-content'> "+
        "<div class='modal-header modal-header-warning'> "+
          "<button type='button' class='close' data-dismiss='modal'>&times;</button> "+
          "<h4 class='modal-title'>ALERTA!!!...</h4> "+
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