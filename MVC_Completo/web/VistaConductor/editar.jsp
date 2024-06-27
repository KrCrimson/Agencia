<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.clsEConductor"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Conductor</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: white;
            padding: 40px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="text"] {
            margin: 10px 0;
            padding: 10px;
            width: 80%;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            margin: 20px 0;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Editar Conductor</h1>
        <form action="ControladorConductor" method="POST">
            <input type="hidden" name="accion" value="Actualizar">
            <input type="hidden" name="txtDni" value="<%= request.getAttribute("conductor") != null ? ((clsEConductor) request.getAttribute("conductor")).getDni() : "" %>" required>
            <input type="text" name="txtLicencia" placeholder="Licencia" value="<%= request.getAttribute("conductor") != null ? ((clsEConductor) request.getAttribute("conductor")).getLicencia() : "" %>" required>
            <input type="text" name="txtNombre" placeholder="Nombre" value="<%= request.getAttribute("conductor") != null ? ((clsEConductor) request.getAttribute("conductor")).getNombre() : "" %>" required>
            <input type="text" name="txtApellido" placeholder="Apellido" value="<%= request.getAttribute("conductor") != null ? ((clsEConductor) request.getAttribute("conductor")).getApellido() : "" %>" required>
            <button type="submit">Actualizar</button>
        </form>
    </div>
</body>
</html>
