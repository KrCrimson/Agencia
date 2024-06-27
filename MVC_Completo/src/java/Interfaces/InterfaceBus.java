/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

/**
 *
 * @author HP
 */
import java.util.List;
import Modelo.clsEBus;
public interface InterfaceBus {
    public List ListarBus();
    public boolean AgregarBus(clsEBus objEmp);
    public boolean ActualizarBus(clsEBus objEmp);
    public boolean EliminarBus(int id);
    public clsEBus Buscar(int id);

}
