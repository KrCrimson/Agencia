<%-- 
    Document   : agregar
    Created on : 31 may 2024, 15:21:21
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cliente</title>
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
                width: 50%;
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

            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            input[type="text"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            input[type="submit"] {
                padding: 10px;
                border: none;
                border-radius: 4px;
                background-color: #4CAF50;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
                transform: scale(1.05);
            }

            label {
                font-size: 16px;
                color: #555;
            }
        </style>
    </head>
    <body>        
        <header>
            <h1>Agregar Cliente</h1>
        </header>
        <div class="container">
            <form action="ControladorCliente">
                DNI:<BR>
                <input type="text" name="txtdni" ><BR> 

                Nombre:<BR>
                <input type="text" name="txtnom"><BR>

                Apellido:<BR>
                <input type="text" name="txtape"><br>

                Celular:<BR>
                <input type="text" name="txtcel"><BR>

                <input type="submit" name="accion" value="Agregar">
            </form>
        </div>
    </body>
</html>
