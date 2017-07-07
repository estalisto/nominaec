/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nomina.controller;

import com.nomina.modal.ClEmpresas;
import com.nomina.servicios.EmpresaServicios;
import com.nomina.servicios.PaisServicios;
import java.io.IOException;
import java.util.List;
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
