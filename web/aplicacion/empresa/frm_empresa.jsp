<%-- 
    Document   : frm_empresa
    Created on : 03/07/2017, 17:11:50
    Author     : stalyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <div>
            <ol class="breadcrumb">
                <li><a href="#"  onclick="empresa(this)">Lista Empresas</a></li>
                <li class="active"><a href="#"  onclick="frm_empresa(this)">Registra Empresas</a></li>
            </ol> 
            <div class="col-md-6">                
                    <form name="form" action="empresa" method="post" class="well" id="data">  
                        <div class="box-body">
                            <!-- Color Picker -->
                            <div class="form-group hidden">
                                <input type="text" class="form-control" placeholder="Ingrese Nombre Rol" value="registrar" required="required" name="accion" id="accion">

                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label>Tipo Identificación:</label>
                                        <select class="form-control input-sm" name="t_identificacion" required="required" id="t_identificacion" onchange="validaselector()">
                                            <option value='0' >Seleccionar tipo de identificación</option>
                                            <option value='2' >R.U.C. (Registro Único de Cliente)</option>
                                        </select>
                                    </div>          
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label>Identificación:</label>
                                        <input type="text" class="form-control  input-sm" maxlength="13" placeholder="Ingrese numero identificación" required="required" name="identificacion" id="identificacion" onkeyup="validaLongitudCED_RUC_HTML();">
                                         <div id="valido" class="form-group has-success" style="display: none"> <!--hidden-->
                                            <span class="help-block">Identificación Válida.</span>
                                        </div>
                                        <div id="no_value" class="form-group has-error" style="display: none"> <!--hidden-->
                                            <span class="help-block">Identificación Inválida.</span>
                                        </div><span id="validaLength"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Nombre Empresa:</label>
                                <input type="text" class="form-control  input-sm" placeholder="Ingrese Nombre Empresa" required="required" name="nombre" id="nombre">
                            </div>
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        <label>País</label>
                                        <select class="form-control  input-sm" name="pais" required="required" id="pais" onchange="obtenerProvincias()">
                                            <option value='0' >Seleccionar País</option>
                                            <%= request.getAttribute("listPaises") %>
                                            
                                        </select>
                                    </div>      
                                </div>    
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        <label>Provincia</label>
                                        <div id="provincias">
                                        <select class="form-control  input-sm" name="provincia" required="required" id="provincia" onchange="obtenerCiudades()">
                                            <option value='0' > - Seleccionar Provincias - </option>
                                        </select></div>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        
                                        <label>Ciudad</label>
                                        <div id="ciudades">
                                        <select class="form-control  input-sm" name="ciudad"   required="required" id="ciudad" >
                                            <option value='0' >- Seleccionar Ciudad -</option>
                                            
                                        </select></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Dirección:</label>
                                <textarea type="text" class="form-control  input-sm" placeholder="Ingrese Dirección" required="required" name="direccion" id="direccion"></textarea>
                            </div>
                            <div class=" form-group">
                                <label>E-mail de Contacto:</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input type="email" onkeyup="ValidaEmailOk();"  class="form-control  input-sm" placeholder="Email"  required="required" name="mail" id="mail">
                                  
                                </div>  <span id="emailOK"></span>
                            </div>
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="form-group">     
                                        <label>Teléfono:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-phone"></i>
                                            </div>
                                            <input type="number" maxlength="10" class="form-control  input-sm" placeholder="029999999" name="telefono" id="telefono"   >
                                        </div>

                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        <label>Teléfono 2:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-phone"></i>
                                            </div>
                                            <input type="number" maxlength="10" class="form-control  input-sm"  placeholder="029999999"   name="telefono2" id="telefono2" >
                                        </div>                
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        <label>Celular:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-phone"></i>
                                            </div>
                                            <input type="number" SIZE="10" class="form-control  input-sm"  placeholder="0999999999"  name="celular" id="celular" >
                                        </div>
                                    </div>  
                                </div>
                            </div>
                            <div class=" form-group">
                                <!-- <button type="submit" class="btn btn-primary fa fa-save"> Registrar</button>-->
                                <input id="btncrearempresa" type="submit" value="Registrar" class="btn btn-primary"  title="Crea Empresa">
                            </div>
                        </div>  
                    </form>
            
            </div>
            <!-- /.content-wrapper -->
        </div>
        <script src="dist/js/ruc_jquery_validator.min.js"></script>
        <script src="js/empresa.js"></script> 
        <script src="dist/js/validar_cedula_ecuador.js"></script>
        <script src="dist/js/ValidaNumeros.js"></script>
        <script type="text/javascript">
          $('#celular').validCampoFranz('0123456789');    
          $('#telefono').validCampoFranz('0123456789');  
          $('#telefono2').validCampoFranz('0123456789');  
        </script> 
       
    </body>
</html>


