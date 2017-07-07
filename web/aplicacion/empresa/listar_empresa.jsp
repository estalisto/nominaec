<%-- 
    Document   : listar_empresa
    Created on : 03/07/2017, 17:16:46
    Author     : stalyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


    <!DOCTYPE html>
<html>
<head>

  <div>
       <ol class="breadcrumb">
                <li class="active"><a href="#"  onclick="empresa(this)">Lista Empresas</a></li>
                <li ><a href="#"  onclick="frm_empresa(this)">Registra Empresas</a></li>
       </ol> 
      <section class="content">
         
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
           
            <!-- /.box-header -->
            <div class="box-body" style="overflow-x:scroll;">
               
              <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th class="hidden">ID</th>
                  <th>R.U.C.</th>
                  <th>Razón Social</th>
                  <th>Dirección </th>
                  <th>Télefonos </th>
                  <th>E-Mail </th>
                  <th>Fecha Ingreso </th>
                  <th>Estado</th>
                  <th>Acción </th>
                </tr>
                </thead>
                <tbody>
                    <%= request.getAttribute("tbEmpresa") %>
                
                </tbody>

              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
  </div>
  <!-- /.content-wrapper -->
  
  <script src="js/empresa.js"></script>  

  
<!--script>
  $(function () {

    $('#example1').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
  
</script-->
  
</body>
</html>

