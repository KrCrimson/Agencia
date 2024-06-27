<%-- 
    Document   : index
    Created on : 25 jun 2024, 15:45:19
    Author     : HP
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gráficos de Buses</title>
    <!-- Incluir las bibliotecas de Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Gráfico de Barras: Número de Asientos por Bus</h1>
    <canvas id="barChart" width="800" height="400"></canvas>

    <h1>Gráfico Circular: Número de Buses por Capacidad</h1>
    <canvas id="pieChart" width="800" height="400"></canvas>

    <script>
        // Obtener los datos del servlet
        let busIds = ${requestScope.busIds};
        let numSeats = ${requestScope.numSeats};
        let capacityMap = ${requestScope.capacityMap};

        // Configurar datos para el gráfico de barras
        let barData = {
            labels: busIds.map(id => `Bus ${id}`),
            datasets: [{
                label: 'Número de Asientos',
                data: numSeats,
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        };

        // Configurar opciones del gráfico de barras
        let barOptions = {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        };

        // Dibujar el gráfico de barras
        let barChart = new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: barData,
            options: barOptions
        });

        // Configurar datos para el gráfico circular (pie chart)
        let pieData = {
            labels: Object.keys(capacityMap),
            datasets: [{
                label: 'Número de Buses',
                data: Object.values(capacityMap),
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(153, 102, 255, 0.6)',
                    'rgba(255, 159, 64, 0.6)'
                ],
                hoverOffset: 4
            }]
        };

        // Configurar opciones del gráfico circular
        let pieOptions = {
            plugins: {
                legend: {
                    position: 'top'
                },
                tooltip: {
                    callbacks: {
                        label: function(tooltipItem) {
                            return tooltipItem.label + ': ' + tooltipItem.raw.toLocaleString();
                        }
                    }
                }
            }
        };

        // Dibujar el gráfico circular
        let pieChart = new Chart(document.getElementById('pieChart'), {
            type: 'pie',
            data: pieData,
            options: pieOptions
        });

    </script>
</body>
</html>
