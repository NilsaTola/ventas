package Controlador;

import Config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.sendRedirect("login.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String sql = "select * from usuarios where email = ? and password=?";
            ResultSet rs;
            
            Conexion canal = new Conexion();
            Connection conn = canal.getConnection();
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                //variables de sesion
                HttpSession ses = request.getSession();
                
                ses.setAttribute("logueado", "OK");
                ses.setAttribute("Usuarios", rs.getString("nombre"));
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }
            
        } catch (SQLException ex) {
            System.out.println("Error al conectar a la base de datos" + ex.getMessage());
        }
    }
}
