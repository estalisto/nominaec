/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nomina.servicios;

import com.nomina.model.ClEmpresas;
import com.nomina.model.HibernateUtil;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author stalyn
 */
public class EmpresaServicios {
    
     public Long getNext() {
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        Query query = session.createSQLQuery( "select nextval('cl_empresas_id_empresa_seq')" );
        Long key = ((BigInteger) query.uniqueResult()).longValue();   
        tx.commit();  
        session.close();
    return key; // return ((BigInteger) query.uniqueResult()).longValue();
    }
    
     public List<ClEmpresas> getClEmpresas(){
         
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        // hacemos la transaccion
     
        Query q = session.createQuery("from ClEmpresas  E WHERE E.estado= :estado");
        q.setParameter("estado","A");
        List<ClEmpresas> lista=q.list(); 
            for(ClEmpresas emp:lista )
            {
                 System.out.println("ok: "+emp.getRazonSocial()+emp.getIdEmpresa());
               
            }
            tx.commit();
            session.close();

         return lista;
            
        }
     
     public String getClEmpresas2(){
         
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        // hacemos la transaccion
      String RowEmpresas="", estado=""; 
          SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        Query q = session.createQuery("from ClEmpresas  E WHERE E.estado= :estado");
        q.setParameter("estado","A");
        List<ClEmpresas> lista=q.list(); 
       
            for(ClEmpresas emp:lista )
            { 
                  if ("A".equals(emp.getEstado())){ estado="ACTIVO";} 
                  if ("I".equals(emp.getEstado())){ estado="INACTIVO";}
                  
                  RowEmpresas+="<tr   bgcolor=\"#E0ECF8\">";   
                    RowEmpresas+="<td class=\"hidden\">"+emp.getIdEmpresa()+"</td>";   
                    RowEmpresas+="<td>"+emp.getIdentificacion()+"</td>";   
                    RowEmpresas+="<td>"+emp.getRazonSocial()+"</td>";   
                    RowEmpresas+="<td>"+emp.getDireccion()+"</td>";
                    RowEmpresas+="<td>"+emp.getTelefonos1() +" "+emp.getTelefonos2()+" "+emp.getCelular()+"</td>";
                    RowEmpresas+="<td>"+emp.getEmail()+"</td>"; 
                    RowEmpresas+="<td>"+formatter.format(emp.getFechaCreacion())+"</td>";                      
                    RowEmpresas+="<td>"+estado+"</td>";   
                    RowEmpresas+="<td><a  onclick=\"ConnsultaDatosID(emp.getIdEmpresa())\" ><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>\n" +
"                              <a onclick=\"deletempresa(emp.getIdEmpresa())\"> <span  class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a></td>";  
                  RowEmpresas+="</tr>";  
               
            }
            tx.commit();
            session.close();

         return RowEmpresas;
            
        }
      public void addEmpresa(ClEmpresas empresa){
        SessionFactory factory=HibernateUtil.getSessionFactory();
        Session session= factory.openSession();
        Transaction tx=session.beginTransaction();
        session.save(empresa);
        tx.commit();
        session.close();
      }
      

     
     
}
