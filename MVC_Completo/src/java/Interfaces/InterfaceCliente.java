/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

package Interfaces;

import java.util.List;
import Modelo.clsECliente;

public interface InterfaceCliente {
    public List<clsECliente> listar();
    public boolean agregar(clsECliente cliente);
    public boolean editar(clsECliente cliente);
    public boolean eliminar(String dni);
    public clsECliente obtenerPorDni(String dni);
}

