<%@page import="java.io.File"%>
<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>
<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>
<%@page import="model.CategoriaServico"%>
<%@page import="model.CategoriaServicoDAO"%>
<%@page import="model.GaleriaCategoria"%>
<%@page import="model.GaleriaCategoriaDAO"%>


<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Servico> arrayServico = new ArrayList<Servico>();
    ArrayList<CategoriaServico> arrayCategoriaServico = new ArrayList<CategoriaServico>();
    ArrayList<GaleriaCategoria> arrayGaleria = new ArrayList<GaleriaCategoria>();
    ArrayList<GaleriaCategoria> arrayCategoriaGaleria = new ArrayList<GaleriaCategoria>();

    ServicoDAO servicoDAO = new ServicoDAO();
    String descricao = request.getParameter("descricao");

    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();
    index = indexDAO.listaInfo();

    CategoriaServicoDAO csDAO = new CategoriaServicoDAO();
    String nomeCat = "";
    String categoria = "";
    String teste = "no";
    boolean painel = false;

    GaleriaCategoriaDAO galeriaDAO = new GaleriaCategoriaDAO();

    try {
        arrayServico = servicoDAO.listaServico();
        arrayCategoriaServico = csDAO.listaCategoria();
        arrayGaleria = galeriaDAO.listaImagemGaleria();
    } catch (Exception e) {
        out.print("ERRO: " + e.getMessage());
    }


%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Informática</title>
        <meta charset="UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Sistema Informática">
        <meta name="keywords" content="Sistema Informática,informatica,taguatinga,df,redes,cabeamento,desenvolvimento de sites">
        <meta name="description" content="A Sistema Informática busca trazer a satisfação ao seu cliente, prestando o melhor serviço.">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/servico.css">
        <link rel="stylesheet" type="text/css" href="css/320.css">
        <link rel="stylesheet" type="text/css" href="css/768.css">
        <link rel="stylesheet" type="text/css" href="css/992.css">
        <link rel="stylesheet" type="text/css" href="css/1200.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">

        <link rel="stylesheet" type="text/css" href="css/gallery.prefixed.css">
        <link rel="stylesheet" type="text/css" href="css/gallery.theme.css">
        <link rel="stylesheet" type="text/css" href="css/normalize.css">
        <link rel="icon" href="img/logo_small.png">

        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>

        <link rel="stylesheet" type="text/css" href="lightbox2-master/src/css/lightbox.css">

    </head>
    <body>
        <nav class="menuSmall col-xs-12">
            <button id="closeMenu" class="btnMenu">
                <i class="fa fa-close"></i>
            </button>
            <center>
                <ul type="none">
                    <li onclick="location = 'index.jsp'">
                        <i class="fa fa-home"></i>
                        <br/>
                        Início
                    </li>
                    <li onclick="location = 'empresa.jsp'">
                        <i class="fa fa-info"></i>
                        <br/>
                        A Empresa
                    </li>
                    <li onclick="location = 'cliente.jsp'">
                        <i class="fa fa-user"></i>
                        <br/>
                        Clientes
                    </li>
                    <li onclick="location = 'parceiro.jsp'">
                        <i class="fa fa-users"></i>
                        <br/>
                        Parceiros
                    </li>
                    <li onclick="location = 'contato.jsp'">
                        <i class="fa fa-phone"></i>
                        <br/>
                        Contato
                    </li>
                </ul>
            </center>
        </nav>

        <%            if (!arrayServico.isEmpty()) {
                for (Servico servicoSmall : arrayServico) {
        %>
        <div id='<%out.print("servicoSmall" + servicoSmall.getId());%>' class="descricaoServicoSmall">
            <div class="imgServicoSmall" style="
                 background: url('servico/<%=servicoSmall.getDiretorio()%>/<%=servicoSmall.getImagem()%>');
                 background-position: 50%;
                 background-size: cover;
                 background-repeat: no-repeat;
                 ">

            </div>

            <h2><%=servicoSmall.getNome()%></h2>
            <button class="btnCloseDescricao"><i class="fa fa-close"></i></button>
            <div class="texto_small">
                <%=servicoSmall.getConteudo()%>
            </div>
        </div>
        <%}
            }%>

        <!--==================================GALERIA==================================-->        
        <div class="container-fluid container_absolute">
            <div class="row">
                <!--=====================================HEADER=====================================-->
                <header class="header col-xs-12">
                    <center>
                        <div class="row">
                            <div class="menuLong col-xs-12">
                                <button id="openMenu" class="btnMenu">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <nav>
                                    <ul type="none">
                                        <li onclick="location = 'index.jsp'">
                                            <i class="fa fa-home"></i>
                                            &nbsp;Início
                                        </li>
                                        <li id="li_empresa">
                                            <i class="fa fa-info"></i>
                                            &nbsp;A Empresa
                                            <div id="sub_menu_empresa">
                                                <ul type="none">
                                                    <li onclick="location = 'empresa.jsp?tema=historico'">Histórico</li>
                                                    <li onclick="location = 'empresa.jsp?tema=visao'">Visão</li>
                                                    <li onclick="location = 'empresa.jsp?tema=missao'">Missão</li>
                                                    <li onclick="location = 'empresa.jsp?tema=valores'">Valores</li>
                                                    <li style="border-bottom:none;" onclick="location = 'empresa.jsp?tema=equipe'">Equipe</li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li onclick="location = 'cliente.jsp'">
                                            <i class="fa fa-user"></i>
                                            &nbsp;Clientes
                                        </li>
                                        <li onclick="location = 'parceiro.jsp'">
                                            <i class="fa fa-users"></i>
                                            &nbsp;Parceiros
                                        </li>
                                        <li onclick="location = 'contato.jsp'">
                                            <i class="fa fa-phone"></i>
                                            &nbsp;Contato
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="logo" onclick="location = 'index.jsp'" 
                             style="
                             background: url('index/<%=index.getLogo()%>');
                             background-repeat: no-repeat;
                             background-position: 50%;">
                        </div>
                    </center>
                </header>
            </div>
            <div class="row">
                <section id="sectionServico" class="section">
                    <div class="conteudo">
                        <div id="menuService_servico" class="menuService">
                            <h3><i class="fa fa-cogs iconServico"></i></h3><br/>

                            <!--===============BTN-SMALL===============-->
                            <%
                                if (!arrayServico.isEmpty()) {
                                    for (Servico servicoSmall : arrayServico) {
                            %>
                            <button id='<%out.print("btn" + servicoSmall.getId() + "Small");%>' class="btnMenuServicoSmall">
                                <div class="icon">
                                    <div class="img" style="
                                         background: url('servico/<%=servicoSmall.getDiretorio()%>/<%=servicoSmall.getImagem()%>');
                                         background-size: cover;
                                         background-position: 50%;
                                         background-repeat: no-repeat;
                                         ">
                                    </div>
                                </div>
                                <%=servicoSmall.getNome()%>
                            </button>
                            <%}
                                }%>

                            <!--===============BTN-LONG===============-->
                            <%
                                if (!arrayServico.isEmpty()) {
                                    for (Servico servico : arrayServico) {
                                        if (descricao.equals(servico.getNome())) {
                            %>
                            <button id='<%out.print("btn" + servico.getId());%>' style="background: #101d42; color: white;" class="btnMenuServico" onclick="msg = 'teste'">
                                <div class="icon">
                                    <div class="img" style="
                                         background: url('servico/<%=servico.getDiretorio()%>/<%=servico.getImagem()%>');
                                         background-size: cover;
                                         background-position: 50%;
                                         background-repeat: no-repeat;
                                         ">
                                    </div>
                                </div><%=servico.getNome()%>
                            </button>
                            <br/>

                            <%} else {%>

                            <button id='<%out.print("btn" + servico.getId());%>' class="btnMenuServico" onclick="msg = 'teste'">
                                <div class="icon">
                                    <div class="img" style="
                                         background: url('servico/<%=servico.getDiretorio()%>/<%=servico.getImagem()%>');
                                         background-size: cover;
                                         background-position: 50%;
                                         background-repeat: no-repeat;
                                         ">
                                    </div>                                    
                                </div><%=servico.getNome()%>
                            </button>
                            <%}
                                    }
                                }%>

                        </div>

                        <div id="container_descricao">

                            <%
                                if (!arrayServico.isEmpty()) {
                                    for (Servico servico : arrayServico) {
                                        if (descricao.equals(servico.getNome())) {
                            %>
                            <div id='<%out.print("servico" + servico.getId());%>' style="display: block;" class="descricaoServico">
                                <div class="imgServico" style="
                                     background: url('servico/<%=servico.getDiretorio()%>/<%=servico.getImagem()%>');
                                     background-position: 50%;
                                     background-size: cover;
                                     background-repeat: no-repeat;
                                     ">

                                </div>

                                <div class="categoria">
                                    <div class="limita_icons">
                                        <%

                                            if (!arrayCategoriaServico.isEmpty()) {

                                                for (CategoriaServico cs : arrayCategoriaServico) {
                                                    if (cs.getServico().equals(servico.getDiretorio())) {
                                                        if (!arrayGaleria.isEmpty()) {


                                        %>
                                        <div id="icon<%=cs.getId()%>" class="icon_categoria" style="
                                             background: url('servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/<%=cs.getImagem()%>');
                                             background-position: 50%;
                                             background-size: cover;
                                             background-repeat: no-repeat;
                                             ">
                                            <div class="title_categoria">
                                                <span><%=cs.getNome()%></span>
                                            </div>
                                            <div id="painel<%=cs.getId()%>" class="painel_galeria_categoria">
                                                <%
                                                    for (GaleriaCategoria galeria : arrayGaleria) {
                                                        if (galeria.getCategoria().equals(cs.getDiretorio())) {%>
                                                <script>
                                                    $(document).ready(function () {
                                                        $("#icon<%=cs.getId()%>").css('display', 'inline-block');
                                                        $("#icon<%=cs.getId()%>").click(function () {
                                                            $("#painel<%=cs.getId()%>").show();
                                                        });
                                                        $("#icon<%=cs.getId()%>").mouseleave(function () {
                                                            $("#painel<%=cs.getId()%>").hide();
                                                        });

                                                    });
                                                </script>

                                                <a href="servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/galeria/<%=galeria.getImagem()%>" data-lightbox="<%=galeria.getCategoria()%>">
                                                    <div class="imgGaleria" style="
                                                         background: url('servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/galeria/<%=galeria.getImagem()%>');
                                                         background-position: 50%;
                                                         background-size: cover;
                                                         background-repeat: no-repeat;
                                                         ">    
                                                    </div>
                                                </a>

                                                <%

                                                        }
                                                    }
                                                %>
                                            </div>

                                        </div>
                                        <% }
                                                    }
                                                }
                                            }%>         
                                    </div>
                                </div>
                                <div class="texto_long">
                                    <h2><%=servico.getNome()%></h2>

                                    <%=servico.getConteudo()%>
                                </div>
                            </div>

                            <%} else {%>

                            <div id='<%out.print("servico" + servico.getId());%>' class="descricaoServico">
                                <div class="imgServico" style="
                                     background: url('servico/<%=servico.getDiretorio()%>/<%=servico.getImagem()%>');
                                     background-position: 50%;
                                     background-size: cover;
                                     background-repeat: no-repeat;
                                     ">

                                </div>


                                <div class="categoria">
                                    <div class="limita_icons">
                                        <%
                                            if (!arrayCategoriaServico.isEmpty()) {
                                                for (CategoriaServico cs : arrayCategoriaServico) {
                                                    if (cs.getServico().equals(servico.getDiretorio())) {
                                                        if (!arrayGaleria.isEmpty()) {
                                        %>
                                        <div id="icon<%=cs.getId()%>" class="icon_categoria" style="
                                             background: url('servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/<%=cs.getImagem()%>');
                                             background-position: 50%;
                                             background-size: cover;
                                             background-repeat: no-repeat;
                                             ">
                                            <div class="title_categoria">
                                                <span><%=cs.getNome()%></span>
                                            </div>
                                            <div id="painel<%=cs.getId()%>" class="painel_galeria_categoria">
                                                <%
                                                    for (GaleriaCategoria galeria : arrayGaleria) {
                                                        if (galeria.getCategoria().equals(cs.getDiretorio())) {%>
                                                <script>
                                                    $(document).ready(function () {
                                                        $("#icon<%=cs.getId()%>").css('display', 'inline-block');
                                                        $("#icon<%=cs.getId()%>").click(function () {
                                                            $("#painel<%=cs.getId()%>").show();
                                                        });
                                                        $("#icon<%=cs.getId()%>").mouseleave(function () {
                                                            $("#painel<%=cs.getId()%>").hide();
                                                        });

                                                    });
                                                </script>

                                                <a href="servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/galeria/<%=galeria.getImagem()%>" data-lightbox="<%=galeria.getCategoria()%>">
                                                    <div class="imgGaleria" style="
                                                         background: url('servico/<%=servico.getDiretorio()%>/<%=cs.getDiretorio()%>/galeria/<%=galeria.getImagem()%>');
                                                         background-position: 50%;
                                                         background-size: cover;
                                                         background-repeat: no-repeat;
                                                         ">    
                                                    </div>
                                                </a>

                                                <%

                                                        }
                                                    }
                                                %>
                                            </div>

                                        </div>
                                        <%}
                                                    }
                                                }
                                            }%>
                                    </div>
                                </div>
                                <div class="texto_long">
                                    <h2><%=servico.getNome()%></h2>

                                    <%=servico.getConteudo()%>
                                </div>
                            </div>
                            <%}%>
                            <%}
                                }%>
                        </div> 
                    </div>
                </section>
            </div>
            <div class="copyright">
                <i class="fa fa-copyright"></i>&nbsp;Copyright 2017 - Sistema Informática
            </div>
        </div>

        <script type="text/javascript" src="lightbox2-master/src/js/lightbox.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript">
                                                    $(document).ready(function () {
            <%
                if (!arrayServico.isEmpty()) {
                    for (Servico servicoSmall : arrayServico) {
            %>
                                                        $('<%out.print("#btn" + servicoSmall.getId() + "Small");%>').click(function () {
                                                            $('<%out.print("#servicoSmall" + servicoSmall.getId());%>').fadeIn();
                                                            $(".container-fluid").hide();
                                                        });
                                                        $(".btnCloseDescricao").click(function () {
                                                            $('<%out.print("#servicoSmall" + servicoSmall.getId());%>').hide();
                                                            $(".container-fluid").show();
                                                        });
            <%}
                }%>


            <%
                if (!arrayServico.isEmpty()) {
                    for (Servico servico : arrayServico) {

            %>
                                                        $('<%out.print("#btn" + servico.getId());%>').click(function () {

                                                            $(".descricaoServico").css('display', 'none');
                                                            $(".btnMenuServico").css('background', 'white');
                                                            $(".btnMenuServico").css('color', '#252422');
                                                            $('<%out.print("#btn" + servico.getId());%>').css('background', '#101d42');
                                                            $('<%out.print("#btn" + servico.getId());%>').css('color', 'white');
                                                            $('<%out.print("#btn" + servico.getId());%> i').css('color', '#252422');
                                                            $('<%out.print("#servico" + servico.getId());%>').css('display', 'block');



                                                        });
            <%}
                }%>

                                                    });
                                                    $(window).resize(function () {
                                                        if ($(window).width() >= 992) {
                                                            $(".descricaoServicoSmall").hide();
                                                            $(".container-fluid").show();
                                                        }

                                                    });

        </script>
    </body>
</html>
