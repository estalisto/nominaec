/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nomina.controller;

import com.nomina.model.LcUsers;
import com.nomina.servicios.UsuariosServicios;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author stalyn
 */
public class AutorizaController extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        UsuariosServicios us = new UsuariosServicios();
        String accion, user, pass;   
        boolean autorizaOK=false;
        accion= request.getParameter("accion");
        if(accion.equals("autorizar"))
        {
            user= request.getParameter("user");
            pass= request.getParameter("pass");
            autorizaOK=us.getValidaUsuario(user, pass);
            
            if(autorizaOK){
                String encript=DigestUtils.sha1Hex(pass);
                List<LcUsers> autoriza=us.getLcValidaUserEx(user, encript);
                 LcUsers dato = autoriza.get(0);
                session.setAttribute("SSNombreUsuario",dato.getUsuario());
                session.setAttribute("SSIdUsuario",dato.getId());
             
                response.getWriter().println("true"); 
            }else{
                response.getWriter().println("false"); 
            }
        
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
