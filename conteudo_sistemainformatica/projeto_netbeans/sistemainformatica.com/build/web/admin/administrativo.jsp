<%
    //Verifica se está logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {


%>

<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>

<%@page import="model.Parceiro"%>
<%@page import="model.ParceiroDAO"%>

<%@page import="model.Contato"%>
<%@page import="model.ContatoDAO"%>

<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>

<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>

<%@page import="model.GaleriaCategoria"%>
<%@page import="model.GaleriaCategoriaDAO"%>

<%@page import="model.Slider"%>
<%@page import="model.SliderDAO"%>

<%@page import="model.Usuario"%>
<%@page import="model.UsuarioDAO"%>

<%@page import="model.CategoriaServico"%>
<%@page import="model.CategoriaServicoDAO"%>



<%@page import="java.util.ArrayList"%>

<%    /*===================================ARMAZENANDO LISTAS COM DADOS===================================*/
    ArrayList<Cliente> arrayCliente = new ArrayList<Cliente>();
    ArrayList<Parceiro> arrayParceiro = new ArrayList<Parceiro>();
    ArrayList<Contato> arrayContato = new ArrayList<Contato>();
    ArrayList<Servico> arrayServico = new ArrayList<Servico>();
    ArrayList<Index> arrayIndex = new ArrayList<Index>();
    ArrayList<GaleriaCategoria> arrayGaleria = new ArrayList<GaleriaCategoria>();
    ArrayList<Slider> arraySlider = new ArrayList<Slider>();
    ArrayList<CategoriaServico> arrayCategoriaServico = new ArrayList<CategoriaServico>();

    ClienteDAO clienteDAO = new ClienteDAO();
    ParceiroDAO parceiroDAO = new ParceiroDAO();
    ContatoDAO contatoDAO = new ContatoDAO();
    ServicoDAO servicoDAO = new ServicoDAO();
    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();
    GaleriaCategoriaDAO galeriaDAO = new GaleriaCategoriaDAO();
    SliderDAO sliderDAO = new SliderDAO();
    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    CategoriaServico categoriaServico = new CategoriaServico();
    CategoriaServicoDAO categoriaServicoDAO = new CategoriaServicoDAO();

    try {
        arrayCliente = clienteDAO.listaCliente();
        arrayParceiro = parceiroDAO.listaParceiro();
        arrayContato = contatoDAO.listaContato();
        arrayGaleria = galeriaDAO.listaImagemGaleria();
        arraySlider = sliderDAO.listaImagens();
        arrayServico = servicoDAO.listaServico();
        index = indexDAO.listaInfo();
        arrayCategoriaServico = categoriaServicoDAO.listaCategoria();

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
        <link rel="stylesheet" type="text/css" href="css/administrativo.css">
        <link rel="stylesheet" type="text/css" href="css/tables.css">

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
                                <i class="fa fa-info"></i>
                                <a href="#" class="link">Empresa</a>
                            </li>

                            <li id="liMenuSmall_servico" class="liMenu liMenuSmall">
                                <i class="fa fa-cogs"></i>
                                <a href="#" class="link">Serviços</a>
                            </li>

                            <li id="liMenuSmall_cliente" class="liMenu liMenuSmall">
                                <i class="fa fa-user"></i>
                                <a href="#" class="link">Cliente</a>
                            </li>

                            <li id="liMenuSmall_parceiro" class="liMenu liMenuSmall">
                                <i class="fa fa-users"></i>
                                <a href="#" class="link">Parceiro</a>
                            </li>

                            <li id="liMenuSmall_contato" class="liMenu liMenuSmall">
                                <i class="fa fa-phone"></i>
                                <a href="#" class="link">Contato</a>
                            </li>
                            <li id="liMenuSmall_administrativo" class="liMenu liMenuSmall">
                                <i class="fa fa-address-card"></i>
                                <a href="#" class="link">Administrativo</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </center>
        </div>

        <!--==============================ADMINISTRATIVO-MOBILE==============================-->
        <div id="container_adminSmall" class="all container_admin">

            <div id="empresa_adminSmall" class="all adminSmall">
                <button class="button btnCloseMenu btnCloseContainer">
                    <i class="fa fa-close"></i>
                </button>
                <center>
                    <h3><i class="fa fa-info"></i>&nbsp;&nbsp;Sobre a empresa</h3>
                    <table class="tableSmall table_border">
                        <tr>
                            <th class="table_border table_padding">Temas</th>
                        </tr>

                        <tr>
                            <td class="table_border table_padding">Historico</td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_historico_empresa.jsp'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_border table_padding">Visão</td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_visao_empresa.jsp'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_border table_padding">Missão</td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_missao_empresa.jsp'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_border table_padding">Valores</td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_valores_empresa.jsp'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td class="table_border table_padding">Equipe</td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_equipe_empresa.jsp'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
            <!--===============================================================================-->

            <div id="servico_adminSmall" class="all adminSmall">
                <button class="button btnCloseMenu btnCloseContainer">
                    <i class="fa fa-close"></i>
                </button>
                <center>
                    <h3><i class="fa fa-cogs"></i>&nbsp;Serviços</h3>
                    <button class="button btnAdmin" onclick="location = 'lista_servico.jsp'"><i class="fa fa-list"></i>&nbsp;Lista serviços</button>
                    <button class="button btnAdmin" onclick="location = 'form_inserir_servico.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir serviço</button>
                    <h5 id="msg_servico_small" style="display: block;">Não há dados</h5>
                    <table id="table_servico_small" class="tableSmall table_border" style="visibility: hidden;">
                        <tr>
                            <th class="table_border table_padding">Nome</th>
                        </tr>
                        <%                            if (arrayServico.isEmpty()) {
                        %>
                        <%} else {%>
                        <script>
                            $(document).ready(function () {
                                $("#msg_servico_small").css('display', 'none');
                                $("#table_servico_small").css('visibility', 'visible');
                            });
                        </script>  
                        <%
                            for (Servico servicoSmall : arrayServico) {
                        %>

                        <tr>
                            <td class="table_border table_padding">
                                <div class="icon" style="
                                     background: url('../servico/<%=servicoSmall.getDiretorio()%>/<%=servicoSmall.getImagem()%>');
                                     background-position: 50%;
                                     background-size: cover;
                                     background-repeat: no-repeat;
                                     ">
                                </div>
                                <h5><%=servicoSmall.getNome()%></h5>
                            </td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_servico.jsp?id=<%=servicoSmall.getId()%>&function=default'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                                <br/>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </table>
                    <br/>
                </center>
            </div>

            <!--===============================================================================-->

            <div id="cliente_adminSmall" class="all adminSmall">
                <button class="button btnCloseMenu btnCloseContainer">
                    <i class="fa fa-close"></i>
                </button>
                <center>
                    <h3><i class="fa fa-user"></i>&nbsp;Cliente</h3>
                    <button class="button btnAdmin" onclick="location = 'lista_cliente.jsp'"><i class="fa fa-list"></i>&nbsp;Lista clientes</button>
                    <button class="button btnAdmin" onclick="location = 'form_inserir_cliente.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir cliente</button>
                    <h5 id="msg_cliente_small" style="display: block;">Não há dados</h5>
                    <table id="table_cliente_small" class="tableSmall table_border" style="visibility: hidden;">
                        <tr>
                            <th class="table_border table_padding">Nome</th>
                        </tr>
                        <%
                            if (arrayCliente.isEmpty()) {
                        %>
                        <%} else {%>
                        <script>
                            $(document).ready(function () {
                                $("#msg_cliente_small").css('display', 'none');
                                $("#table_cliente_small").css('visibility', 'visible');
                            });
                        </script>  
                        <%
                            for (Cliente clienteSmall : arrayCliente) {

                        %>

                        <tr>
                            <td class="table_border table_padding">
                                <div class="icon" style="
                                     background: url('../cliente/<%=clienteSmall.getLogo()%>');
                                     background-position: 50%;
                                     background-size: cover;
                                     background-repeat: no-repeat;
                                     ">
                                </div>
                                <h5><%=clienteSmall.getNome()%></h5>
                            </td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_cliente.jsp?id=<%=clienteSmall.getId()%>'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </table>
                    <br/>
                </center>
            </div>

            <!--===============================================================================-->

            <div id="parceiro_adminSmall" class="all adminSmall">
                <button class="button btnCloseMenu btnCloseContainer">
                    <i class="fa fa-close"></i>
                </button>
                <center>
                    <h3><i class="fa fa-users"></i>&nbsp;Parceiro</h3>
                    <button class="button btnAdmin" onclick="location = 'lista_parceiro.jsp'"><i class="fa fa-list"></i>&nbsp;Lista parceiros</button>
                    <button class="button btnAdmin" onclick="location = 'form_inserir_parceiro.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir parceiro</button>
                    <h5 id="msg_parceiro_small" style="display: block;">Não há dados</h5>
                    <table id="table_parceiro_small" class="tableSmall table_border" style="visibility: hidden;">
                        <tr>
                            <th class="table_border table_padding">Nome</th>
                        </tr>
                        <%
                            if (arrayParceiro.isEmpty()) {
                        %>
                        <%} else {%>
                        <script>
                            $(document).ready(function () {
                                $("#msg_parceiro_small").css('display', 'none');
                                $("#table_parceiro_small").css('visibility', 'visible');
                            });
                        </script>  
                        <%
                            for (Parceiro parceiroSmall : arrayParceiro) {
                        %>

                        <tr>
                            <td class="table_border table_padding">
                                <div class="icon" style="
                                     background: url('../parceiro/<%=parceiroSmall.getLogo()%>');
                                     background-position: 50%;
                                     background-size: cover;
                                     background-repeat: no-repeat;
                                     ">
                                </div>
                                <h5><%=parceiroSmall.getNome()%></h5>
                            </td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_parceiro.jsp?id=<%=parceiroSmall.getId()%>'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </table>
                    <br/>
                </center>
            </div>

            <!--===============================================================================-->

            <div id="contato_adminSmall" class="all adminSmall">
                <button class="button btnCloseMenu btnCloseContainer">
                    <i class="fa fa-close"></i>
                </button>
                <center>
                    <h3><i class="fa fa-phone"></i>&nbsp;Contato</h3>
                    <button class="button btnAdmin" onclick="location = 'lista_contato.jsp'"><i class="fa fa-list"></i>&nbsp;Lista contatos</button>
                    <button class="button btnAdmin" onclick="location = 'form_inserir_contato.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir contato</button>
                    <h5 id="msg_contato_small" style="display: block;">Não há dados</h5>
                    <table id="table_contato_small" class="tableSmall table_border" style="visibility: hidden;">
                        <tr>
                            <th class="table_border table_padding">Nome</th>
                        </tr>
                        <%
                            if (arrayContato.isEmpty()) {
                        %>

                        <%} else {%>
                        <script>
                            $(document).ready(function () {
                                $("#msg_contato_small").css('display', 'none');
                                $("#table_contato_small").css('visibility', 'visible');
                            });
                        </script>  
                        <%
                            for (Contato contatoSmall : arrayContato) {
                        %>

                        <tr>
                            <td class="table_border table_padding"><%=contatoSmall.getNome()%></td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_contato.jsp?id=<%=contatoSmall.getId()%>'">
                                    <i class="fa fa-pencil"></i> 
                                </button>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </table>
                    <br/>
                </center>
            </div>

            <div id="administrativo_adminSmall" class="all adminSmall">
                <button class="button btnCloseMenu btnCloseContainer">
                    <i class="fa fa-close"></i>
                </button>
                <center>
                    <h3><i class="fa fa-address-card"></i>&nbsp;Administrativo</h3>
                    <table class="tableSmall table_border">
                        <tr>
                            <th class="table_border table_padding">Login</th>
                            <th class="table_border table_padding">Opção</th>
                        </tr>

                        <%
                            usuario = usuarioDAO.listaAutenticacao(usuario);
                        %>

                        <tr>
                            <td class="table_border table_padding"><%=usuario.getLogin()%></td>
                            <td class="table_border table_padding">
                                <button class="button btnOpcao" onclick="location = 'form_alterar_autenticacao.jsp'">
                                    <i class="fa fa-pencil"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
        </div>
        <!--===============================================================================-->


        <div class="container-fluid">
            <div class="row">
                <!--==============================HEADER==============================-->
                <header id="headerAdministrativo" class="header col-xs-12">
                    <h1 class="title">
                        <i class="fa fa-user-circle-o"></i>&nbsp;
                        Painel Administrativo
                    </h1>

                    <button class="button btnOpenMenu">
                        <i class="fa fa-bars"></i>
                    </button>

                    <button class="button btnLogout" onclick="location = 'logoff.jsp'">
                        <i class="fa fa-power-off"></i>&nbsp;
                        Sair 
                    </button>

                    <div class="menuLong">
                        <nav class="nav">
                            <ul type="none" class="ulMenu">
                                <li id="liMenu_pagInicial" class="liMenu">
                                    <i class="fa fa-home"></i>
                                    <button class="button btnMenu">Página Inicial</button>
                                </li>

                                <li id="liMenu_empresa" class="liMenu">
                                    <i class="fa fa-info"></i>
                                    <button class="button btnMenu">Empresa</button>
                                </li>

                                <li id="liMenu_servico" class="liMenu">
                                    <i class="fa fa-cogs"></i>
                                    <button class="button btnMenu">Serviço</button>
                                </li>

                                <li id="liMenu_cliente" class="liMenu">
                                    <i class="fa fa-user"></i>
                                    <button class="button btnMenu">Cliente</button>
                                </li>

                                <li id="liMenu_parceiro" class="liMenu">
                                    <i class="fa fa-users"></i>
                                    <button class="button btnMenu">Parceiro</button>
                                </li>

                                <li id="liMenu_contato" class="liMenu">
                                    <i class="fa fa-phone"></i>
                                    <button class="button btnMenu">Contato</button>
                                </li>

                                <li id="liMenu_administrativo" class="liMenu">
                                    <i class="fa fa-address-card"></i>
                                    <button class="button btnMenu">Administrativo</button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <div id="contentPrincipal" class="content">
                            <h6>*Acesse o menu para administrar outras páginas</h6>

                            <!--==============================ADMINISTRATIVO-DESKTOP==============================-->
                            <div id="container_adminLong" class="container_admin">
                                <div id="pagInicial_admin">
                                    <div id="col1" class="col1">
                                        <h3>Logo</h3>
                                        <table class="table_border tableSmall">
                                            <tr>
                                                <th class="table_border table_padding">Logo</th>
                                            </tr>
                                            <tr>
                                                <td class="table_border table_padding">
                                                    <div class="icon" style="
                                                         background: url('../index/<%=index.getLogo()%>');
                                                         background-position: 50%;
                                                         background-size: 80px 80px;
                                                         background-repeat: no-repeat;
                                                         ">
                                                    </div>
                                                    <h5>Logomarca</h5>
                                                </td>
                                            </tr>
                                        </table><br/>
                                        <button class="button btnOpcao" onclick="location = 'form_alterar_logo.jsp'">
                                            <i class="fa fa-pencil"></i>
                                        </button>
                                    </div>

                                    <div id="col2" class="col2">
                                        <h3>Slider</h3>
                                        <button class="button btnAdmin"  onclick="location = 'lista_imagem_slider.jsp'"><i class="fa fa-list"></i>&nbsp;Lista imagens</button>
                                        <button class="button btnAdmin"  onclick="location = 'form_inserir_imagem_slider.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir imagem</button>
                                        <h5 id="msg_slider_long" style="display: block;">Não há dados</h5>
                                        <table id="table_slider_long" class="table_border tableSmall" style="visibility: hidden;">
                                            <tr>
                                                <th class="table_border table_padding">Img</th>
                                                <th class="table_border table_padding">Opção</th>
                                            </tr>
                                            <%
                                                if (arraySlider.isEmpty()) {
                                            %>
                                            <%} else {%>
                                            <script>
                                                $(document).ready(function () {
                                                    $("#msg_slider_long").css('display', 'none');
                                                    $("#table_slider_long").css('visibility', 'visible');
                                                });
                                            </script>
                                            <%
                                                for (Slider slider : arraySlider) {
                                            %>

                                            <tr>
                                                <td class="table_border table_padding">
                                                    <div class="icon" style="
                                                         background: url('../slider/<%=slider.getImagem()%>');
                                                         background-position: 50%;
                                                         background-repeat: no-repeat;
                                                         background-size: cover;
                                                         "></div>
                                                </td>
                                                <td class="table_border table_padding">
                                                    <button class="button btnOpcao" onclick="location = 'form_alterar_imagem_slider.jsp?id=<%=slider.getId()%>'">
                                                        <i class="fa fa-pencil"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <%}
                                                }%>
                                        </table>
                                        <br/>
                                    </div>
                                </div>
                                <!--===============================================================================-->

                                <div id="empresa_admin">
                                    <h3><i class="fa fa-info"></i>&nbsp;&nbsp;Sobre a empresa</h3>
                                    <table class="tableSmall table_border">
                                        <tr>
                                            <th class="table_border table_padding">Temas</th>
                                            <th class="table_border table_padding">Opção</th>
                                        </tr>

                                        <tr>
                                            <td class="table_border table_padding">Historico</td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_historico_empresa.jsp'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_border table_padding">Visão</td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_visao_empresa.jsp'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_border table_padding">Missão</td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_missao_empresa.jsp'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_border table_padding">Valores</td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterarValores_empresa.jsp'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_border table_padding">Equipe</td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_equipe_empresa.jsp'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!--===============================================================================-->

                                <div id="servico_admin">

                                    <h3><i class="fa fa-cogs"></i>&nbsp;Serviços</h3>
                                    <button class="button btnAdmin" onclick="location = 'lista_servico.jsp'"><i class="fa fa-list"></i>&nbsp;Lista serviços</button>	
                                    <button class="button btnAdmin" onclick="location = 'form_inserir_servico.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir serviço</button>	
                                    <h5 id="msg_servico_long" style="display: block;">Não há dados</h5>
                                    <table id="table_servico_long" class="table_border tableSmall" style="visibility: hidden;">
                                        <tr>
                                            <th class="table_border table_padding">Nome</th>
                                            <th class="table_border table_padding">Opção</th>
                                        </tr>
                                        <%
                                            if (arrayServico.isEmpty()) {
                                        %>

                                        <%} else {%>
                                        <script>
                                            $(document).ready(function () {
                                                $("#msg_servico_long").css('display', 'none');
                                                $("#table_servico_long").css('visibility', 'visible');
                                            });
                                        </script>
                                        <%
                                            for (Servico servico : arrayServico) {
                                        %>

                                        <tr>
                                            <td class="table_border table_padding">
                                                <div class="icon" style="
                                                     background: url('../servico/<%=servico.getDiretorio()%>/<%=servico.getImagem()%>');
                                                     background-position: 50%;
                                                     background-size: cover;
                                                     background-repeat: no-repeat;
                                                     ">
                                                </div>
                                                <h5><%=servico.getNome()%></h5>
                                            </td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_servico.jsp?id=<%=servico.getId()%>&function=default'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </table>	

                                </div>
                                <!--===============================================================================-->

                                <div id="cliente_admin">
                                    <h3><i class="fa fa-user"></i>&nbsp;Cliente</h3>
                                    <button class="button btnAdmin" onclick="location = 'lista_cliente.jsp'"><i class="fa fa-list"></i>&nbsp;Lista clientes</button>			
                                    <button class="button btnAdmin" onclick="location = 'form_inserir_cliente.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir cliente</button>	
                                    <h5 id="msg_cliente_long" style="display: block;">Não há dados</h5>
                                    <table id="table_cliente_long" class="table_border tableSmall" style="visibility: hidden;">
                                        <tr>
                                            <th class="table_border table_padding">Nome</th>
                                            <th class="table_border table_padding">Opção</th>
                                        </tr>
                                        <%
                                            if (arrayCliente.isEmpty()) {

                                        %>
                                        <%} else {%>
                                        <script>
                                            $(document).ready(function () {
                                                $("#msg_cliente_long").css('display', 'none');
                                                $("#table_cliente_long").css('visibility', 'visible');
                                            });
                                        </script>
                                        <%
                                            for (Cliente cliente : arrayCliente) {

                                        %>

                                        <tr>
                                            <td class="table_border table_padding">
                                                <div class="icon" style="
                                                     background: url('../cliente/<%=cliente.getLogo()%>');
                                                     background-position: 50%;
                                                     background-size: cover;
                                                     background-repeat: no-repeat;
                                                     ">
                                                </div>
                                                <h5><%=cliente.getNome()%></h5>
                                            </td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_cliente.jsp?id=<%=cliente.getId()%>'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </table>		                                   		
                                </div>
                                <!--===============================================================================-->

                                <div id="parceiro_admin">
                                    <h3><i class="fa fa-users"></i>&nbsp;Parceiro</h3>
                                    <button class="button btnAdmin" onclick="location = 'lista_parceiro.jsp'"><i class="fa fa-list"></i>&nbsp;Lista parceiros</button>				
                                    <button class="button btnAdmin" onclick="location = 'form_inserir_parceiro.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir parceiro</button>
                                    <h5 id="msg_parceiro_long" style="display: block;">Não há dados</h5>
                                    <table id="table_parceiro_long" class="table_border tableSmall" style="visibility: hidden;">
                                        <tr>
                                            <th class="table_border table_padding">Nome</th>
                                            <th class="table_border table_padding">Opção</th>
                                        </tr>
                                        <%
                                            if (arrayParceiro.isEmpty()) {
                                        %>
                                        <%} else {%>
                                        <script>
                                            $(document).ready(function () {
                                                $("#msg_parceiro_long").css('display', 'none');
                                                $("#table_parceiro_long").css('visibility', 'visible');
                                            });
                                        </script>                                        
                                        <%
                                            for (Parceiro parceiro : arrayParceiro) {
                                        %>

                                        <tr>
                                            <td class="table_border table_padding">
                                                <div class="icon" style="
                                                     background: url('../parceiro/<%=parceiro.getLogo()%>');
                                                     background-position: 50%;
                                                     background-size: cover;
                                                     background-repeat: no-repeat;
                                                     ">
                                                </div>
                                                <h5><%=parceiro.getNome()%></h5>
                                            </td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_parceiro.jsp?id=<%=parceiro.getId()%>'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </table>	                                    				
                                </div>
                                <!--===============================================================================-->

                                <div id="contato_admin">
                                    <h3><i class="fa fa-phone"></i>&nbsp;Contato</h3>
                                    <button class="button btnAdmin" onclick="location = 'lista_contato.jsp'"><i class="fa fa-list"></i>&nbsp;Lista contatos</button>			
                                    <button class="button btnAdmin" onclick="location = 'form_inserir_contato.jsp'"><i class="fa fa-plus"></i>&nbsp;Inserir contato</button>
                                    <h5 id="msg_contato_long" style="display: block;">Não há dados</h5>
                                    <table id="table_contato_long" class="table_border tableSmall" style="visibility: hidden;">
                                        <tr>
                                            <th class="table_border table_padding">Nome</th>
                                            <th class="table_border table_padding">Opção</th>
                                        </tr>
                                        <%
                                            if (arrayContato.isEmpty()) {
                                        %>
                                        <%} else {%>
                                        <script>
                                            $(document).ready(function () {
                                                $("#msg_contato_long").css('display', 'none');
                                                $("#table_contato_long").css('visibility', 'visible');
                                            });
                                        </script>'
                                        <%
                                            for (Contato contato : arrayContato) {
                                        %>

                                        <tr>
                                            <td class="table_border table_padding"><%=contato.getNome()%></td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_contato.jsp?id=<%=contato.getId()%>'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </table>			
                                </div>
                                <!--===============================================================================-->

                                <div id="administrativo_admin">
                                    <h3><i class="fa fa-address-card"></i>&nbsp;Administrativo</h3>
                                    <table class="table_border tableSmall">
                                        <tr>
                                            <th class="table_border table_padding">Login</th>
                                            <th class="table_border table_padding">Opção</th>
                                        </tr>
                                        <tr>
                                            <td class="table_border table_padding"><%=usuario.getLogin()%></td>
                                            <td class="table_border table_padding">
                                                <button class="button btnOpcao" onclick="location = 'form_alterar_autenticacao.jsp'">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </table>		
                                </div>
                                <!--===============================================================================-->

                            </div>
                        </div>
                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->

        <script type="text/javascript" src="js/script.js"></script>
    </body>


</html>
<%
    } else {
        out.println("Você não está logado no sistema. Clique <a href='login.jsp'>aqui</a> para logar-se");
    }
%>