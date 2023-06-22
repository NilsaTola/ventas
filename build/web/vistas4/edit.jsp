<%@page import="Modelo.Ventas"%>
<%@page import="ModeloDAO.VentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <div class="card-body text-center">
        <body background="img/hoja.jpg">
            <div>
                <%
                VentaDAO dao=new VentaDAO();
                int id=Integer.parseInt((String)request.getAttribute("idven"));
                Ventas v=(Ventas)dao.list(id);
                %>
                <h1 class="font-weight-bold text-danger"><center>EDITAR VENTAS</center></h1>
                <div class="form-group">
                    <br>
                    <form action="Controlador4" class="text-white">         
                        <b>Producto:</b> <input class="col-md-5 " type="text" name="txtProducto_id" value="<%= v.getProducto_id()%>"><br><br>
                        <b>Cliente:</b> <input class="col-md-5 " type="text" name="txtCliente_id" value="<%= v.getCliente_id()%>"><br><br>
                        <b>Fecha:</b> <input class="col-md-5 " type="date" name="txtFecha" value="<%= v.getFecha()%>"><br>
                        <input type="hidden" name="txtid" value="<%= v.getId()%>"><br><br>
                        <input class="btn btn-info" type="submit" name="accion" value="Actualizar">
                        <a type="button" class="btn btn-danger" href="Controlador4?accion=listar">Regresar</a>
                    </form>
                    <br>
                    <br>
                    <br>
                    <div class="form-group text-center">

                        <img src="img/cliente.png" class="rounded float-end" alt="300" width="300">
                        <img src="img/comp.png" class="rounded float-end" alt="260" width="260">
                        <h4><p class="text-white"><b>En este apartado se editaran los datos de cada producto que se quiera modificar</b></p></h4>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        </body>
    </div>
</html>
