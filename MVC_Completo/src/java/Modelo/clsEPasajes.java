/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author HP
 */
public class clsEPasajes {
    private int id_pasaje;
    private int id_cliente;
    private int id_bus;
    private String fecha;
    private String destino;
    private int id_ciudad_destino;
    private int id_ciudad_origen;
    private String asiento;

    public clsEPasajes() {
    }

    public clsEPasajes(int id_pasaje, int id_cliente, int id_bus, String fecha, String destino, int id_ciudad_destino, int id_ciudad_origen, String asiento) {
        this.id_pasaje = id_pasaje;
        this.id_cliente = id_cliente;
        this.id_bus = id_bus;
        this.fecha = fecha;
        this.destino = destino;
        this.id_ciudad_destino = id_ciudad_destino;
        this.id_ciudad_origen = id_ciudad_origen;
        this.asiento = asiento;
    }

    public int getId_pasaje() {
        return id_pasaje;
    }

    public void setId_pasaje(int id_pasaje) {
        this.id_pasaje = id_pasaje;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_bus() {
        return id_bus;
    }

    public void setId_bus(int id_bus) {
        this.id_bus = id_bus;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getId_ciudad_destino() {
        return id_ciudad_destino;
    }

    public void setId_ciudad_destino(int id_ciudad_destino) {
        this.id_ciudad_destino = id_ciudad_destino;
    }

    public int getId_ciudad_origen() {
        return id_ciudad_origen;
    }

    public void setId_ciudad_origen(int id_ciudad_origen) {
        this.id_ciudad_origen = id_ciudad_origen;
    }

    public String getAsiento() {
        return asiento;
    }

    public void setAsiento(String asiento) {
        this.asiento = asiento;
    }
    
}
