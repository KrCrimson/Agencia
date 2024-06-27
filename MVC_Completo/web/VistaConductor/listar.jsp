<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.clsEConductor"%>
<%@page import="ModeloDAO.ConductorDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Conductores</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        .container {
            width: 90%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
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
            display: inline-block;
            margin: 5px;
            padding: 8px 16px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
        .action-buttons a {
            margin: 0 5px;
        }
        .action-buttons a.edit {
            background-color: #FFA500;
        }
        .action-buttons a.edit:hover {
            background-color: #FF8C00;
        }
        .action-buttons a.delete {
            background-color: #FF6347;
        }
        .action-buttons a.delete:hover {
            background-color: #FF4500;
        }
    </style>
</head>
<body>
    <header>
        <h1>Listado de Conductores</h1>
    </header>
    <div class="container">
        <a href="ControladorConductor?accion=add">Agregar</a>
        <table>
            <thead>
                <tr>
                    <th>DNI</th>
                    <th>Licencia</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                ConductorDAO dao = new ConductorDAO();
                List<clsEConductor> list = dao.listar();
                for (clsEConductor conductor : list) {
                %>
                <tr>
                    <td><%=conductor.getDni()%></td>
                    <td><%=conductor.getLicencia()%></td>
                    <td><%=conductor.getNombre()%></td>
                    <td><%=conductor.getApellido()%></td>
                    <td class="action-buttons">
                        <a href="ControladorConductor?accion=editar&dni=<%= conductor.getDni()%>" class="edit">Editar</a>
                        <a href="ControladorConductor?accion=eliminar&dni=<%= conductor.getDni()%>" class="delete">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
