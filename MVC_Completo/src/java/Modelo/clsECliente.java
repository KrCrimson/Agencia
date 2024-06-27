/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

public class clsECliente {
    private String dni;
    private String nombre;
    private String apellido;
    private String celular;
    
    // Constructor vacío
    public clsECliente() {}

    // Constructor con parámetros
    public clsECliente(String dni, String nombre, String apellido, String celular) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.celular = celular;
    }

    // Getters y Setters
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

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }
}
