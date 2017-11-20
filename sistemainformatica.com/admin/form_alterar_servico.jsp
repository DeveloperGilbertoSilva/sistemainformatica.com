<%
    //Verifica se está logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {


%>
<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>
<%@page import="model.CategoriaServico"%>
<%@page import="model.CategoriaServicoDAO"%>
<%@page import="model.GaleriaCategoria"%>
<%@page import="model.GaleriaCategoriaDAO"%>
<%@page import="java.util.ArrayList"%>


<%    Servico servico = new Servico();
    ServicoDAO servicoDAO = new ServicoDAO();

    CategoriaServico categoriaServico = new CategoriaServico();
    CategoriaServicoDAO categoriaServicoDAO = new CategoriaServicoDAO();

    GaleriaCategoriaDAO galeriaCategoriaDAO = new GaleriaCategoriaDAO();

    int idCategoria = 0;
    String categoria = "";
    String function = request.getParameter("function");

    ArrayList<Servico> arrayServico = new ArrayList<Servico>();
    ArrayList<CategoriaServico> arrayCategoriaServico = new ArrayList<CategoriaServico>();
    ArrayList<GaleriaCategoria> arrayGaleriaCategoria = new ArrayList<GaleriaCategoria>();

    int id = Integer.parseInt(request.getParameter("id"));
    try {
        arrayServico = servicoDAO.listaServico();
        arrayCategoriaServico = categoriaServicoDAO.listaCategoria();
        servico = servicoDAO.listaServicoEspecifico(id);
        arrayGaleriaCategoria = galeriaCategoriaDAO.listaImagemGaleria();

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
        <link rel="stylesheet" type="text/css" href="css/lists.css">
        <link rel="stylesheet" type="text/css" href="css/categoria.css">

        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">

        <!--==============================SCRIPT==============================-->
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                CKEDITOR.replace('textarea');
            };

            function mudaId(idCat) {
                var newId;

                newId = idCat;
            }
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


        <!--==============================ADMIN-CATEGORIA==============================-->   
        <%
            if (function.equals("alter")) {
                idCategoria = Integer.parseInt(request.getParameter("idCat"));

        %>
        <script>
            $(document).ready(function () {
                $(".fundo").show();
                $(".insert").hide();
                $(".insert_galeria").hide();
                $(".list").hide();
                $(".alter").show();
                $(".galeria").hide();
                $(".list_galeria").hide();
                $(".container-fluid").hide();

                $("#config_categoria").click(function () {
                    $(".fundo").fadeIn();
                    $(".insert,.list").show();
                    $(".alter").hide();
                    $(".insert_galeria, .galeria").hide();
                    $(".galeria").hide();
                    $(".list_galeria").hide();
                    $(".container-fluid").hide();
                });

                $(".btnAlterarCategoria").click(function () {
                    $(".insert, .list").hide();
                });

                $("#config_galeria").click(function () {
                    $(".fundo").fadeIn();
                    $(".insert,.list").hide();
                    $(".alter").hide();
                    $(".insert_galeria, .galeria").show();
                    $(".list_galeria").hide();
                    $(".container-fluid").hide();
                });
            });
        </script>
        <%} else if (function.equals("categoria")) {

            categoria = request.getParameter("categoria");
        %>
        <script>
            $(document).ready(function () {
                $(".fundo").show();
                $(".insert").hide();
                $(".insert_galeria").hide();
                $(".list").hide();
                $(".alter").hide();
                $(".galeria").hide();
                $(".list_galeria").show();
                $(".container-fluid").hide();

                $("#config_categoria").click(function () {
                    $(".fundo").fadeIn();
                    $(".insert,.list").show();
                    $(".alter").hide();
                    $(".insert_galeria, .galeria").hide();
                    $(".galeria").hide();
                    $(".list_galeria").hide();
                    $(".container-fluid").hide();
                });

                $(".btnAlterarCategoria").click(function () {
                    $(".insert, .list").hide();
                });

                $("#config_galeria").click(function () {
                    $(".fundo").fadeIn();
                    $(".insert,.list").hide();
                    $(".alter").hide();
                    $(".insert_galeria, .galeria").show();
                    $(".list_galeria").hide();
                    $(".container-fluid").hide();
                });
            });
        </script>
        <%} else {%>
        <script>
            $(document).ready(function () {
                $(".fundo").hide();
                $(".insert").hide();
                $(".list").hide();
                $(".alter").hide();
                $(".insert_galeria, .galeria").hide();
                $(".container-fluid").show();

                $("#config_categoria").click(function () {
                    $(".fundo").show();
                    $(".insert,.list").show();
                    $(".alter").hide();
                    $(".insert_galeria,.galeria").hide();
                    $(".list_galeria").hide();
                    $(".container-fluid").hide();
                });

                $("#config_galeria").click(function () {
                    $(".fundo").show();
                    $(".insert,.list").hide();
                    $(".alter").hide();
                    $(".insert_galeria,.galeria").show();
                    $(".list_galeria").hide();
                    $(".container-fluid").hide();
                });
                $("#add_galeria").click(function () {
                    $(".fundo").show();
                    $(".insert,.list").hide();
                    $(".alter").hide();
                    $(".insert_galeria, .galeria").show();
                    $(".list_galeria").show();
                    $(".container-fluid").hide();
                });
            });
        </script>
        <%}%>

        <div class="fundo">
            <div class="painel">
                <button class="btnClosePainel">
                    <i class="fa fa-close"></i>
                </button>
                <!--==============================INSERT==============================-->
                <div class="insert">
                    <center>
                        <h4><i class="fa fa-plus"></i>&nbsp;Inserir nova categoria:</h4>
                        <form action="../gerente_categoria_servico.do" method="POST" class="form_categoria" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="inserir">
                            <input type="hidden" name="idServico" value="<%=servico.getId()%>">
                            <label>Nome: </label><br/>
                            <input type="text" name="nome_categoria"><br/>
                            <label>Diretório: </label><br/>
                            <input type="text" name="nome_diretorio"><br/>
                            <label>Serviço: </label><br/>
                            <select name="categoria_servico" id="select_servico">
                                <option selected><%=servico.getDiretorio()%></option>
                            </select><br/>
                            <label>Imagem: </label>
                            <h5 style="color: red;">Tamanho recomendado: 80x80</h5>
                            <br/>
                            <input type="file" name="imagem_categoria" id="img_categoria" accept=".jpg" required><br/><br/>
                            <%
                                if (categoriaServicoDAO.limitaIcons(servico.getNome()) >= 10) {
                            %>
                            <input type="submit" name="btnEnviar" value="Cadastrar categoria" style="display: none;"> 
                            <span style="display: block;">O limite de 10 categorias foi atingido</span>
                            <%} else {%>
                            <input type="submit" name="btnEnviar" value="Cadastrar categoria" style="display: block;">
                            <span style="display: none;">Só é possível cadastrar até 10 categorias</span>
                            <%}%>
                        </form>
                    </center>
                </div>
                <!--==============================INSERT-GALERIA==============================-->
                <div class="insert_galeria">
                    <center>
                        <h4><i class="fa fa-plus"></i>&nbsp;Inserir nova galeria</h4>
                        <form action="../gerente_galeria_categoria.do" method="POST" name="form_inserirImg_galeria" class="form_insert_galeria" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="inserir">
                            <input type="hidden" name="servico" value="<%=servico.getDiretorio()%>">
                            <input type="hidden" name="idServico" value="<%=servico.getId()%>">
                            <label>Categoria: </label>
                            <select name="categoria_galeria" id="select_categoria_servico">
                                <option selected></option>
                                <%
                                    if (!arrayCategoriaServico.isEmpty()) {
                                        for (CategoriaServico cs : arrayCategoriaServico) {
                                            if (cs.getServico().equals(servico.getDiretorio())) {
                                %>
                                <option><%=cs.getDiretorio()%></option>
                                <%}
                                        }
                                    }%>
                            </select><br/><br/>
                            <label>Selecione a imagem:</label> <br/>
                            <input type="file" name="imagem_galeria" id="img_galeria" accept=".jpg">
                            <br/><br/>
                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Inserir Imagem">
                        </form>
                    </center>
                </div>
                <!--==============================LIST==============================-->                
                <div class="list">
                    <center>
                        <h4><i class="fa fa-list"></i>&nbsp; Categorias Cadastradas:</h4>
                        <h5 id="msgCategoria" style="display: block;"><%out.print("Não há dados");%></h5>
                        <table id="table_categoria" class="tableSmall" style="visibility: hidden;">
                            <%
                                if (!arrayCategoriaServico.isEmpty()) {
                            %>
                            <tr>
                                <th class="table_padding">Nome</th>
                            </tr>
                            <%
                                for (CategoriaServico cs : arrayCategoriaServico) {
                                    if (cs.getServico().equals(servico.getDiretorio())) {
                            %>
                            <script>
                                $(document).ready(function () {
                                    $("#msgCategoria").css('display', 'none');
                                    $("#table_categoria").css('visibility', 'visible');
                                });
                            </script>
                            <tr>
                                <td class="table_padding"><%=cs.getDiretorio()%></td>
                                <td class="table_padding">
                                    <button class="btnAlterarCategoria" onclick="location = 'form_alterar_servico.jsp?id=<%=id%>&function=alter&idCat=<%=cs.getId()%>'">
                                        <i class="fa fa-pencil"></i>
                                    </button><br/>

                                    <button onclick="if (confirm('Tem certeza de que deseja excluir a categoria?')) {
                                                location = '../gerente_categoria_servico.do?opExcluir=excluir&idExcluir=<%=cs.getId()%>&imagem=<%=cs.getImagem()%>&diretorio=<%=cs.getDiretorio()%>&idServ=<%=servico.getId()%>&categoria=<%=cs.getDiretorio()%>';
                                            }">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <%}
                                    }
                                }
                            %>
                        </table>
                    </center>
                </div>
                <!--==============================LIST-GALERIA==============================-->                
                <div class="galeria">
                    <center>
                        <h4><i class="fa fa-list"></i>&nbsp; Galerias Cadastradas:</h4>
                        <h5 id="msg_list_galeria" style="display: block;"><%out.print("Não há dados");%></h5>
                        <table id="table_galeria" class="tableSmall" style="visibility: hidden;">
                            <tr>
                                <th class="table_padding" style="text-align: center;">Imagem</th>
                            </tr>
                            <%
                                for (CategoriaServico cs : arrayCategoriaServico) {
                                    if (cs.getServico().equals(servico.getDiretorio())) {
                                        if (!arrayGaleriaCategoria.isEmpty()) {

                            %>
                            <tr>
                                <td class="table_padding">
                                    <div id="icon<%=cs.getId()%>" class="icon" style="
                                         display: none;
                                         background: url('../servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/<%=cs.getImagem()%>');
                                         background-position: 50%;
                                         background-size: cover;
                                         background-repeat: no-repeat;
                                         cursor: pointer;
                                         ">
                                    </div>
                                    <h5 id="nome<%=cs.getId()%>" style="display: none;"><%=cs.getDiretorio()%></h5>
                                </td>
                            </tr>
                            <%
                                for (GaleriaCategoria gc : arrayGaleriaCategoria) {
                                    if (gc.getCategoria().equals(cs.getDiretorio())) {
                            %>
                            <script>
                                $(document).ready(function () {
                                    $("#msg_list_galeria").css('display', 'none');
                                    $("#table_galeria").css('visibility', 'visible');
                                    $("#icon<%=cs.getId()%>").css('display', 'block');
                                    $("#icon<%=cs.getId()%>").click(function () {
                                        location = 'form_alterar_servico.jsp?id=<%=servico.getId()%>&function=categoria&categoria=<%=gc.getCategoria()%>';
                                        $(".insert_galeria").hide();
                                        $(".galeria").hide();
                                    });
                                    $("#nome<%=cs.getId()%>").css('display', 'block');
                                });
                            </script>

                            <%}
                                            }
                                        }
                                    }
                                }%>
                        </table>
                    </center>
                </div>
                <!--========================LISTAGEM DE IMAGENS DA GALERIA========================-->
                <div class="list_galeria">
                    <center>
                        <h4><i class="fa fa-list"></i>&nbsp; Imagens da galeria:</h4>
                        <h5 id="msg_list_imagem_galeria" style="display: block;"><%out.print("Não há dados");%></h5>
                        <table id="table_imagem_galeria" class="tableSmall" style="visibility: hidden;">
                            <tr>
                                <th class="table_padding"> Imagens </th>
                                <th class="table_padding"></th>
                            </tr>
                            <%
                                try {
                                    arrayGaleriaCategoria = galeriaCategoriaDAO.listaGaleriaCategoria(categoria);
                                } catch (Exception e) {
                                    out.print("Não foi possível realizar a listagem da galeria: " + e.getMessage());
                                }
                                if (!arrayGaleriaCategoria.isEmpty()) {
                                    for (GaleriaCategoria gc : arrayGaleriaCategoria) {
                            %>
                            <script>
                                $(document).ready(function () {
                                    $("#msg_list_imagem_galeria").css('display', 'none');
                                    $("#table_imagem_galeria").css('visibility', 'visible');
                                });
                            </script>
                            <tr>
                                <td class="table_padding">
                                    <div class="icon" style="
                                         background: url('../servico/<%=servico.getDiretorio()%>/<%=gc.getCategoria()%>/galeria/<%=gc.getImagem()%>');
                                         background-position: 50%;
                                         background-size: cover;
                                         background-repeat: no-repeat;
                                         cursor: pointer;
                                         ">
                                    </div>
                                         <h5><%out.print(gc.getImagem());%></h5>
                                </td>
                                <td class="table_padding">
                                    <button onclick="if(confirm('Tem certeza de que deseja excluir? ')){
                                        location='../gerente_galeria_categoria.do?opExcluir=excluir&idExcluir=<%=gc.getId()%>&idServico=<%=id%>&diretorio=<%=gc.getServico()%>&imagemExcluir=<%=gc.getImagem()%>&cat=<%=gc.getCategoria()%>';
                                    
                                    }">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <%}
                                }%>
                        </table>
                    </center>
                </div>

                <!--==============================ALTER==============================-->
                <div class="alter">
                    <center>
                        <h4><i class="fa fa-pencil"></i>&nbsp;Alterar categoria</h4>
                        <%
                            categoriaServico = categoriaServicoDAO.listaCategoriaServicoEspecifica(idCategoria);
                        %>
                        <div class="img">
                            <form action="../gerente_imagem_categoria_servico.do" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="idCat" value="<%=idCategoria%>">
                                <input type="hidden" name="idServico" value="<%=servico.getId()%>">
                                <input type="hidden" name="nome" value="<%=categoriaServico.getImagem()%>">

                                <button class="button trash_imagem">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>
                            <img src="../servico/<%=categoriaServico.getServico()%>/<%=categoriaServico.getDiretorio()%>/<%=categoriaServico.getImagem()%>" alt="Sem Imagem">				
                        </div>
                        <form action="../gerente_categoria_servico.do" method="POST" class="form_alter_categoria" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="alterar">
                            <input type="hidden" name="nome_antigo" value="<%=categoriaServico.getDiretorio()%>">

                            <input type="hidden" name="id" value="<%=categoriaServico.getId()%>">
                            <input type="hidden" name="idServico" value="<%=servico.getId()%>">
                            <label>Nome: </label><br/>
                            <input type="text" name="nome_categoria" value="<%=categoriaServico.getNome()%>"><br/>
                            <label>Diretório </label><br/>
                            <input type="text" name="nome_diretorio" value="<%=categoriaServico.getDiretorio()%>"><br/>
                            <label>Serviço: </label><br/>
                            <select name="categoria_servico" id="select">
                                <%
                                    for (Servico servicoOption : arrayServico) {
                                        if (servicoOption.getNome().equals(categoriaServico.getServico())) {
                                %>
                                <option selected><%=servicoOption.getNome()%></option>
                                <%} else {%>
                                <option ><%=servicoOption.getNome()%></option>
                                <%}
                                    }%>
                            </select><br/>
                            <label>Imagem:</label>
                            <%
                                if (function.equals("alter")) {
                                    if (categoriaServico.getImagem().isEmpty()) {
                            %>
                            <h5 style="color: red;">Tamanho recomendado: 80x80</h5>
                            <br/>
                            <input type="file" name="img_servico" id="img_categoria" accept=".jpg" required>
                            <%} else {%>
                            Para alterar a imagem, exclua a atual<br/>
                            <input type="file" name="img_servico" accept=".jpg" style="display: none;">
                            <%}
                                }%><br/>

                            <input type="submit" name="btnEnviar" value="Alterar categoria">
                        </form>
                    </center>
                </div>
            </div>
        </div>


        <div class="container-fluid">
            <div class="row">
                <!--==============================HEADER==============================-->
                <header id="headerAdministrativo" class="header col-xs-12">
                    <h1 class="title">
                        <i class="fa fa-pencil"></i>&nbsp;
                        Alteração de serviço
                    </h1>

                    <button class="button btnVoltar" onclick="location = 'administrativo.jsp'">
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
                <section id="sectionAdministrativo" class="col-xs-12">
                    <center>
                        <div class="img">
                            <form action="../gerente_imagem_servico.do" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%=servico.getId()%>">
                                <input type="hidden" name="logo" value="<%=servico.getImagem()%>">
                                <input type="hidden" name="diretorio" value="<%=servico.getDiretorio()%>">

                                <button class="button trash_imagem">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>
                            <img src="../servico/<%=servico.getDiretorio()%>/<%=servico.getImagem()%>" alt="Sem Imagem">				
                        </div>

                        <form action="../gerente_servico.do" method="POST" name="form_inserirServico" id="form_inserirServico" class="form" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="alterar">
                            <input type="hidden" name="id" value="<%=servico.getId()%>">
                            <input type="hidden" name="nomeAntigo" value="<%=servico.getDiretorio()%>">

                            <label>Nome do serviço:<br/> <span>Max: 50 caracteres</span> </label><br/>
                                <%
                                    if (servico.getImagem().isEmpty()) {
                                %>
                            <input type="text" name="nome" placeholder="Insira o nome do servico" size="50" maxlength="50" value="<%=servico.getNome()%>" style="display: block;" readonly><br/>
                            <span style="display: block;">Insira uma imagem para alterar o nome</span>
                            <br/>
                            <input type="text" name="nome" placeholder="Insira o nome do servico" size="50" maxlength="50" value="<%=servico.getNome()%>" style="display: none;">
                            <%} else {%>
                            <input type="text" name="nome" placeholder="Insira o nome do servico" size="50" maxlength="50" value="<%=servico.getNome()%>" style="display: none;" readonly>
                            <span style="display: none;">Insira uma imagem para alterar o nome</span>
                            <input type="text" name="nome" placeholder="Insira o nome do servico" size="50" maxlength="50" value="<%=servico.getNome()%>" style="display: block;"><br/><br/>
                            <%}%>

                            <label>Nome do diretório<br/> <span>Max: 50 caracteres</span> </label><br/>
                                <%
                                    if (servico.getImagem().isEmpty()) {
                                %>
                            <input type="text" name="nome_diretorio" placeholder="Nome do serviço sem carac.especiais" size="50" maxlength="50" value="<%=servico.getDiretorio()%>" style="display: block;" readonly><br/>
                            <span style="display: block;">Insira uma imagem para alterar o nome do diretório</span>
                            <br/>
                            <input type="text" name="nome_diretorio" placeholder="Nome do serviço sem carac.especiais" size="50" maxlength="50" value="<%=servico.getDiretorio()%>" style="display: none;">
                            <%} else {%>
                            <input type="text" name="nome_diretorio" placeholder="Nome do serviço sem carac.especiais" size="50" maxlength="50" value="<%=servico.getDiretorio()%>" style="display: none;" readonly>
                            <span style="display: none;">Insira uma imagem para alterar o nome do diretório</span>
                            <input type="text" name="nome_diretorio" placeholder="Nome do serviço sem carac.especiais" size="50" maxlength="50" value="<%=servico.getDiretorio()%>" style="display: block;"><br/><br/>
                            <%}%>

                            <label>Descricao:</label><br/> 
                            <textarea id="textarea" name="descricao"><%=servico.getConteudo()%></textarea><br/><br/>

                            <label>Imagem:</label>
                            <%
                                if (servico.getImagem().isEmpty()) {
                            %>
                            <h5 style="color: red;">Tamanho recomendado: 80x80</h5>
                            <br/>
                            <input type="file" name="img_servico" id="img_servico" accept=".jpg" required>
                            <%} else {%>
                            <h4>Para alterar a imagem, exclua a atual</h4>
                            <input type="file" name="img_servico" accept=".jpg" style="display: none;">
                            <%}%><br/>
                            <div id="categoria_servico" class="categoria">
                                <label>Categoria: </label>
                                <br/>
                                <div id="config_categoria" class="button btnAdmin"><i class="fa fa-cogs"></i></div>
                            </div><br/>
                            <div id="galeria_servico" class="categoria">
                                <label>Galeria: </label>
                                <br/>
                                <div id="config_galeria" class="button btnAdmin"><i class="fa fa-picture-o"></i></div>
                            </div>
                            <br/><br/>
                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Alterar Serviço">
                        </form>

                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->

        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/categoria.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/validacao.js"></script>
        <script type="text/javascript">
            function filePreview(input){
                if(input.files && input.files[0]){
                    var reader = new FileReader();
                    reader.onload = function(e){
                        $("#img_servico + img").remove();
                        $("#img_servico").after('<img src="'+e.target.result+'"width="80" height="80" style="position: relative; top: 10px; border-radius: 20px;">');
                        $("#img_categoria+ img").remove();
                        $("#img_categoria").after('<img src="'+e.target.result+'"width="80" height="80" style="position: relative; top: 10px; border-radius: 20px;">');
                        $("#img_galeria + img").remove();
                        $("#img_galeria").after('<img src="'+e.target.result+'"width="80" height="80" style="position: relative; top: 10px; border-radius: 20px;">');
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#img_servico").change(function(){
                filePreview(this);
            });
            $("#img_categoria").change(function(){
                filePreview(this);
            });
            $("#img_galeria").change(function(){
                filePreview(this);
            });
        </script>
    </body>


</html>
<%
    } else {
        out.println("Você não está logado no sistema. Clique <a href='login.jsp'>aqui</a> para logar-se");
    }
%>