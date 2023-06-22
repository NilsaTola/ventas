<%@page import="Modelo.Usuarios"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <div class="card-body text-center">
        <body background="img/win.jpg">
            <div>
                <%
                UsuarioDAO dao=new UsuarioDAO();
                int id=Integer.parseInt((String)request.getAttribute("idusu"));
                Usuarios u=(Usuarios)dao.list(id);
                %>
                <h1 class="font-weight-bold text-warning"><center>EDITAR USUARIOS</center></h1>
                <div class="form-group">
                    <br>
                    <form action="Controlador3" class="text-white">         
                        <b>Nombre:</b> <input class="col-md-5 " type="text" name="txtNombre" value="<%= u.getNombre()%>"><br><br>
                        <b>Correo:</b> <input class="col-md-5 " type="text" name="txtEmail" value="<%= u.getEmail()%>"><br><br>
                        <b>Password:</b> <input class="col-md-5 " type="text" name="txtPassword" value="<%= u.getPassword()%>"><br><br>
                        <input type="hidden" name="txtid" value="<%= u.getId()%>"><br>
                        <input class="btn btn-info" type="submit" name="accion" value="Actualizar">
                        <a type="button" class="btn btn-danger" href="Controlador3?accion=listar">Regresar</a>
                    </form>
                    <br>
                    <br>
                    <br>
                    <div class="form-group text-center">

                        <img src="img/cliente.png" class="rounded float-end" alt="300" width="300">
                        <img src="img/comp.png" class="rounded float-end" alt="260" width="260">
                        <h4><p class="text-white"><b>En este apartado se editaran todos los datos de cada usuario que se quiera modificar</b></p></h4>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        </body>
    </div>
</html>
