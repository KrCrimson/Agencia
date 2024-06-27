/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.clsEConductor;
import java.util.List;

public interface InterfaceConductor {
    public List<clsEConductor> listar();
    public clsEConductor buscar(String dni);
    public boolean agregar(clsEConductor conductor);
    public boolean actualizar(clsEConductor conductor);
    public boolean eliminar(String dni);
}

