<%-- 
    Document   : Home
    Created on : 01-Jul-2017, 11:50:46
    Author     : stalyn Granda
--%>

<%
    String nombreUsuauario="", idUsuario="";
    HttpSession sesion = request.getSession(true);
    
    try {
     if (sesion.getAttribute("SSNombreUsuario")== null && sesion.getAttribute("SSIdUsuario")==null){
                  
                  sesion.invalidate();
                  response.sendRedirect("login");
              //out.print("<script>location.replace('login.jsp');<script>");
              return;

        }else {
         
         
        nombreUsuauario = sesion.getAttribute("SSNombreUsuario").toString();
        idUsuario = sesion.getAttribute("SSIdUsuario").toString();
        
        }
        
    } catch (Exception e) {
       // Sidentificacion = "000";
       response.sendRedirect("/nominaec/login"); 
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
 
<html lang="es">
 
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <link rel="icon" type="image/png" href="dist/img/etiqueta.png" />

   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nómina EC</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">
   <!--  <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    IE10 viewport hack for Surface/desktop Windows 8 bug 
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Custom styles for this template 
    <link href="navbar.css" rel="stylesheet">-->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

     <!-- Fixed navbar -->
    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand active"  href="/nominaec/home">Nómina EC</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            
                    <ul class="nav navbar-nav navbar-right">
        


  <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Configuración <span class="caret"></span></a>
          <ul class="dropdown-menu">
              <li><a href="#" onclick="empresa();">Empresa</a></li>
            <li><a href="#">Crear Usuario</a></li>
            <li><a href="#">Asginar Modulos</a></li>
            <li><a href="#">Crear Roles</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Email</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
 </li>
   <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Punto de Venta <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Crear Punto de Venta</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contabilidad <span class="caret"></span></a>
          <ul class="dropdown-menu">
    <li><a href="#">Ventas</a></li>
    <li><a href="#">Devoluciones de Ventas</a></li>
    <li><a href="#">Compras</a></li>
    <li><a href="#">Devoluciones de Compras</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Libro Diario</a></li>
    <li><a href="#">Balances</a></li>
    <li><a href="#">Periodo Fiscal</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Plan de Cuentas</a></li>
          </ul>
        </li>
   <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Bancos <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
                <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User: Stalyn Granda <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Perfil</a></li>
            <li><a href="#">Configuración</a></li>
      
            <li role="separator" class="divider"></li>
            <li><a href="#" id="btnsalir">Cerrar Sesión</a></li>
          </ul>
        </li>
   
      </ul>

      <form  class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" class="form-control input-sm" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default btn-sm">Buscar</button>
      </form>
      <ul class="nav navbar-nav navbar-right"  >


      </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div id="mensajeSalida"></div>
      <div id="idContenido">
              
      
      
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster
    <script src="dist/plugins/jquery.maskedinput.min.js" type="text/javascript"></script>-->
<script src="jQuery/jquery-2.2.3.min.js"></script>
<!--script src="../jQuery/jquery.maskMoney.js"></script-->
<script src="dist/js/bootstrap.min.js"></script>
<script src="js/menu.js"></script>


  </body>
</html>
