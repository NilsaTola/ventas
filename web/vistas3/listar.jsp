<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
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
            <h1 class="font-weight-bold text-white"><center>Usuarios</center></h1><br>
            <div class="form-group">
                <a type="button" class="btn btn-danger" href="Controlador3?accion=add">Agregar Nuevo</a>
            </div>
            <table border="1"  cellspacing = "1" class="table table-bordered">
                <thead>
                    <tr class="text-info">
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>EMAIL</th>
                        <th>PASSWORD</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    UsuarioDAO dao = new UsuarioDAO();
                    List<Usuarios> list = dao.listar();
                    Iterator<Usuarios> iter = list.iterator();
                    Usuarios usu = null;
                    while (iter.hasNext()) {
                        usu = iter.next();
                    
                %>
                <tbody>
                    <tr class="text-white">
                        <td><%= usu.getId()%></td>
                        <td><%= usu.getNombre()%></td>
                        <td><%= usu.getEmail()%></td>
                        <td><%= usu.getPassword()%></td>

                        <td>
                            <a type="button" class="btn btn-warning" href="Controlador3?accion=editar&id=<%= usu.getId()%>">Editar</a>
                            <a type="button" class="btn btn-success" href="Controlador3?accion=eliminar&id=<%= usu.getId()%>">Eliminar</a>
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
