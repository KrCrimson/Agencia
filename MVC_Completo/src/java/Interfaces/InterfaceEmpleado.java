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
import Modelo.clsEEmpleado;
public interface InterfaceEmpleado {
    public List ListarEmpleado();
    public boolean AgregarEmpleado(clsEEmpleado objEmp);
    public boolean ActualizarEmpleado(clsEEmpleado objEmp);
    public boolean EliminarEmpleado(String dni);
    public clsEEmpleado Buscar(String vdni);

}
