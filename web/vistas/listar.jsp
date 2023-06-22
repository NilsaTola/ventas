<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Clientes"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <div class="card-body">
        <body background="img/tum.jpg">
            <div>
                <h1 class="font-weight-bold text-white"><center>REGISTRO DE CLIENTES</center></h1>
                <div class="form-group">
                    <a type="button" class="btn btn-danger" href="Controlador?accion=add">Agregar Nuevo</a>
                </div>
                <table border="1" cellspacing = "2" class="table table-bordered">
                    <thead>
                        <tr class="text-danger">
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>CORREO</th>
                            <th>CELULAR</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        ClienteDAO dao = new ClienteDAO();
                        List<Clientes> list = dao.listar();
                        Iterator<Clientes> iter = list.iterator();
                        Clientes cli = null;
                        while (iter.hasNext()) {
                            cli = iter.next();
                    
                    %>
                    <tbody >
                        <tr class="text-white">
                            <td><%= cli.getId()%></td>
                            <td><%= cli.getNombre()%></td>
                            <td><%= cli.getCorreo()%></td>
                            <td><%= cli.getCelular()%></td>

                            <td>
                                <a type="button" class="btn btn-warning" href="Controlador?accion=editar&id=<%= cli.getId()%>">Editar</a>
                                <a type="button" class="btn btn-success" href="Controlador?accion=eliminar&id=<%= cli.getId()%>">Eliminar</a>
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

