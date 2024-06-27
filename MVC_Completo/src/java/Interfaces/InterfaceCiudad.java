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
import Modelo.clsECiudad;
public interface InterfaceCiudad {
    public List ListarCiudad();
    public boolean AgregarCiudad(clsECiudad objCiu);
    public boolean ActualizarCiudad(clsECiudad objCiu);
    public boolean EliminarCiudad(int vid);
    public clsECiudad Buscar(Integer vid);

}
