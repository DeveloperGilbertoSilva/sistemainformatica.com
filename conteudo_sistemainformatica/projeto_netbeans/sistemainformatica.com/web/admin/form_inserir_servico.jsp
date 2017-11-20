<%
    //Verifica se está logado
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
        <script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                CKEDITOR.replace('textarea');
            };
        </script>
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
                                <a href="administrativo.jsp" class="link">Página Inicial</a>
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
                        Inserção de serviço
                    </h1>

                    <button class="button btnVoltar" onclick="location='administrativo.jsp'">
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
                                    <button class="button btnMenu" onclick="location = 'administrativo.jsp'">Página Inicial</button>
                                </li>

                                <li id="form_liMenu_pagInicial" class="liMenu">
                                    <i class="fa fa-list"></i>
                                    <button class="button btnMenu" onclick="location = 'lista_servico.jsp'">Lista Serviços
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <form action="../gerente_servico.do" method="POST" name="form_inserirServico" id="form_inserirServico" class="form" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="inserir">
                            <label>Nome do serviço: <span>Max: 50 caracteres</span> </label><br/>
                            <input type="text" name="nome" placeholder="Insira o nome do servico" size="50" maxlength="50"><br/>
                           
                            <label>Nome do diretório: <span>Max: 50 caracteres</span> </label><br/>
                            <input type="text" name="nome_diretorio" placeholder="Nome do serviço sem carac.especiais" size="50" maxlength="50"><br/>

                            <label>Descricao:</label><br/> 
                            <textarea id="textarea" name="descricao"></textarea><br/><br/>

                            <label>Imagem:</label>
                            <h5 style="color: red;">Tamanho recomendado: 80x80</h5>
                            <br/>
                            <input type="file" name="img_servico" accept=".jpg" required>
                            <br/><br/>
                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Inserir Serviço">
                        </form>
                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/validacao.js"></script>
    </body>


</html>
<%
    } else {
        out.println("Você não está logado no sistema. Clique <a href='login.jsp'>aqui</a> para logar-se");
    }
%>