/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nomina.servicios;

import com.nomina.modal.HibernateUtil;
import com.nomina.modal.LcUsers;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author stalyn
 */
public class UsuariosServicios {
 
     ArrayList<LcUsers> usuarioOK;
     List<LcUsers> usuarioOK2;
     public ArrayList<LcUsers> getLcValidaUser(String user ,String pass){
        SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        // hacemos la transaccion
        ArrayList<LcUsers> arreglo = new ArrayList<LcUsers>();
        Query q = session.createQuery("from LcUsers E WHERE E.usuario= :usuario and E.contrasenia= :contrasenia  and E.estado = :estado ");
        q.setParameter("usuario",user);
        q.setParameter("contrasenia",pass);
        q.setParameter("estado","A");
        List<LcUsers> lista=q.list();
        Iterator<LcUsers> iter=lista.iterator();
        tx.commit();
        session.close();
        //agrega los datos en la lista
        while(iter.hasNext())
        {
            LcUsers rol= (LcUsers) iter.next();
            arreglo.add(rol);
        }
        
        return arreglo;
    }
       public List<LcUsers> getLcValidaUserEx(String user ,String pass){
         SessionFactory sesion = HibernateUtil.getSessionFactory();
        Session session;
        session = sesion.openSession();
        Transaction tx= session.beginTransaction();
        Query q = session.createQuery("from LcUsers E WHERE E.usuario= :usuario and E.contrasenia= :contrasenia  and E.estado = :estado ");
        q.setParameter("usuario",user);
        q.setParameter("contrasenia",pass);
        q.setParameter("estado","A");
        List<LcUsers> lista=q.list();        
         for(LcUsers mrol:lista )
        {
              System.out.println("user1: "+mrol.getUsuario()+mrol.getId());
        }
        tx.commit();
        session.close();
        return lista;
    }
       
    public boolean getValidaUsuario(String user, String pass){
         String encript=DigestUtils.sha1Hex(pass);
            System.out.println("shaHex:"+DigestUtils.sha1Hex(pass));  
        // try{  
         usuarioOK=getLcValidaUser(user,encript);
        /* }catch(Exception excepcion)
	{
	excepcion.printStackTrace();
        System.out.println("error en la consulta");
	}
	finally
	{
	        System.out.println("Se ejecuta finally");
	}
       */
         if (!usuarioOK.isEmpty() && usuarioOK.size()<= 1 ){    
             return !usuarioOK.isEmpty();  
             
            }else{
     
                usuarioOK2=getLcValidaUserEx(user,encript);
                return !usuarioOK2.isEmpty();     
            }
         
        }
    
    
    
}
