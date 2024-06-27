<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Conductor</title>
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
        <h1>Agregar Conductor</h1>
        <form action="ControladorConductor" method="POST">
            <input type="hidden" name="accion" value="Agregar">
            <input type="text" name="txtDni" placeholder="DNI" required>
            <input type="text" name="txtLicencia" placeholder="Licencia" required>
            <input type="text" name="txtNombre" placeholder="Nombre" required>
            <input type="text" name="txtApellido" placeholder="Apellido" required>
            <button type="submit">Agregar</button>
        </form>
    </div>
</body>
</html>
