package Controlador;

import Modelo.Ventas;
import ModeloDAO.VentaDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlador4", urlPatterns = {"/Controlador4"})
public class Controlador4 extends HttpServlet {

    String listar="vistas4/listar.jsp";
    String add="vistas4/add.jsp";
    String editar="vistas4/edit.jsp";
    Ventas v=new Ventas();
    VentaDAO dao=new VentaDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
 
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
            int Producto_id=Integer.parseInt(request.getParameter("txtProducto_id"));
            int Cliente_id=Integer.parseInt(request.getParameter("txtCliente_id"));
            String Fecha=request.getParameter("txtFecha");
            v.setProducto_id(Producto_id);
            v.setCliente_id(Cliente_id);
            v.setFecha(Fecha);
            dao.add(v);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idven",request.getParameter("id"));
            acceso = editar;
            
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            int id=Integer.parseInt(request.getParameter("txtid"));
            int Producto_id=Integer.parseInt(request.getParameter("txtProducto_id"));
            int Cliente_id=Integer.parseInt(request.getParameter("txtCliente_id"));
            String Fecha=request.getParameter("txtFecha");
            v.setId(id);
            v.setProducto_id(Producto_id);
            v.setCliente_id(Cliente_id);
            v.setFecha(Fecha);
            dao.edit(v);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("eliminar")){
            int id=Integer.parseInt(request.getParameter("id"));
            v.setId(id);
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
