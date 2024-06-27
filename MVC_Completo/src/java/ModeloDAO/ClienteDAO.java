/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.clsECliente;
import java.util.*;
import java.sql.*;
import Config.*;
import Interfaces.InterfaceCliente;

public class ClienteDAO implements InterfaceCliente {

    clsConecion cn = new clsConecion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clsECliente cliente = new clsECliente();
    
    @Override
    public List<clsECliente> listar() {
        ArrayList<clsECliente> list = new ArrayList<>();
        String sql = "SELECT dni, nombre, apellido, celular FROM tbcliente";
        System.out.println(sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clsECliente objCliente = new clsECliente();
                objCliente.setDni(rs.getString("dni"));
                objCliente.setNombre(rs.getString("nombre"));
                objCliente.setApellido(rs.getString("apellido"));
                objCliente.setCelular(rs.getString("celular"));
                list.add(objCliente);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
        }
        return list;
    }

    @Override
public boolean agregar(clsECliente cliente) {
    String SQL = "INSERT INTO tbcliente (dni, nombre, apellido,celular) " +
                     "VALUES ('"+cliente.getDni()+"',' "+cliente.getNombre()+"', '"+cliente.getApellido()+"', '"+cliente.getCelular()+"');";
         System.out.println("la sentencia de sql es"+SQL);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(SQL);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al agregar el documento: " + e.getMessage());
        } 
        return false;
}


    @Override
    public boolean editar(clsECliente cliente) {
        String sql = "UPDATE tbcliente SET nombre = ?, apellido = ?, celular = ? WHERE dni = ?";
        System.out.println("La sentencia SQL es: " + sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setString(3, cliente.getCelular());
            ps.setString(4, cliente.getDni());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al actualizar cliente: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean eliminar(String dni) {
        String sql = "DELETE FROM tbcliente WHERE dni = ?";
        System.out.println("La sentencia SQL es: " + sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dni);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al eliminar cliente: " + e.getMessage());
        }
        return false;
    }

    @Override
    public clsECliente obtenerPorDni(String dni) {
        clsECliente objCliente = new clsECliente();
        String sql = "SELECT dni, nombre, apellido, celular FROM tbcliente WHERE dni = ?";
        System.out.println("La sentencia SQL es: " + sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dni);
            rs = ps.executeQuery();
            while (rs.next()) {
                objCliente.setDni(rs.getString("dni"));
                objCliente.setNombre(rs.getString("nombre"));
                objCliente.setApellido(rs.getString("apellido"));
                objCliente.setCelular(rs.getString("celular"));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener cliente: " + e.getMessage());
        }
        return objCliente;
    }
}

