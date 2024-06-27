<%-- 
    Document   : editar
    Created on : 31 may 2024, 15:21:36
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Empleado</title>
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
    </style>
</head>
<body>        
    <h1>Agregar Empleado</h1>
    <form action="ControladorEmpleado">
        DNI: <BR>
        <input type="text" name="txtdni"><br> 
        NOMBRES: <BR>
        <input type="text" name="txtnom"><br> 
        APELLIDO: <BR>
        <input type="text" name="txtape"><br> 
        CONTRASEÑA: <BR>
        <input type="text" name="txtcon"><br> 
        CARGO: <BR>
        <input type="text" name="txtcar"><br> 

        <input type="submit" name="accion" value="Agregar"><br>
    </form>
</body>
</html>

