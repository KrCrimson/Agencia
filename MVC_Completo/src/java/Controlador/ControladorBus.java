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
import Modelo.clsEBus;
import ModeloDAO.BusDAO;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author windows10
 */
public class ControladorBus extends HttpServlet {
    String Listar ="VistaBuses/listar.jsp";
    String add="VistaBuses/agregar.jsp";
    String edit="VistaBuses/editar.jsp";
    clsEBus Bus=new clsEBus();
    BusDAO dao=new BusDAO();
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
            out.println("<title>Servlet ControladorBus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorBus at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=Listar;
        }
        else if (action.equalsIgnoreCase("add"))
        {
            acceso=add;
        }
        else if (action.equalsIgnoreCase("Agregar"))
        {
            String vpla=request.getParameter("txtplaca");
            String vmod=request.getParameter("txtmodelo");
            String vcap=request.getParameter("txtdcapacidad");

            Bus.setPlaca(vpla);
            Bus.setModelo(vmod);
            int  capacidad= Integer.parseInt(vcap);
            Bus.setCapacidad(capacidad);
            dao.AgregarBus(Bus);
            acceso=Listar;
        }
        else if (action.equalsIgnoreCase("edit"))
        {
            request.setAttribute("vdni",request.getParameter("vdni"));
            acceso=edit;
        }
        else if (action.equalsIgnoreCase("Actualizar"))
        {
            System.out.println("esta en actualizar"+action);
            
            String vpla=request.getParameter("txtplaca");
            String vmod=request.getParameter("txtmodelo");
            String vcap=request.getParameter("txtcapacidad");
            int id = Integer.parseInt(request.getParameter("txtid"));
            int  capacidad= Integer.parseInt(vcap);
            Bus.setId(id);
            Bus.setPlaca(vpla);
            Bus.setModelo(vmod);
            Bus.setCapacidad(capacidad);
            dao.ActualizarBus(Bus);
            acceso=Listar;
        }
        else if (action.equalsIgnoreCase("eliminar"))
        {
            int vid = Integer.parseInt(request.getParameter("id"));
            dao.EliminarBus(vid);
            acceso=Listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request,response);
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
