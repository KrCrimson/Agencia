/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.clsEConductor;
import ModeloDAO.ConductorDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorConductor", urlPatterns = {"/ControladorConductor"})
public class ControladorConductor extends HttpServlet {
    ConductorDAO dao = new ConductorDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                List<clsEConductor> lista = dao.listar();
                request.setAttribute("conductores", lista);
                request.getRequestDispatcher("VistaConductor/listar.jsp").forward(request, response);
                break;
            case "add":
                request.getRequestDispatcher("VistaConductor/agregar.jsp").forward(request, response);
                break;
            case "Agregar":
                String dni = request.getParameter("txtDni");
                String licencia = request.getParameter("txtLicencia");
                String nombre = request.getParameter("txtNombre");
                String apellido = request.getParameter("txtApellido");
                clsEConductor nuevo = new clsEConductor(dni, licencia, nombre, apellido);
                dao.agregar(nuevo);
                response.sendRedirect("ControladorConductor?accion=listar");
                break;
            case "editar":
                String editDni = request.getParameter("dni");
                clsEConductor editConductor = dao.buscar(editDni);
                request.setAttribute("conductor", editConductor);
                request.getRequestDispatcher("VistaConductor/editar.jsp").forward(request, response);
                break;
            case "Actualizar":
                String updDni = request.getParameter("txtDni");
                String updLicencia = request.getParameter("txtLicencia");
                String updNombre = request.getParameter("txtNombre");
                String updApellido = request.getParameter("txtApellido");
                clsEConductor updConductor = new clsEConductor(updDni, updLicencia, updNombre, updApellido);
                dao.actualizar(updConductor);
                response.sendRedirect("ControladorConductor?accion=listar");
                break;
            case "eliminar":
                String delDni = request.getParameter("dni");
                dao.eliminar(delDni);
                response.sendRedirect("ControladorConductor?accion=listar");
                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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


