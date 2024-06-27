<%-- 
    Document   : agregar
    Created on : 31 may 2024, 15:21:21
    Author     : HP
--%>
<%-- 
    Document   : agregar
    Created on : 31 may 2024, 15:21:21
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.clsEEmpleado"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Empleado</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 50px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #666;
        }

        a:hover {
            color: #333;
        }
    </style>
</head>
<body>
<%
EmpleadoDAO dao = new EmpleadoDAO();
String vdni = (String) request.getAttribute("vdni");
out.println("el valor de vdni: " + vdni);
clsEEmpleado objEE = dao.Buscar(vdni);
%>
<h1>Modificar Empleado</h1>
<form action="ControladorEmpleado">
    DNI: <br>
    <input type="text" name="txtdni" value="<%= objEE.getDni() %>">
    NOMBRE: <br>
    <input type="text" name="txtnom" value="<%= objEE.getNombre() %>"><br>
    APELLIDO: <br>
    <input type="text" name="txtape" value="<%= objEE.getApellido() %>"><br>
    CONTRASEÑA: <br>
    <input type="text" name="txtcon" value="<%= objEE.getContraseña() %>"><br>
    CARGO: <br>
    <input type="text" name="txtcar" value="<%= objEE.getCargo() %>"><br>

    <input type="hidden" name="txtvdni" value="<%= objEE.getDni() %>"><br>
    <input type="submit" name="accion" value="Actualizar"><br>
</form>
</body>
</html>
