<%-- 
    Document   : login
    Created on : 30/06/2017, 18:06:27
    Author     : stalyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <!--  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
<title>Nómina EC</title>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="dist/img/etiqueta.png" />
<link rel="stylesheet" href="dist/css/bootstrap.min.css">
    </head>
    <body>
        <br>
<br>
<br>
<div id="mensajeSalida"></div>
       <div class="row">
           <div class="col-lg-2"></div>
        <div class="col-lg-4">
            <div class="container">
               
            <img src="https://i0.wp.com/estalisto.files.wordpress.com/2017/07/nominasgranda.png?ssl=1&w=450" class="img-rounded" alt="" width="404" height="350"> 
          </div>
        </div>
        <div class="col-lg-6"></div>
        <table   style="font-family: arial;  font-size: 14px;" >
  <tr>
    
    <td style="vertical-align:top; padding:5px 5px 5px 10px;  border-left: 4px solid #75c8fd" >
        
     <div class="login-box-body">
             
       <center> <img
         src="https://i1.wp.com/estalisto.files.wordpress.com/2017/06/etiqueta.png?ssl=1&w=450" 
         alt="" 
         width="50" 
         height="50" 
         style="display:block; margin-right: 5px; border-radius: 50%"></center> 
                    <form class="" action="#" method="post">

                          <div class="form-group has-feedback">
                          	<label>Usuario:</label>
                                  <input id="user" type="text" class="form-control" placeholder="Ingrese Usuario">
                                  <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                          </div>
                          <div class="form-group has-feedback">
                          	<label>Contraseña:</label>
                                  <input id="pass" type="password" class="form-control" placeholder="Ingrese Contraseña">
                                  <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                          </div>
                          <div class="form-group has-feedback">       
                          	<button id="btningresar" type="button" class="btn btn-primary"> Ingresar </button>
                        	  </div>
                    </form>
            </div>   
        
    </td>
        
        
        
        
        
     
      <br>
      <p style='font-size:0.85em; margin: 2px 0 5px'>
          <span  style="   margin: 0;  color: #666" ></span>
     
          
      
      </p>
    </td>
  </tr>
</table>
</div>
    </body>
    <script src="jQuery/jquery-2.2.3.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="js/login.js"></script>
</html>
