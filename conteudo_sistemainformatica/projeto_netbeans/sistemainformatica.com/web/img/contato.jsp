<%-- 
    Document   : contato
    Created on : 02/08/2017, 19:01:39
    Author     : Gilberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Informática</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/320.css">
        <link rel="stylesheet" type="text/css" href="css/768.css">
        <link rel="stylesheet" type="text/css" href="css/992.css">
        <link rel="stylesheet" type="text/css" href="css/1200.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">
    </head>
    <body>
        <nav class="menuSmall col-xs-12">
            <button id="closeMenu" class="btnMenu">
                <i class="fa fa-close"></i>
            </button>
            <center>
                <ul type="none">
                    <li onclick="location = 'index.html'">
                        <i class="fa fa-home"></i>
                        <br/>
                        Início
                    </li>
                    <li onclick="location = 'empresa.html'">
                        <i class="fa fa-info"></i>
                        <br/>
                        A Empresa
                    </li>
                    <li onclick="location = 'servicos.html'">
                        <i class="fa fa-cogs"></i>
                        <br/>
                        Serviços
                    </li>
                    <li onclick="location = 'cliente.html'">
                        <i class="fa fa-user"></i>
                        <br/>
                        Clientes
                    </li>
                    <li onclick="location = 'parceiro.html'">
                        <i class="fa fa-users"></i>
                        <br/>
                        Parceiros
                    </li>
                </ul>
            </center>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <header class="header col-xs-12">
                    <center>
                        <div class="row">
                            <div class="menuLong col-xs-12">
                                <button id="openMenu" class="btnMenu">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <nav>
                                    <ul type="none">
                                        <li onclick="location = 'index.html'">
                                            <i class="fa fa-home"></i>
                                            &nbsp;Início
                                        </li>
                                        <li onclick="location = 'empresa.html'">
                                            <i class="fa fa-info"></i>
                                            &nbsp;A Empresa
                                        </li>
                                        <li onclick="location = 'servico.html'">
                                            <i class="fa fa-cogs"></i>
                                            &nbsp;Serviços
                                        </li>
                                        <li onclick="location = 'cliente.html'">
                                            <i class="fa fa-user"></i>
                                            &nbsp;Clientes
                                        </li>
                                        <li onclick="location = 'parceiro.html'">
                                            <i class="fa fa-users"></i>
                                            &nbsp;Parceiros
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="row">
                            <a href="index.html"><div class="logo"></div></a>
                        </div>
                    </center>
                </header>
            </div>
        </div>
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
