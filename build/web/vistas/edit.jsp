<%@page import="Modelo.Clientes"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <div class="card-body text-center">
        <body background="img/otro.jpg"/>
        <div>
            <%
            ClienteDAO dao=new ClienteDAO();
            int id=Integer.parseInt((String)request.getAttribute("idcli"));
            Clientes c=(Clientes)dao.list(id);
            %>
            <h1 class="font-weight-bold text-warning"><center>EDITAR CLIENTES</center></h1>
            <div class="form-group">
                <br>
                <form action="Controlador" class="text-white"> 
                    <b>Nombre:</b> <input class="col-md-5 " type="text" name="txtNombre" value="<%= c.getNombre()%>"><br><br>
                    <b>Correo:</b> <input class="col-md-5 " type="text" name="txtCorreo" value="<%= c.getCorreo()%>"><br><br>
                    <b>Celular:</b> <input class="col-md-5 " type="text" name="txtCelular" value="<%= c.getCelular()%>"><br><br>
                    <input type="hidden" name="txtid" value="<%= c.getId()%>">
                    <input class="btn btn-info" type="submit" name="accion" value="Actualizar">
                    <a type="button" class="btn btn-danger" href="Controlador?accion=listar">Regresar</a>
                </form>
                <br>
                <br>
                <br>
                <div class="form-group text-center">

                    <img src="img/cliente.png" class="rounded float-end" alt="300" width="300">
                    <img src="img/comp.png" class="rounded float-end" alt="260" width="260">
                    <h4><p class="text-white"><b>En este apartado se editaran todos los datos del cliente que se quiera modificar</b></p></h4>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</div>
</html>

