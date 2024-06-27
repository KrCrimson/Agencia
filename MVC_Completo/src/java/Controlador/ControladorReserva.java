package Controlador;

import Modelo.clsEReserva;
import ModeloDAO.ReservaDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorReserva", urlPatterns = {"/ControladorReserva"})
public class ControladorReserva extends HttpServlet {
    String listar = "VistaReserva/listar.jsp";
    String add = "VistaReserva/agregar.jsp";
    String ver = "VistaReserva/reservado.jsp";
    ReservaDAO dao = new ReservaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");
        if (action.equals("listar")) {
            List<clsEReserva> lista = dao.listar();
            request.setAttribute("reservas", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher(listar);
            dispatcher.forward(request, response);
        } else if (action.equals("add")) {
            String idBus = request.getParameter("id_bus");
            String asiento = request.getParameter("asiento");
            String dniPasajero = request.getParameter("dni_pasajero");
            String origen = request.getParameter("origen");
            String destino = request.getParameter("destino");
            clsEReserva res = new clsEReserva();
            res.setId_bus(Integer.parseInt(idBus));
            res.setAsiento(Integer.parseInt(asiento));
            res.setDni_pasajero(dniPasajero);
            res.setOrigen(origen);
            res.setDestino(destino);
            dao.add(res);
            response.sendRedirect("ControladorReserva?accion=listar");
        } else if (action.equals("nuevo")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(add);
            dispatcher.forward(request, response);
        } else if(action.equals("ver")){
            List<clsEReserva> lista = dao.listar();
            request.setAttribute("reservas", ver);
            RequestDispatcher dispatcher = request.getRequestDispatcher(ver);
            dispatcher.forward(request, response);
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
