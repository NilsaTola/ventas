<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <div>
        <body background="img/wall.jpg" class="img-fluid"/> 
        <div class="form-group text-center">
            <div class="ftext-center">
                <br>
                <h1 class="text-white"><center><i><b>SISTEMA DE VENTAS "EL MINISUPER"</b></i></center></h1>
            </div>
            <img src="img/icon.png" alt="300" width="300"/> <br>
        </div>
        <div class="form-group text-center">
            <a type="button" class="btn btn-warning"  href="Controlador?accion=listar" background="img/cliente.png"><b>CLIENTES</b></a>

            <a type="button" class="btn btn-success" href="Controlador2?accion=listar"><b>PRODUCTOS</b></a>

            <a type="button" class="btn btn-secondary" href="Controlador3?accion=listar"><b>USUARIOS</b></a>

            <a type="button" class="btn btn-primary" href="Controlador4?accion=listar"><b>VENTAS</b></a>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <br>
        <br>
        <br>
        <div class="card-body">
            <h5 class="text-white"><b>El siguiente sistema de ventas esta diseñado para registrar cada venta que se realice, esto con el fin de que el mismo sea de gran utilidad para las personas en general.
                    Este sistema web esta diseñado por los estudiantes:
                    Univ. Nilsa Emily Tola Tola y el Univ. Franz Ariel Flores Fernandez</b></h5>
        </div>
        <br>
        <br>
        <div class="form-group text-center">
            <img src="img/FOTO.jpeg" class="rounded float-start" alt="208" width="208">
            <label class="text-white"><b>Univ. Nilsa Emily Tola Tola <br></b></label>        
            <img src="img/foto2.jpeg" class="rounded float-end" alt="200" width="200">
            <label class="text-white"><b>Univ. Franz Ariel Flores Fernandez  <br></b></label></b></label>
        </div>
    </body>
</div>
</html>
