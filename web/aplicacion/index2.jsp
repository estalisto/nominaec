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
<title>Nomina EC</title>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="dist/img/etiqueta.png" />
<link rel="stylesheet" href="dist/css/bootstrap.min.css">

</head>
 
<body  STYLE="background-color:#EAE1DF">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/listok/">Nómina EC</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        


  <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Configuración <span class="caret"></span></a>
          <ul class="dropdown-menu">
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

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div id="cotenido" >
  
</div>

 

   
     

<script src="jQuery/jquery-2.2.3.min.js"></script>
<!--script src="../jQuery/jquery.maskMoney.js"></script-->
<script src="dist/js/bootstrap.min.js"></script>
<script src="/aplication/javascripts/menu.js" type="text/javascript" charset="utf-8" async defer></script>
<script src="js/login.js"></script>
</body>
</html>
