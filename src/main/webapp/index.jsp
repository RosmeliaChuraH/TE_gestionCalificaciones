
<%@page import="com.emergentes.Calificacion"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listacal") == null) {
        ArrayList<Calificacion> lisaux = new ArrayList<Calificacion>();
        session.setAttribute("listacal", lisaux);
    }
    ArrayList<Calificacion> lista = (ArrayList<Calificacion>) session.getAttribute("listacal");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="border: 2px solid #000; padding: 10px; width: 300px; margin: 0 auto;">
            <div align="center">
                <h3>PRIMER PARCIAL TEM-742</h3>
                <h3><strong>Nombre:</strong> Rosmelia Chura</h3>
                <h3><strong>Carnet:</strong> 12389962</h3>
            </div>
        </div>
        <h1 align="center">Registro de Calificaciones</h1>
        <form action="MainServlet" method="GET">
            <input type="hidden" name="op" value="nuevo">
            <button type="submit">Nuevo</button>
        </form>
        <br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>EF(40)</th>
                <th>Nota</th>
                <th></th>
                <th></th>   
            </tr>
            <%
                if (lista != null) {
                    for (Calificacion item : lista) {
                // Calcula la suma de las notas p1, p2 y ef
                int sumaNotas = item.getP1() + item.getP2() + item.getEf();
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombres()%></td>
                <td><%= item.getP1()%></td>
                <td><%= item.getP2()%></td>
                <td><%= item.getEf()%></td>
                <!-- Muestra la suma de las notas -->
                <td><%= sumaNotas %></td>
                
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                       onclick="return(confirm('Esta seguro de eliminar??'))"
                       >Eliminar</a>
                </td>
            </tr>
            <%                    }
                }
            %>
        </table>
    </body>
</html>



