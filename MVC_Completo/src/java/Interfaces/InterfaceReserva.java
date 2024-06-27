/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.clsEReserva;
import Modelo.clsEPasajes;
import java.util.List;

public interface InterfaceReserva {
    public List<clsEReserva> listar();
    public clsEReserva list(int id);
    public boolean add(clsEReserva res);
    public boolean edit(clsEReserva res);
    public boolean eliminar(int id);
    public List<clsEPasajes> listarReservasFiltradas(String idBus, String origen, String destino);
}

