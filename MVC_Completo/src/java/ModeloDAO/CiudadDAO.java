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
import Interfaces.InterfaceCiudad;
import Modelo.clsECiudad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class CiudadDAO implements InterfaceCiudad{
    clsConecion cn = new clsConecion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List ListarCiudad() {
    ArrayList<clsECiudad> list= new ArrayList();
    String sql = "SELECT * FROM tbciudad";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next()){
            clsECiudad objEC=new clsECiudad();
            objEC.setId(rs.getInt("idciudad"));
            objEC.setNombre(rs.getString("descripcion"));
            list.add(objEC);
        }
    }
    catch(SQLException e){
        System.out.println("error"+e.toString());
    }
    return list;    }

    @Override
    public boolean AgregarCiudad(clsECiudad objCiu) {
        String SQL = "INSERT INTO tbciudad (nombre) " +
                     "VALUES ('"+objCiu.getNombre()+"');";
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
    public boolean ActualizarCiudad(clsECiudad objCiu) {
        String SQL = "UPDATE tbciudad SET nombre = ? WHERE id = ?";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(SQL)) {
            ps.setString(1, objCiu.getNombre());
            ps.setInt(2, objCiu.getId());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Error al actualizar la ciudad: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean EliminarCiudad(int vid) {
        System.out.println("lEl valor de vid es"+vid);
        String SQL = "delete from tbciudad  where id= '"+vid+"'";
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
    public clsECiudad Buscar(Integer vid) {
    clsECiudad objEC = new clsECiudad();
    String SQL = "SELECT id, nombre FROM tbciudad WHERE id = ?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(SQL);
        ps.setInt(1, vid);
        rs = ps.executeQuery();
        if (rs.next()) {
            objEC = new clsECiudad();
            objEC.setId(rs.getInt("id"));
            objEC.setNombre(rs.getString("nombre"));
        }
    } catch (SQLException e) {
        System.out.println("Error de conexión a listar servlet: " + e.getMessage());
    }
    return objEC;
    }

}
