<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.clsECiudad"%>
<%@page import="ModeloDAO.CiudadDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Ciudad</title>
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
CiudadDAO dao = new CiudadDAO();
Integer vid = Integer.parseInt(request.getParameter("vId"));
clsECiudad objEC = dao.Buscar(vid);
%>
<h1>Modificar Ciudad</h1>
<form action="ControladorCiudad">
    
    ID: <br>
    <input type="text" name="txtid" value="<%= objEC.getId() %>" readonly><br>
    NOMBRE: <br>
    <input type="text" name="txtnom" value="<%= objEC.getNombre() %>"><br>
    
    <!-- Corregir el nombre del parámetro oculto a txtvid -->
    <input type="hidden" name="txtvid" value="<%= objEC.getId() %>"><br>
    <input type="submit" name="accion" value="Actualizar"><br>
</form>
</body>
</html>
