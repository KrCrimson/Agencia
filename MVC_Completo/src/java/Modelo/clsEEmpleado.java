/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class clsEEmpleado {
    
    private String dni;
    private String nombre;
    private String apellido;
    private String contraseña;
    private int cargo;
    public clsEEmpleado() {
    }

    public clsEEmpleado(String dni, String nombre, String apellido, String contraseña, int cargo) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.contraseña = contraseña;
        this.cargo = cargo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getCargo() {
        return cargo;
    }

    public void setCargo(int cargo) {
        this.cargo = cargo;
    }

}