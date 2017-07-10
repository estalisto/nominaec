/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nomina.servicios;

import com.nomina.model.ClCiudad;
import com.nomina.model.ClPais;
import com.nomina.model.ClProvincia;
import com.nomina.model.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author stalyn
 */
public class PaisServicios {
    
    
    public String getClPaises(){
         
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        // hacemos la transaccion
        String RowPaises=""; 
        Query q = session.createQuery("from ClPais  E WHERE E.estado= :estado");
        q.setParameter("estado","A");
        List<ClPais> lista=q.list();        
            for(ClPais datos:lista )
            { 
               RowPaises+="<option value='"+datos.getIdPais()+"' >"+datos.getPais()+"</option>";  
               
            }
            tx.commit();
            session.close();

         return RowPaises;
            
        }
    public String getClProvincias(int IdPais){
         
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        // hacemos la transaccion
        String RowProvincias=""; 
        Query q = session.createQuery("from ClProvincia  E WHERE E.clPais.idPais=:IdPais AND E.estado= :estado ORDER BY provincia" );
        q.setParameter("IdPais",IdPais);
        q.setParameter("estado","A");
        List<ClProvincia> lista=q.list();        
            for(ClProvincia datos:lista )
            { 
               RowProvincias+="<option value='"+datos.getIdProvincia()+"' >"+datos.getProvincia()+"</option>";  
               
            }
            tx.commit();
            session.close();
            
         return RowProvincias;
            
        }
    public String getClCiudades(int IdProvincia){
         
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        // hacemos la transaccion
        String RowProvincias=""; 
        Query q = session.createQuery("from ClCiudad  E WHERE E.clProvincia.idProvincia=:IdProvincia AND E.estado= :estado ORDER BY ciudad" );
        q.setParameter("IdProvincia",IdProvincia);
        q.setParameter("estado","A");
        List<ClCiudad> lista=q.list();        
            for(ClCiudad datos:lista )
            { 
               RowProvincias+="<option value='"+datos.getIdCiudad()+"' >"+datos.getCiudad()+"</option>";  
               
            }
            tx.commit();
            session.close();
            
         return RowProvincias;
            
        }
}
