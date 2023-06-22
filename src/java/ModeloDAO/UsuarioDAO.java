package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD3;
import Modelo.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO implements CRUD3 {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuarios u = new Usuarios();

    @Override
    public List listar() {
        ArrayList<Usuarios> list = new ArrayList<>();
        String sql = "select * from usuarios";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios usu = new Usuarios();
                usu.setId(rs.getInt("id"));
                usu.setNombre(rs.getString("nombre"));
                usu.setEmail(rs.getString("email"));
                usu.setPassword(rs.getString("password"));
                list.add(usu);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Usuarios list(int id) {
        String sql = "select * from usuarios where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("Email"));
                u.setPassword(rs.getString("password"));

            }
        } catch (Exception e) {
        }
        return u;
    }

    @Override
    public boolean add(Usuarios usu) {
        String sql = "insert into usuarios(nombre,email,password)values('" + usu.getNombre() + "','" + usu.getEmail() + "','" + usu.getPassword() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean edit(Usuarios usu) {
        String sql = "update usuarios set Nombre='" + usu.getNombre() + "',Email='" + usu.getEmail() + "',Password='" + usu.getPassword() + "'where id=" + usu.getId();
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
        String sql = "delete from usuarios where Id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }
    

}
