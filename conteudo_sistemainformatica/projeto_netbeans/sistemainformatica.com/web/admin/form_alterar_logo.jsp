<%
    //Verifica se est� logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {


%>
<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>

<%    /*===================================ARMAZENANDO LISTAS COM DADOS===================================*/
    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();

    try {
        index = indexDAO.listaInfo();

    } catch (Exception e) {
        out.println("Erro na listagem: " + e.getMessage());
    }


%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Painel Principal</title>
        <!--==============================META-TAG==============================-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, inicial-scale=1">
        <!--==============================CSS==============================-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/tables.css">
        <link rel="stylesheet" type="text/css" href="css/forms.css">

        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">

        <!--==============================SCRIPT==============================-->

    </head>


    <body>
        <!--==============================MENU-SMALL==============================-->
        <div class="all menuSmall">
            <button class="button btnCloseMenu">
                <i class="fa fa-close"></i>
            </button>
            <center>
                <nav id="navSmall" class="nav col-xs-12">
                    <div class="row">
                        <ul id=ulSmall type="none" class="ulMenu col-xs-12">
                            <li id="liMenuSmall_empresa" class="liMenu liMenuSmall">
                                <i class="fa fa-home"></i>
                                <a href="administrativo.jsp" class="link">P�gina Inicial</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </center>
        </div>

        <!--==============================ADMINISTRATIVO-MOBILE==============================-->
        <div id="container_adminSmall" class="all container_admin">


        </div>
        <!--===============================================================================-->


        <div class="container-fluid">
            <div class="row">
                <!--==============================HEADER==============================-->
                <header id="headerAdministrativo" class="header col-xs-12">
                    <h1 class="title">
                        <i class="fa fa-pencil"></i>&nbsp;
                        Altera��o de contato - P�gina Inicial
                    </h1>

                    <button class="button btnVoltar" onclick="location = 'administrativo.jsp'">
                        <i class="fa fa-arrow-left"></i>
                    </button>

                    <button class="button btnLogout">
                        <i class="fa fa-power-off"></i>&nbsp;
                        Sair 
                    </button>

                    <div class="menuLong">
                        <nav class="nav">
                            <ul type="none" class="ulMenu">
                                <li id="form_liMenu_pagInicial" class="liMenu">
                                    <i class="fa fa-home"></i>
                                    <button class="button btnMenu" onclick="location = 'administrativo.jsp'">P�gina Inicial</button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <div class="img">
                            <form action="../gerente_logo_index.do" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="nome" value="<%=index.getLogo()%>">

                                <button class="button trash_imagem">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>
                            <img src="../index/<%=index.getLogo()%>" alt="Sem Imagem">				
                        </div>
                        <form action="../gerente_index.do" method="POST" name="form_inserirContato" class="form" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="alterar">
                            <label>Logomarca:</label>
                            <%
                                if (index.getLogo().isEmpty()) {
                            %>
                            <h5 style="color: red;">Tamanho recomendado: 250x80</h5>
                            <br/>
                            <input type="file" name="logomarca" accept=".png" required>
                            <%} else {%>
                            <h4>Para alterar a imagem, exclua a atual</h4>
                            <input type="file" name="logomarca" accept=".png" style="display: none;">
                            <%}%>

                            <br/><br/>
                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Alterar Contato">
                        </form>
                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/validacao.js"></script>
    </body>


</html>
<%
    } else {
        out.println("Voc� n�o est� logado no sistema. Clique <a href='login.jsp'>aqui</a> para logar-se");
    }
%>