/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author HP
 */
public class ChartDataServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/dbagencia";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String accion = request.getParameter("accion");
        if (accion != null && accion.equals("generarReporte")) {
            List<Integer> busIds = new ArrayList<>();
            List<Integer> numSeats = new ArrayList<>();
            Map<String, Integer> capacityMap = new HashMap<>();

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String querySeats = "SELECT id_bus, COUNT(*) AS num_asientos FROM tbasientos GROUP BY id_bus";
                PreparedStatement seatsStmt = conn.prepareStatement(querySeats);
                ResultSet seatsResult = seatsStmt.executeQuery();
                while (seatsResult.next()) {
                    busIds.add(seatsResult.getInt("id_bus"));
                    numSeats.add(seatsResult.getInt("num_asientos"));
                }

                String queryCapacity = "SELECT capacidad, COUNT(*) AS num_buses FROM tbbuses GROUP BY capacidad";
                PreparedStatement capacityStmt = conn.prepareStatement(queryCapacity);
                ResultSet capacityResult = capacityStmt.executeQuery();
                while (capacityResult.next()) {
                    int capacidad = capacityResult.getInt("capacidad");
                    int numBuses = capacityResult.getInt("num_buses");
                    capacityMap.put(String.valueOf(capacidad), numBuses);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("busIds", busIds);
            request.setAttribute("numSeats", numSeats);
            request.setAttribute("capacityMap", capacityMap);

            request.getRequestDispatcher("VistaReporte/charts.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
