package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Clientes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO implements CRUD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Clientes c = new Clientes();

    @Override
    public List listar() {
        ArrayList<Clientes> list = new ArrayList<>();
        String sql = "select * from clientes";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Clientes cli = new Clientes();
                cli.setId(rs.getInt("id"));
                cli.setNombre(rs.getString("nombre"));
                cli.setCorreo(rs.getString("correo"));
                cli.setCelular(rs.getString("celular"));
                list.add(cli);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Clientes list(int id) {
        String sql = "select * from clientes where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setCorreo(rs.getString("correo"));
                c.setCelular(rs.getString("celular"));

            }
        } catch (Exception e) {
        }
        return c;
    }

    @Override
    public boolean add(Clientes cli) {
        String sql = "insert into clientes(nombre,correo,celular)values('" + cli.getNombre() + "','" + cli.getCorreo() + "','" + cli.getCelular() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean edit(Clientes cli) {
        String sql = "update clientes set Nombre='" + cli.getNombre() + "',Correo='" + cli.getCorreo() + "',Celular='" + cli.getCelular() + "'where id=" + cli.getId();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
                String sql="delete from clientes where Id="+id;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            
        }
        return false;
    }
    
}


