/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.clsConecion;
import Interfaces.InterfaceConductor;
import Modelo.clsEConductor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ConductorDAO implements InterfaceConductor {
    clsConecion cn = new clsConecion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clsEConductor conductor;

    @Override
    public List<clsEConductor> listar() {
        List<clsEConductor> lista = new ArrayList<>();
        String sql = "SELECT * FROM tbconductor";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                conductor = new clsEConductor();
                conductor.setDni(rs.getString("dni"));
                conductor.setLicencia(rs.getString("licencia"));
                conductor.setNombre(rs.getString("nombre"));
                conductor.setApellido(rs.getString("apellido"));
                lista.add(conductor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public clsEConductor buscar(String dni) {
        String sql = "SELECT * FROM tbconductor WHERE dni = ?";
        clsEConductor conductor = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dni);
            rs = ps.executeQuery();
            if (rs.next()) {
                conductor = new clsEConductor();
                conductor.setDni(rs.getString("dni"));
                conductor.setLicencia(rs.getString("licencia"));
                conductor.setNombre(rs.getString("nombre"));
                conductor.setApellido(rs.getString("apellido"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conductor;
    }

    @Override
    public boolean agregar(clsEConductor conductor) {
        String sql = "INSERT INTO tbconductor (dni, licencia, nombre, apellido) VALUES (?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, conductor.getDni());
            ps.setString(2, conductor.getLicencia());
            ps.setString(3, conductor.getNombre());
            ps.setString(4, conductor.getApellido());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean actualizar(clsEConductor conductor) {
        String sql = "UPDATE tbconductor SET licencia = ?, nombre = ?, apellido = ? WHERE dni = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, conductor.getLicencia());
            ps.setString(2, conductor.getNombre());
            ps.setString(3, conductor.getApellido());
            ps.setString(4, conductor.getDni());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminar(String dni) {
        String sql = "DELETE FROM tbconductor WHERE dni = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dni);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
