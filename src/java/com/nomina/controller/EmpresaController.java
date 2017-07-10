/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nomina.controller;

import com.nomina.model.ClCiudad;
import com.nomina.model.ClEmpresas;
import com.nomina.model.ClPais;
import com.nomina.model.ClProvincia;
import com.nomina.model.ClTiposIdentificacion;
import com.nomina.servicios.EmpresaServicios;
import com.nomina.servicios.PaisServicios;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author stalyn
 */
public class EmpresaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        EmpresaServicios emp = new EmpresaServicios(); 
        PaisServicios pais = new PaisServicios();
        String accion;
        accion = request.getParameter("accion");
        String tbEmpresa="",listPaises="";  
        
        if (accion.equals("listar")) {
            
        
         tbEmpresa = emp.getClEmpresas2();
         request.setAttribute("tbEmpresa", tbEmpresa);
    
         request.getRequestDispatcher("aplicacion/empresa/listar_empresa.jsp").forward(request, response);
               
         
        }
        if (accion.equals("frm_agregar")) {
         listPaises=pais.getClPaises();
         request.setAttribute("listPaises", listPaises);
         request.getRequestDispatcher("aplicacion/empresa/frm_empresa.jsp").forward(request, response);
        
        }
        
        if (accion.equals("obtenerProvincias")) {
         int IdPais=Integer.parseInt(request.getParameter("idPais"));
         String listProvincias=pais.getClProvincias(IdPais);
         response.getWriter().println(listProvincias);  
        // request.setAttribute("listPaises", listPaises);
         
        // request.getRequestDispatcher("aplicacion/empresa/frm_empresa.jsp").forward(request, response);
        
        }
        
         if (accion.equals("obtenerCiudades")) {
         int IdProvincia=Integer.parseInt(request.getParameter("idProvincia"));
         String listCiudades=pais.getClCiudades(IdProvincia);
         response.getWriter().println(listCiudades);  
        
        }
        if (accion.equals("crea_empresa")) {
                       
         int id_tipo_identificacion=Integer.parseInt(request.getParameter("id_tipo_identificacion"));
         int id_pais=Integer.parseInt(request.getParameter("id_pais"));
         int id_provincia=Integer.parseInt(request.getParameter("id_provincia"));
         int id_ciudad=Integer.parseInt(request.getParameter("id_ciudad"));
         String identificacion=request.getParameter("identificacion");
         String razon_social=request.getParameter("razon_social");
         String direccion=request.getParameter("direccion");
         String telefono1=request.getParameter("telefono1");
         String telefono2=request.getParameter("telefono2");
         String celular=request.getParameter("celular");
         String email=request.getParameter("email");
         int idEmpresa=Integer.parseInt(emp.getNext().toString());
         Date fecha_registro = new Date();
         try{
        emp.addEmpresa(new ClEmpresas(idEmpresa,
                    new ClCiudad(id_ciudad),
                    new ClPais(id_pais),
                    new ClProvincia(id_provincia),
                    new ClTiposIdentificacion(id_tipo_identificacion),
                    identificacion,
                    razon_social.toUpperCase(),
                    direccion.toUpperCase(),
                    telefono1,
                    telefono2,
                    celular,
                    email.toLowerCase(),  fecha_registro,
                    null,                    "A"                    ));
           } catch (Exception ex) {
                Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
                 response.getWriter().println("Promblemas al intentar Guardar datos de la empresa");  
            }



         response.getWriter().println("Registrado Exitosamente...");  
        
        }
         
         
         //   cs.addCargos(new LcCargos(id_cargo, (new LcEmpresa(empresa)), cargo, observacion, fecha_reg, "A", null));
         /*
          public void addCargos(LcCargos cargos){
    SessionFactory factory=HibernateUtil.getSessionFactory();
    Session session= factory.openSession();
    Transaction tx=session.beginTransaction();
    session.save(cargos);
    tx.commit();
    session.close();
    }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
