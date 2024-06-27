<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.clsECliente"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
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

            .button, .back-button {
                margin: 5px;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                background-color: #4CAF50;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.3s ease;
                text-decoration: none;
                display: inline-block;
            }

            .button:hover, .back-button:hover {
                background-color: #45a049;
                transform: scale(1.05);
            }

            .button-container {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

        </style>
    </head>
    <body>
        <header>
            <h1>Listado de Clientes</h1>
        </header>
        <div class="container">
            <div class="button-container">
                <a class="back-button" href="index.jsp">Regresar</a>
                <a class="button" href="ControladorCliente?accion=add">Agregar</a>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>DNI</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Celular</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    ClienteDAO dao = new ClienteDAO();
                    List<clsECliente> list = dao.listar();
                    for (clsECliente cliente : list) {
                    %>
                    <tr>
                        <td><%=cliente.getDni()%></td>
                        <td><%=cliente.getNombre()%></td>
                        <td><%=cliente.getApellido()%></td>
                        <td><%=cliente.getCelular()%></td>
                        <td>
                            <a class="button" href="ControladorCliente?accion=edit&vdni=<%= cliente.getDni()%>">Editar</a>
                            <a class="button" href="ControladorCliente?accion=eliminar&vdni=<%= cliente.getDni()%>">Eliminar</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
