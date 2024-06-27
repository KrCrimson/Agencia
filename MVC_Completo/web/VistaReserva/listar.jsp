<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.clsEBus"%>
<%@page import="ModeloDAO.BusDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Reserva</title>
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

            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            label {
                margin: 10px 0 5px;
            }

            input, select {
                padding: 10px;
                width: 100%;
                max-width: 400px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            .button {
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

            .button:hover {
                background-color: #45a049;
                transform: scale(1.05);
            }

        </style>
    </head>
    <body>
        <header>
            <h1>Agregar Reserva</h1>
        </header>
        <div class="container">
            <form action="ControladorReserva" method="POST">
                <input type="hidden" name="accion" value="add">
                
                <label for="id_bus">Modelo de Bus:</label>
                <select name="id_bus" required>
                    <% 
                    BusDAO busDao = new BusDAO();
                    List<clsEBus> buses = busDao.ListarBus();
                    for (clsEBus bus : buses) {
                    %>
                    <option value="<%= bus.getId()%>"><%= bus.getModelo() %></option>
                    <% } %>
                </select>
                
                <label for="origen">Origen:</label>
                <input type="text" name="origen" required>
                
                <label for="destino">Destino:</label>
                <input type="text" name="destino" required>
                
                <label for="asiento">Asiento:</label>
                <input type="number" name="asiento" required>
                
                <label for="dni_pasajero">DNI Pasajero:</label>
                <input type="text" name="dni_pasajero" required>
                
                <button class="button" type="submit">Grabar</button>
                <a href="ControladorReserva?accion=ver">Ver asientos</a>
            </form>
        </div>
    </body>
</html>
