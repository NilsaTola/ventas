package Controlador;

import Modelo.Usuarios;
import ModeloDAO.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlador3", urlPatterns = {"/Controlador3"})
public class Controlador3 extends HttpServlet {

    String listar="vistas3/listar.jsp";
    String add="vistas3/add.jsp";
    String editar="vistas3/edit.jsp";
    Usuarios u=new Usuarios();
    UsuarioDAO dao=new UsuarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;
            
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;          
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String Nombre=request.getParameter("txtNombre");
            String Email=request.getParameter("txtEmail");
            String Password=request.getParameter("txtPassword");
            u.setNombre(Nombre);
            u.setEmail(Email);
            u.setPassword(Password);
            dao.add(u);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idusu",request.getParameter("id"));
            acceso = editar;
            
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            int id=Integer.parseInt(request.getParameter("txtid"));
            String Nombre=request.getParameter("txtNombre");
            String Email=request.getParameter("txtEmail");
            String Password=request.getParameter("txtPassword");
            u.setId(id);
            u.setNombre(Nombre);
            u.setEmail(Email);
            u.setPassword(Password);
            dao.edit(u);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("eliminar")){
            int id=Integer.parseInt(request.getParameter("id"));
            u.setId(id);
            dao.eliminar(id);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
