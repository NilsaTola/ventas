package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD2;
import Modelo.Clientes;
import Modelo.Productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO implements CRUD2 {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Productos p = new Productos();

    @Override
    public List listar() {
        ArrayList<Productos> list = new ArrayList<>();
        String sql = "select * from productos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos pro = new Productos();
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setPrecio(rs.getFloat("Precio"));
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Productos list(int id) {
        String sql = "select * from productos where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getFloat("precio"));

            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Productos pro) {
        String sql = "insert into productos(nombre,descripcion,precio)values('" + pro.getNombre() + "','" + pro.getDescripcion() + "','" + pro.getPrecio() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean edit(Productos pro) {
        String sql = "update productos set Nombre='" + pro.getNombre() + "',Descripcion='" + pro.getDescripcion() + "',Precio='" + pro.getPrecio() + "'where id=" + pro.getId();
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
        String sql = "delete from productos where Id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

}
