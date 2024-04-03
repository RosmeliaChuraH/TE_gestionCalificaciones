<%-- 
    Document   : editar
    Created on : 2 abr 2024, 19:03:04
    Author     : Mi-Pc
--%>

<%@page import="com.emergentes.Calificacion"%>
<%
    Calificacion reg = (Calificacion) request.getAttribute("miobjcal");
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
        <div style="border: 2px solid #000; padding: 10px; width: max-content; margin: 0 auto;">
            <form action="MainServlet" method="post">
                <table>
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="id" value="<%= reg.getId()%>" size="2" readonly></td>
                    </tr>
                    <tr>
                        <td>Nombre del estudiante:</td>
                        <td><input type="text" name="nombres" value="<%= reg.getNombres()%>"></td>
                    </tr>
                    <tr>
                        <td>Primer parcial(sobre 30 pts):</td>
                        <td><input type="text" name="p1" value="<%= reg.getP1()%>"></td>
                    </tr>
                    <tr>
                        <td>Segundo parcial(sobre 30 pts):</td>
                        <td><input type="text" name="p2" value="<%= reg.getP2()%>"></td>
                    </tr>
                    <tr>
                        <td>Examen final(sobre 40 pts)</td>
                        <td><input type="text" name="ef" value="<%= reg.getEf()%>"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Enviar"></td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
