
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String op = request.getParameter("op");
        //adicionamos variables
        Calificacion objcal = new Calificacion();
        int id, pos;
        
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>)ses.getAttribute("listacal");
        
        switch(op){
            case "nuevo":
                //enviar un objeto vacio a editar
                request.setAttribute("miobjcal", objcal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                //enviar un objeto a editar pero con contenido
                id = Integer.parseInt(request.getParameter("id"));
                //averiguar la posicion el elemento en la lista
                pos = buscarPorIndice(request, id);
                //obtener el objeto
                objcal = lista.get(pos);
                request.setAttribute("miobjcal", objcal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                //eliminar el registro de la coleccion segun el id
                id = Integer.parseInt(request.getParameter("id"));
                //averiguar la posicion el elemento en la lista
                pos = buscarPorIndice(request, id);
                if (pos >=0){
                    lista.remove(pos);
                }
                request.setAttribute("listacal", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
        }
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>)ses.getAttribute("listacal");
        Calificacion objcal = new Calificacion();
        objcal.setId(id);
        objcal.setNombres(request.getParameter("nombres"));
        objcal.setP1(Integer.parseInt(request.getParameter("p1")));
        objcal.setP2(Integer.parseInt(request.getParameter("p2")));
        objcal.setEf(Integer.parseInt(request.getParameter("ef")));
        if (id == 0){
            //nuevo registro
            int idNuevo = obtenerId(request);
            objcal.setId(idNuevo);
            lista.add(objcal);
        }else{
            //edicion de registro
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objcal);
        }
        request.setAttribute("listacal", lista);
        response.sendRedirect("index.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

     public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>)ses.getAttribute("listacal");
        
        int pos = -1;
        if(lista != null){
            for (Calificacion ele : lista){
                ++pos;
                if (ele.getId() == id){
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        //buscar el ultimo ID
        int idn =0;
        for ( Calificacion ele : lista){
            idn = ele.getId();
        }
        return idn +1;
    }
}
