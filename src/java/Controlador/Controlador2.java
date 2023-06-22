package Controlador;

import Modelo.Productos;
import ModeloDAO.ProductoDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlador2", urlPatterns = {"/Controlador2"})
public class Controlador2 extends HttpServlet {

    String listar="vistas2/listar.jsp";
    String add="vistas2/add.jsp";
    String editar="vistas2/edit.jsp";
    Productos p=new Productos();
    ProductoDAO dao=new ProductoDAO();
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
            String Descripcion=request.getParameter("txtDescripcion");
            float Precio=Float.parseFloat(request.getParameter("txtPrecio"));
            p.setNombre(Nombre);
            p.setDescripcion(Descripcion);
            p.setPrecio(Precio);
            dao.add(p);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idpro",request.getParameter("id"));
            acceso = editar;
            
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            int id=Integer.parseInt(request.getParameter("txtid"));
            String Nombre=request.getParameter("txtNombre");
            String Descripcion=request.getParameter("txtDescripcion");
            float Precio=Float.parseFloat(request.getParameter("txtPrecio"));
            p.setId(id);
            p.setNombre(Nombre);
            p.setDescripcion(Descripcion);
            p.setPrecio(Precio);
            dao.edit(p);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("eliminar")){
            int id=Integer.parseInt(request.getParameter("id"));
            p.setId(id);
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

