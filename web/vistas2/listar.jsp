<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Productos"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>

    </head>
    <div class="card-body">
        <body background="img/pro.jpg">
            <div>
                <h1 class="font-weight-bold text-dark"><center><b>LISTA DE PRODUCTOS</b></center></h1>
                <div class="form-group">
                    <a type="button" class="btn btn-danger" href="Controlador2?accion=add">Agregar Nuevo</a>
                </div>
                <table border="2" cellspacing = "2" class="table table-bordered ">
                    <thead>
                        <tr class="text-info">
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>DESCRIPCION</th>
                            <th>PRECIO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        ProductoDAO dao = new ProductoDAO();
                        List<Productos> list = dao.listar();
                        Iterator<Productos> iter = list.iterator();
                        Productos pro = null;
                        while (iter.hasNext()) {
                            pro = iter.next();
                    
                    %>
                    <tbody>
                        <tr>
                        <td><b><%= pro.getId()%></b></td>
                        <td><b><%= pro.getNombre()%></b></td>
                        <td><b><%= pro.getDescripcion()%></b></td>
                        <td><b><%= pro.getPrecio()%></b></td>
                    
                    <td >
                        <a type="button" class="btn btn-warning" href="Controlador2?accion=editar&id=<%= pro.getId()%>">Editar</a>
                        <a type="button" class="btn btn-success" href="Controlador2?accion=eliminar&id=<%= pro.getId()%>">Eliminar</a>
                    </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>      
        </body>
    </div>
</html>

