<%
    //Verifica se está logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {
        

%>
<%@page import="model.Contato"%>
<%@page import="model.ContatoDAO"%>


<%

    Contato contato = new Contato();

    try {
        int id = Integer.parseInt(request.getParameter("id"));

        ContatoDAO contatoDAO = new ContatoDAO();
        contato = contatoDAO.listaContatoEspecifico(id);
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
                        Alteração de contato
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
                            <input type="hidden" name="op" value="alterar">
                            <input type="hidden" name="id" value="<%=contato.getId()%>">
                            
                            <label>Nome do contato:</label><br/> <input type="text" name="nome" placeholder="EX: Facebook..." size="60" maxlength="50" value="<%=contato.getNome()%>"><br/><br/>
                            <label>Tipo:</label><br/> 
                            <select name="tipo">
                                <%
                                    if (contato.getTipo().equals("Telefone")) {
                                %>
                                <option selected>Telefone</option>
                                <%} else if (contato.getTipo().equals("Endereco")) {%>
                                <option selected>Endereco</option>
                                <%} else if (contato.getTipo().equals("Rede Social")) {%>
                                <option selected>Rede Social</option>
                                <%} else if (contato.getTipo().equals("Outro")) {%>
                                <option selected>Outro</option>
                                <%}%>
                            </select>
                            <br/><br/>

                            <%
                                if (contato.getTipo().equals("Telefone")) {
                            %>
                            <label>Telefone: </label><br/>
                            <input type="text" name="telefone" id="telefoneCelular" size="60" placeholder="Insira se for 'Telefone'"  required value="<%=contato.getConteudo()%>"><br/>

                            <label style="display: none">Endereço: </label><br/>
                            <input style="display: none" type="text" name="endereco"  size="60" placeholder="Insira se for 'Endereco'" maxlength="100"><br/>

                            <label style="display: none">Rede Social: <span>Sem "http://"</span></label><br/>
                            <input style="display: none" type="text" name="redeSocial" size="60" placeholder="Insira se for 'Rede Social'" maxlength="100"><br/><br/>

                            <label style="display: none">Outro:</label><br/>
                            <input style="display: none" type="text" name="outro" size="60" placeholder="Insira se for 'Outro'" maxlength="100"><br/><br/>


                            <%} else if (contato.getTipo().equals("Endereco")) {%>
                            <label style="display: none">Telefone: </label><br/>
                            <input style="display: none" type="text" name="telefone" id="telefone" size="60" placeholder="Insira se for 'Telefone'" maxlength="11"><br/>

                            <label>Endereço: </label><br/>
                            <input type="text" name="endereco"  size="60" placeholder="Insira se for 'Endereco'" maxlength="100" value="<%=contato.getConteudo()%>"><br/>

                            <label style="display: none">Rede Social: <span>Sem "http://"</span></label><br/>
                            <input style="display: none" type="text" name="redeSocial" size="60" placeholder="Insira se for 'Rede Social'" maxlength="100"><br/><br/>

                            <label style="display: none">Outro:</label><br/>
                            <input style="display: none" type="text" name="outro" size="60" placeholder="Insira se for 'Outro'" maxlength="100"><br/><br/>


                            <%} else if (contato.getTipo().equals("Rede Social")) {%>

                            <label style="display: none">Telefone: </label><br/>
                            <input style="display: none" type="text" name="telefone" id="telefone" size="60" placeholder="Insira se for 'Telefone'" maxlength="11"><br/>

                            <label style="display: none">Endereço: </label><br/>
                            <input style="display: none" type="text" name="endereco"  size="60" placeholder="Insira se for 'Endereco'" maxlength="100"><br/>

                            <label>Rede Social: <span>Sem "http://"</span></label><br/>
                            <input type="text" name="redeSocial" size="60" placeholder="Link se 'Rede Social'" maxlength="100" value="<%=contato.getConteudo()%>"><br/><br/>

                            <label style="display: none">Outro:</label><br/>
                            <input style="display: none" type="text" name="outro" size="60" placeholder="Insira se for 'Outro'" maxlength="100"><br/><br/>


                            <%} else if (contato.getTipo().equals("Outro")) {%>

                            <label style="display: none">Telefone: </label><br/>
                            <input style="display: none" type="text" name="telefone" id="telefone" size="60" placeholder="Insira se for 'Telefone'" maxlength="11"><br/>

                            <label style="display: none">Endereço: </label><br/>
                            <input style="display: none" type="text" name="endereco"  size="60" placeholder="Insira se for 'Endereco'" maxlength="100"><br/>

                            <label style="display: none">Rede Social: <span>Sem "http://"</span></label><br/>
                            <input style="display: none" type="text" name="redeSocial" size="60" placeholder="Insira se for 'Rede Social'" maxlength="100"><br/><br/>

                            <label>Outro:</label><br/>
                            <input type="text" name="outro" size="60" placeholder="Insira se for 'Outro'" maxlength="100" value="<%=contato.getConteudo()%>"><br/><br/>
                            <%}%>


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
        out.println("Você não está logado no sistema. Clique <a href='login.jsp'>aqui</a> para logar-se");
    }
%>