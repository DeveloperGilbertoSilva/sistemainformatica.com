<%
    //Verifica se está logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {


%>
<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>


<%    Cliente cliente = new Cliente();
    ClienteDAO clienteDAO = new ClienteDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        cliente = clienteDAO.listaClienteEspecifico(id);
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
                        <i class="fa fa-pencil"></i>&nbsp;
                        Alteração de cliente
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
                                    <button class="button btnMenu" onclick="location = 'administrativo.jsp'">Página Inicial</button>
                                </li>

                                <li id="form_liMenu_pagInicial" class="liMenu">
                                    <i class="fa fa-list"></i>
                                    <button class="button btnMenu" onclick="location = 'lista_cliente.jsp'">Lista Clientes
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <div class="img">
                            <form action="../gerente_logo_cliente.do" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%=cliente.getId()%>">
                                <input type="hidden" name="logo" value="<%=cliente.getLogo()%>">

                                <button class="button trash_imagem">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>
                            <img src="../cliente/<%=cliente.getLogo()%>" alt="Sem Imagem">				
                        </div>

                        <form action="../gerente_cliente.do" method="POST" name="form_inserirCliente" class="form" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="alterar">
                            <input type="hidden" name="id" value="<%=cliente.getId()%>">
                            <label>Nome do cliente: <span>Max: 50 caracteres</span> </label><br/>
                            <%
                                if (cliente.getLogo().isEmpty()) {
                            %>
                            <input type="text" name="nome" placeholder="Insira o nome do cliente" size="50" maxlength="50" value="<%=cliente.getNome()%>" style="display: block;" readonly><br/>
                            <span style="display: block;">Insira uma imagem para alterar o nome</span>
                            <br/>
                            <input type="text" name="nome" placeholder="Insira o nome do cliente" size="50" maxlength="50" value="<%=cliente.getNome()%>" style="display: none;">
                            <%} else {%>
                            <input type="text" name="nome" placeholder="Insira o nome do cliente" size="50" maxlength="50" value="<%=cliente.getNome()%>" style="display: none;" readonly>
                            <span style="display: none;">Insira uma imagem para alterar o nome</span>
                            <input type="text" name="nome" placeholder="Insira o nome do cliente" size="50" maxlength="50" value="<%=cliente.getNome()%>" style="display: block;"><br/><br/>
                            <%}%>

                            <label>Site:</label><br/> <input type="text" name="site" placeholder="Insira a URL (sem http://)" size="50" maxlength="80" value="<%=cliente.getSite()%>"><br/><br/>
                            <label>Descrição:</label><br/>
                            <textarea name="descricao" maxlength="600" cols="30" rows="10"><%=cliente.getDesc()%>
                            </textarea><br/><br/>
                            <label>Logo:</label>
                            <%
                                if (cliente.getLogo().isEmpty()) {
                            %>
                            <h5 style="color: red;">Tamanho recomendado: 80x80</h5>
                            <br/>
                            <input type="file" name="logo_cliente" accept=".jpg" required>
                            <%} else {%>
                            <h4>Para alterar a imagem, exclua a atual</h4>
                            <input type="file" name="logo_cliente" accept=".jpg" style="display: none;">
                            <%}%><br/>
                            <br/><br/>
                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Alterar Cliente">
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