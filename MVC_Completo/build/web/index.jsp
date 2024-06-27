<%-- 
    Document   : index
    Created on : 30 may 2024, 15:55:21
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu de Agencia</title>
    <style>
        /* Reset de estilos */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Estilos generales */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 800px;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 2em;
            color: #333;
        }

        .menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
        }

        .menu a, .menu button {
            display: block;
            padding: 10px 20px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .menu a:hover, .menu button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Menu de Agencia</h1>
        <div class="menu">
            <a href="ControladorEmpleado?accion=listar">Ver Empleados</a>
            <a href="ControladorCliente?accion=listar">Ver Clientes</a>
            <a href="ControladorCargo?accion=listar">Ver Cargos</a>
            <a href="ControladorBus?accion=listar">Ver Buses</a>
            <a href="ControladorConductor?accion=listar">Ver Conductores</a>
            <a href="ControladorCiudad?accion=listar">Ver Ciudades</a>
            <a href="ControladorReserva?accion=listar">Reservar</a>
            <form action="ChartDataServlet" method="post">
                <input type="hidden" name="accion" value="generarReporte">
                <button type="submit">Reporte</button>
            </form><br><br>
             
    </div>
        <form action="PasswordRecoveryServlet" method="get">
                <button type="submit">¿Olvidaste tu contraseña?</button>
            </form>
        </div>
</body>
</html>
