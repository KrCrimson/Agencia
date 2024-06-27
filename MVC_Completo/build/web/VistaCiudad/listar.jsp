<%-- 
    Document   : listar
    Created on : 30 may 2024, 15:55:02
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.clsECiudad"%>
<%@page import="ModeloDAO.CiudadDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Ciudad</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            margin-right: 10px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Listado de Ciudad</h1>
    </header>
    <div class="container">
        <a href="ControladorCiudad?accion=add">Agregar Empleado</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <% 
                // Obtiene la lista de empleados desde el negocio
                CiudadDAO dao = new CiudadDAO();
                List<clsECiudad> list = dao.ListarCiudad();
                
                // Itera sobre la lista de empleados y los muestra en la tabla
                for (clsECiudad objEC : list) {
                %>
                <tr>
                    <td><%=objEC.getId()%></td>
                    <td><%=objEC.getNombre()%></td>
                    <td>
                        <a href="ControladorCiudad?accion=edit&vId=<%= objEC.getId()%>">Editar</a>
                        <a href="ControladorCiudad?accion=eliminar&vId=<%= objEC.getId()%>">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>