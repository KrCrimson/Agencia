/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.clsConecion;
import Interfaces.InterfaceReserva;
import Modelo.clsEReserva;
import Modelo.clsEPasajes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO implements InterfaceReserva {
    clsConecion conexion = new clsConecion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clsEReserva r = new clsEReserva();

    @Override
    public List<clsEReserva> listar() {
        ArrayList<clsEReserva> list = new ArrayList<>();
        String sql = "SELECT * FROM tbreservas";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clsEReserva res = new clsEReserva();
                res.setId_reserva(rs.getInt("id_reserva"));
                res.setId_bus(rs.getInt("id_bus"));
                res.setAsiento(rs.getInt("asiento"));
                res.setDni_pasajero(rs.getString("dni_pasajero"));
                res.setOrigen(rs.getString("origen"));
                res.setDestino(rs.getString("destino"));
                list.add(res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public clsEReserva list(int id) {
        String sql = "SELECT * FROM tbreservas WHERE id_reserva=" + id;
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                r.setId_reserva(rs.getInt("id_reserva"));
                r.setId_bus(rs.getInt("id_bus"));
                r.setAsiento(rs.getInt("asiento"));
                r.setDni_pasajero(rs.getString("dni_pasajero"));
                r.setOrigen(rs.getString("origen"));
                r.setDestino(rs.getString("destino"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public boolean add(clsEReserva res) {
        String sql = "INSERT INTO tbreservas (id_bus, asiento, dni_pasajero, origen, destino) VALUES (?, ?, ?, ?, ?)";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, res.getId_bus());
            ps.setInt(2, res.getAsiento());
            ps.setString(3, res.getDni_pasajero());
            ps.setString(4, res.getOrigen());
            ps.setString(5, res.getDestino());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean edit(clsEReserva res) {
        String sql = "UPDATE tbreservas SET id_bus=?, asiento=?, dni_pasajero=?, origen=?, destino=? WHERE id_reserva=?";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, res.getId_bus());
            ps.setInt(2, res.getAsiento());
            ps.setString(3, res.getDni_pasajero());
            ps.setString(4, res.getOrigen());
            ps.setString(5, res.getDestino());
            ps.setInt(6, res.getId_reserva());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM tbReservas WHERE id_reserva=" + id;
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public List<clsEPasajes> listarReservasFiltradas(String idBus, String origen, String destino) {
    List<clsEPasajes> Pasajes = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = conexion.getConnection();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT id_pasaje, id_cliente, id_bus, fecha, destino, id_ciudad_destino, id_ciudad_origen, asiento ")
           .append("FROM tbpasajes ")
           .append("WHERE (:idBus IS NULL OR id_bus = ?) ")
           .append("AND (:origen IS NULL OR origen LIKE ?) ")
           .append("AND (:destino IS NULL OR destino LIKE ?)");

        stmt = conn.prepareStatement(sql.toString());

        // Establecer parámetro idBus
        if (idBus != null && !idBus.isEmpty()) {
            stmt.setInt(1, Integer.parseInt(idBus));
        } else {
            stmt.setNull(1, java.sql.Types.INTEGER);
        }

        // Establecer parámetro origen
        if (origen != null && !origen.isEmpty()) {
            stmt.setString(2, "%" + origen + "%");
        } else {
            stmt.setNull(2, java.sql.Types.VARCHAR);
        }

        // Establecer parámetro destino
        if (destino != null && !destino.isEmpty()) {
            stmt.setString(3, "%" + destino + "%");
        } else {
            stmt.setNull(3, java.sql.Types.VARCHAR);
        }

        rs = stmt.executeQuery();

        while (rs.next()) {
            clsEPasajes reserva = new clsEPasajes();
            reserva.setId_pasaje(rs.getInt("id_pasaje"));
            reserva.setId_cliente(rs.getInt("id_cliente"));
            reserva.setId_bus(rs.getInt("id_bus"));
            reserva.setFecha(rs.getString("fecha"));
            reserva.setDestino(rs.getString("destino"));
            reserva.setId_ciudad_destino(rs.getInt("id_ciudad_destino"));
            reserva.setId_ciudad_origen(rs.getInt("id_ciudad_origen"));
            reserva.setAsiento(rs.getString("asiento"));
            
            Pasajes.add(reserva);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } 
    return Pasajes;
}


}
