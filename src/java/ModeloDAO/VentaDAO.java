package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD4;
import Modelo.Ventas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO implements CRUD4 {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Ventas v = new Ventas();

    @Override
    public List listar() {
        ArrayList<Ventas> list = new ArrayList<>();
        String sql = "select * from ventas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ventas ven = new Ventas();
                ven.setId(rs.getInt("id"));
                ven.setProducto_id(rs.getInt("Producto_id"));
                ven.setCliente_id(rs.getInt("Cliente_id"));
                ven.setFecha(rs.getString("Fecha"));
                list.add(ven);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Ventas list(int id) {
        String sql = "select * from ventas where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                v.setId(rs.getInt("id"));
                v.setProducto_id(rs.getInt("producto_id"));
                v.setCliente_id(rs.getInt("cliente_id"));
                v.setFecha(rs.getString("fecha"));

            }
        } catch (Exception e) {
        }
        return v;
    }

    @Override
    public boolean add(Ventas ven) {
        String sql = "insert into ventas(producto_id,cliente_id,fecha)values('" + ven.getProducto_id() + "','" + ven.getCliente_id() + "','" + ven.getFecha() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean edit(Ventas ven) {
        String sql = "update ventas set Producto_id='" + ven.getProducto_id() + "',Cliente_id='" + ven.getCliente_id() + "',Fecha='" + ven.getFecha() + "'where id=" + ven.getId();
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
        String sql = "delete from ventas where Id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

}
