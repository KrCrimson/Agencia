<%-- 
    Document   : reservado
    Created on : 18 jun 2024, 15:47:08
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ModeloDAO.ReservaDAO"%>
<%@page import="Modelo.clsECiudad"%>
<%@page import="ModeloDAO.CiudadDAO"%>
<%@page import="Modelo.clsEBus"%>
<%@page import="ModeloDAO.BusDAO"%>
<%@page import="Modelo.clsEPasajes"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Empleados</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            margin-right: 10px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Listado de Reservas</h1>
    </header>
    <div class="container">
        <!-- Formulario de filtros -->
            <form action="reservado.jsp" method="GET">
        <!-- Combo box para seleccionar bus -->
        <label for="id_bus">Modelo de Bus:</label>
        <select name="id_bus">
            <option value="">Todos</option>
            <% 
            // Obtener la lista de buses desde el DAO
            BusDAO dao2 = new BusDAO();
            List<clsEBus> buses = dao2.ListarBus();
            for (clsEBus bus : buses) {
            %>
            <option value="<%= bus.getId() %>"><%= bus.getModelo() %></option>
            <% } %>
        </select>

        <!-- Combo box para seleccionar origen -->
        <label for="origen">Origen:</label>
        <select name="origen">
            <option value="">Todos</option>
            <% 
            CiudadDAO dao1 = new CiudadDAO();
            List<clsECiudad> list = dao1.ListarCiudad();
            for (clsECiudad origen : list) {
            %>
            <option value="<%= origen.getId() %>"><%= origen.getNombre() %></option>
            <% } %>
        </select>

        <!-- Combo box para seleccionar destino -->
        <label for="destino">Destino:</label>
        <select name="destino">
            <option value="">Todos</option>
            <% 
            for (clsECiudad destino : list) {
            %>
            <option value="<%= destino.getId() %>"><%= destino.getNombre() %></option>
            <% } %>
        </select>

        <button type="submit">Filtrar</button>
    </form>

        
        <!-- Listado de reservas -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>BUS</th>
                    <th>ASIENTO</th>
                    <th>PASAJERO</th>
                    <th>ORIGEN</th>
                    <th>DESTINO</th>
                </tr>
            </thead>
            <tbody>
                <% 
                String idBus = request.getParameter("id_bus");
                String origen = request.getParameter("origen");
                String destino = request.getParameter("destino");

                // Si los parámetros de filtro están vacíos, establecerlos a null para que el DAO los maneje correctamente
                if (idBus != null && idBus.isEmpty()) {
                    idBus = null;
                }
                if (origen != null && origen.isEmpty()) {
                    origen = null;
                }
                if (destino != null && destino.isEmpty()) {
                    destino = null;
                }

                ReservaDAO dao = new ReservaDAO();
                List<clsEPasajes> Pasajes;

                // Llamar al método de DAO para obtener las reservas filtradas
                if (idBus == null && origen == null && destino == null) {
                    // Si no se selecciona ningún filtro, listar todas las reservas
                    Pasajes = dao.listar();
                } else {
                    // Filtrar las reservas según los parámetros seleccionados
                    Pasajes = dao.listarReservasFiltradas(idBus, origen, destino);
                }

                // Iterar sobre la lista de reservas y mostrarlas en la tabla
                for (clsEPasajes Pasajes : Pasajes) {
                %>
                <tr>
                    <td><%=Pasajes.getId_pasaje()%></td>
                    <td><%=Pasajes.getId_bus()%></td>
                    <td><%=Pasajes.getAsiento()%></td>
                    <td><%=Pasajes.getDni_pasajero()%></td>
                    <td><%=Pasajes.getOrigen()%></td>
                    <td><%=Pasajes.getDestino()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
