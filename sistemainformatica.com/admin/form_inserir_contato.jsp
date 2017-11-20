<%
    //Verifica se est� logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {
        

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
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>

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
                        <i class="fa fa-plus-circle"></i>&nbsp;
                        Inser��o de contato
                    </h1>

                    <button class="button btnVoltar" onclick="location='administrativo.jsp'">
                        <i class="fa fa-arrow-left"></i>
                    </button>

                    <button class="button btnLogout" onclick="location = 'logoff.jsp'">
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

                                <li id="form_liMenu_inserirContato" class="liMenu">
                                    <i class="fa fa-list"></i>
                                    <button class="button btnMenu" onclick="location = 'lista_contato.jsp'">Lista Contatos
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <form action="../gerente_contato.do" method="POST" name="form_inserirContato" class="form">
                            <input type="hidden" name="op" value="inserir">
                            <label>Nome do contato:</label><br/> <input type="text" name="nome" placeholder="EX: Facebook..." size="60" maxlength="50"><br/><br/>
                            <label>Tipo:</label><br/> 
                            <select name="tipo">
                                <option>Telefone</option>
                                <option>Endereco</option>
                                <option>Rede Social</option>
                                <option>Outro</option>
                            </select>
                            <br/><br/>
                            <h3>Preencha de acordo com o tipo selecionado</h3>

                            <label>Telefone: </label><br/>
                            <input type="text" name="telefone_contato" size="60" id="telefoneCelular" placeholder="Insira se for 'Telefone'"><br/>

                            <label>Endere�o: </label><br/>
                            <input type="text" name="endereco_contato"  size="60" placeholder="Insira se for 'Endereco'" maxlength="100"><br/>

                            <label>Rede Social: <span>Sem "http://"</span></label><br/>
                            <input type="text" name="redeSocial_contato" size="60" placeholder="Link se 'Rede Social'" maxlength="100"><br/>

                            <label>Outro:</label><br/>
                            <input type="text" name="outro_contato" size="60" placeholder="Insira se for 'Outro'" maxlength="100"><br/><br/>

                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Inserir Contato">
                        </form>
                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->
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