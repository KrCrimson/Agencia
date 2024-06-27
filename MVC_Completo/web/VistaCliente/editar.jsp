

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.clsECliente"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Cliente</title>
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
        <h1>Editar Cliente</h1>
    </header>
    <div class="container">
        <%
            String dni = (String) request.getAttribute("vdni");
            if (dni != null) {
                ClienteDAO dao = new ClienteDAO();
                clsECliente cliente = dao.obtenerPorDni(dni);
                if (cliente != null) {
        %>
        <form action="ControladorCliente" method="GET">
            <input type="hidden" name="txtdni" value="<%= cliente.getDni() %>">
            <label for="txtnom">Nombre:</label>
            <input type="text" name="txtnom" id="txtnom" value="<%= cliente.getNombre() %>" required>

            <label for="txtape">Apellido:</label>
            <input type="text" name="txtape" id="txtape" value="<%= cliente.getApellido() %>" required>

            <label for="txtcel">Celular:</label>
            <input type="text" name="txtcel" id="txtcel" value="<%= cliente.getCelular() %>" required>

            <input type="submit" name="accion" value="Actualizar">
        </form>
        <%
                } else {
                    out.println("Cliente no encontrado.");
                }
            } else {
                out.println("DNI no proporcionado.");
            }
        %>
    </div>
</body>
</html>
