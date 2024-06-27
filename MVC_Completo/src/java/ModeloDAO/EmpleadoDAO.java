/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.clsEEmpleado;
import java.util.*;
import java.sql.*;
import Config.*;
import Interfaces.InterfaceEmpleado;
/**
 *
 * @author HP
 */

public class EmpleadoDAO implements Interfaces.InterfaceEmpleado{

    clsConecion cn = new clsConecion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clsEEmpleado E = new clsEEmpleado();
    
    @Override
   public List<clsEEmpleado> ListarEmpleado() {
    ArrayList<clsEEmpleado> list= new ArrayList();
    String sql = "SELECT * FROM tbempleados";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next()){
            clsEEmpleado objEE=new clsEEmpleado();
            objEE.setDni(rs.getString("dni"));
            objEE.setNombre(rs.getString("nombre"));
            objEE.setApellido(rs.getString("apellido"));
            objEE.setContraseña(rs.getString("contraseña"));
            objEE.setCargo(rs.getInt("id_cargo")); // Cambiado a getInt
            list.add(objEE);
        }
    }
    catch(SQLException e){
        System.out.println("error"+e.toString());
    }
    return list;
}

    @Override
    public boolean AgregarEmpleado(clsEEmpleado objEmp) {
         String SQL = "INSERT INTO tbempleados (dni, nombre, apellido,contraseña,id_cargo) " +
                     "VALUES ('"+objEmp.getDni()+"',' "+objEmp.getNombre()+"', '"+objEmp.getApellido()+"', '"+objEmp.getContraseña()+"', '"+objEmp.getCargo()+"');";
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
    public boolean ActualizarEmpleado(clsEEmpleado objEmp) {
        String SQL = "Update tbempleados set nombre='"+objEmp.getNombre()+"',apellido=' "+objEmp.getApellido()+"',contraseña=' "+objEmp.getContraseña()+"',id_cargo= '"+objEmp.getCargo()+"' where dni= '"+objEmp.getDni()+"'";
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
    public boolean EliminarEmpleado(String dni) {
        System.out.println("lEl valor de dni es"+dni);
        String SQL = "delete from tbempleados  where dni= '"+dni+"'";
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
    public clsEEmpleado Buscar(String vdni) {
        clsEEmpleado objEE = new clsEEmpleado();
    String SQL = "SELECT dni, nombre, apellido, contraseña, id_cargo FROM tbempleados WHERE dni=?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(SQL);
        ps.setString(1, vdni); // Set dni as parameter
        ResultSet rs = ps.executeQuery(); // Execute the query

        if (rs.next()) {
            objEE.setDni(rs.getString("dni"));
            objEE.setNombre(rs.getString("nombre"));
            objEE.setApellido(rs.getString("apellido"));
            objEE.setContraseña(rs.getString("contraseña"));
            objEE.setCargo(rs.getInt("id_cargo"));
        }
        rs.close(); // Close ResultSet
    } catch (SQLException e) {
        System.out.println("Error de conexión a listar servlet: " + e.getMessage());
    }
    return objEE;
    }

 

}
