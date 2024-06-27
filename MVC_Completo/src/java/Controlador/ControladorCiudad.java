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
import Modelo.clsECiudad;
import ModeloDAO.CiudadDAO;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author windows10
 */
public class ControladorCiudad extends HttpServlet {
    String Listar ="VistaCiudad/listar.jsp";
    String add="VistaCiudad/agregar.jsp";
    String edit="VistaCiudad/editar.jsp";
    clsECiudad Ciu=new clsECiudad();
    CiudadDAO dao=new CiudadDAO();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCiudad</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCiudad at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listar")) {
            acceso = Listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String vnom = request.getParameter("txtnom");
            Ciu.setNombre(vnom);
            dao.AgregarCiudad(Ciu);
            acceso = Listar;
        } else if (action.equalsIgnoreCase("edit")) {
            Integer vId = Integer.parseInt(request.getParameter("vId"));
            request.setAttribute("vId", vId);
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            Integer vId = Integer.parseInt(request.getParameter("txtvid"));
            String vnom = request.getParameter("txtnom");
            Ciu.setId(vId);
            Ciu.setNombre(vnom);
            dao.ActualizarCiudad(Ciu);
            acceso = Listar;
        } else if (action.equalsIgnoreCase("eliminar")) {
            Integer vId = Integer.parseInt(request.getParameter("vId"));
            dao.EliminarCiudad(vId);
            acceso = Listar;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
