/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.clsECliente;
import ModeloDAO.ClienteDAO;
import javax.servlet.RequestDispatcher;

/**
 *
 */
@WebServlet("/ControladorCliente")
public class ControladorCliente extends HttpServlet {
    String listar = "VistaCliente/listar.jsp";
    String add = "VistaCliente/agregar.jsp";
    String edit = "VistaCliente/editar.jsp";
    clsECliente cliente = new clsECliente();
    ClienteDAO dao = new ClienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String vdni = request.getParameter("txtdni");
            String vnom = request.getParameter("txtnom");
            String vape = request.getParameter("txtape");
            String vcel = request.getParameter("txtcel");
            cliente.setDni(vdni);
            cliente.setNombre(vnom);
            cliente.setApellido(vape);
            cliente.setCelular(vcel);
            dao.agregar(cliente);
            acceso = listar;
        } else if (action.equalsIgnoreCase("edit")) {
            request.setAttribute("vdni", request.getParameter("vdni"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            String vdni = request.getParameter("txtdni");
            String vnom = request.getParameter("txtnom");
            String vape = request.getParameter("txtape");
            String vcel = request.getParameter("txtcel");
            cliente.setDni(vdni);
            cliente.setNombre(vnom);
            cliente.setApellido(vape);
            cliente.setCelular(vcel);
            dao.editar(cliente);
            acceso = listar;
        } else if (action.equalsIgnoreCase("eliminar")) {
            String vdni = request.getParameter("vdni");
            dao.eliminar(vdni);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
