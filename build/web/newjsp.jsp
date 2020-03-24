<%-- 
    Document   : newjsp
    Created on : 23/03/2020, 02:20:03 AM
    Author     : FAMILIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    alert("Usuario Existente");
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <title>JUEGOS UD</title>
        <link rel = "stylesheet">
        <link href = "https://fonts.googleapis.com/css?family=Lato:300,400|Work+Sans:300,400,700" rel="stylesheet">
        <link rel = "stylesheet" href="estiloPlataforma/style.min.css">
    </head>
    <body>
        <nav id = "header-navbar" >
            <div class = "container">
                <a class = "navbar-brand d-flex align-items-center text-white" >
                    <h3 class = "font-weight-bolder mb-0">JUEGOS UD</h3>
                </a>
            </div>
        </nav> 

        <div class = "jumbotron d-flex align-items-center">
            <div class = "container text-center">
                <h1 class = "display-1 mb-4">
                    <form action="InterfazUsuario.jsp" method="post">
                        <table align="right" border="1">
                            <thead>
                                <tr>
                                    <th colspan="2">LOGIN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Username:</td>
                                    <td><input type="text" id="user" name="user_login" required></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" id="pass" name="pass_login" required></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2"><input type="submit" value="Ingresar"></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <br><br><br><br><br><br><br><br><br>
                    <form action="Register" method="post">
                        <table align="right" border="1" width="400">
                            <thead>
                                <tr>
                                    <th colspan="2">REGISTRO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Nombre:</td>
                                    <td><input type="text" id="nombre_user" name="nombre_user" required></td>
                                </tr>
                                <tr>
                                    <td>Apellido:</td>
                                    <td><input type="text" id="apellido_user" name="apellido_user" required></td>
                                </tr>
                                <tr>
                                    <td>Username:</td>
                                    <td><input type="text" id="user_register" name="user_register" required></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" id="user_pass" name="user_pass" required></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2"><input type="submit" value="Registrar"></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <br><br><br><br><br><br><br><br><br>
                    <br><br><br><br><br><br><br><br><br>
                    <br><br><br><br></h1>
            </div>
            <div class = "rectangle-1"></div>
            <div class = "rectangle-2"></div>
            <div class = "rectangle-transparent-1"></div>
            <div class = "rectangle-transparent-2"></div>
            <div class = "circle-1"></div>
            <div class = "circle-2"></div>
            <div class = "circle-3"></div>
            <div class = "triangle triangle-1">
                <img src = "estiloPlataforma/img/obj_triangle.png" alt="">
            </div>
            <div class = "triangle triangle-2">
                <img src = "estiloPlataforma/img/obj_triangle.png" alt="">
            </div>
            <div class = "triangle triangle-3">
                <img src = "estiloPlataforma/img/obj_triangle.png" alt="">
            </div>
            <div class = "triangle triangle-4">
                <img src = "estiloPlataforma/img/obj_triangle.png" alt="">
            </div>
        </div>

        <br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br>
        <br><br><br>
    </body>
</html>
