<%-- 
    Document   : passwordRecovery
    Created on : 27 jun. 2024, 02:05:37
    Author     : windows10
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <style>
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
            max-width: 400px;
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

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        input[type="email"] {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Recuperar Contraseña</h1>
        <form action="PasswordRecoveryServlet" method="post">
            <input type="email" name="email" placeholder="Introduce tu correo electrónico" required>
            <button type="submit">Enviar</button>
        </form>
        <p>${message}</p>
    </div>
</body>
</html>
