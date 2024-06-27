/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

/**
 *
 * @author windows10
 */
import Config.clsConecion;
import Modelo.clsEBus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Interfaces.InterfaceBus;
public class BusDAO implements InterfaceBus{
    clsConecion cn = new clsConecion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List ListarBus() {
        ArrayList<clsEBus> list = new ArrayList<>();
        String sql = "SELECT * FROM tbbuses";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clsEBus bus = new clsEBus();
                bus.setId(rs.getInt("ID_BUS"));
                bus.setPlaca(rs.getString("PLACA"));
                bus.setModelo(rs.getString("MODELO"));
                bus.setCapacidad(rs.getInt("CAPACIDAD"));
                list.add(bus);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
        }
        return list;
    }

    @Override
    public boolean AgregarBus(clsEBus objEmp) {
String sql = "INSERT INTO tbbuses (placa,modelo,capacidad) VALUES (?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, objEmp.getPlaca());
            ps.setString(2, objEmp.getModelo());
            ps.setInt(3, objEmp.getCapacidad());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al agregar cargo: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean ActualizarBus(clsEBus objEmp) {
        String sql = "UPDATE tbbuses SET placa = ?, modelo=?, capacidad=? WHERE id_buses = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, objEmp.getPlaca());
            ps.setString(2, objEmp.getModelo());
            ps.setInt(3, objEmp.getCapacidad());
            ps.setInt(4, objEmp.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al actualizar cargo: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean EliminarBus(int id) {
String sql = "DELETE FROM tbbuses WHERE id_bus = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al eliminar cargo: " + e.getMessage());
        }
        return false;
    }

    @Override
    public clsEBus Buscar(int id) {
        clsEBus bus = new clsEBus();
        String sql = "SELECT * FROM tbbuses WHERE id_bus = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                bus.setId(rs.getInt("id_bus"));
                bus.setPlaca(rs.getString("placa"));
                bus.setModelo(rs.getString("modelo"));
                bus.setCapacidad(rs.getInt("capacidad"));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener cargo: " + e.getMessage());
        }
        return bus;
    }
}
