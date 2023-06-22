<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Ventas"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <div class="card-body">
        <body background="img/walli.jpg">
            <div>
                <h1 class="font-weight-bold text-white"><center>REGISTRO DE VENTAS</center></h1>
                <div class="form-group">
                    <a type="button" class="btn btn-danger" href="Controlador4?accion=add">Agregar Nuevo</a>
                </div>
                <table border="1"  cellspacing = "1" class="table table-bordered">
                    <thead>
                        <tr class="text-warning">
                            <th>ID</th>
                            <th>PRODUCTO</th>
                            <th>CLIENTE</th>
                            <th>FECHA</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        VentaDAO dao = new VentaDAO();
                        List<Ventas> list = dao.listar();
                        Iterator<Ventas> iter = list.iterator();
                        Ventas ven = null;
                        while (iter.hasNext()) {
                            ven = iter.next();
                    
                    %>
                    <tbody>
                        <tr class="text-white">
                            <td><%= ven.getId()%></td>
                            <td><%= ven.getProducto_id()%></td>
                            <td><%= ven.getCliente_id()%></td>
                            <td><%= ven.getFecha()%></td>

                            <td>
                                <a type="button" class="btn btn-warning" href="Controlador4?accion=editar&id=<%= ven.getId()%>">Editar</a>
                                <a type="button" class="btn btn-success" href="Controlador4?accion=eliminar&id=<%= ven.getId()%>">Eliminar</a>
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