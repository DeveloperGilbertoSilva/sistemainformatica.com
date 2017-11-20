<%-- 
    Document   : index
    Created on : 02/08/2017, 19:00:19
    Author     : Gilberto
--%>

<%@page import="model.Index"%>
<%@page import="model.Slider"%>
<%@page import="model.IndexDAO"%>
<%@page import="model.SliderDAO"%>
<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>
<%@page import="model.Contato"%>
<%@page import="model.ContatoDAO"%>

<%@page import="java.util.ArrayList"%>


<%@page import="model.ConexaoDAO"%>
<%
    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();

    index = indexDAO.listaInfo();
%>

<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Slider> arraySlider = new ArrayList<Slider>();
    ArrayList<Servico> arrayServico = new ArrayList<Servico>();
    ArrayList<Contato> arrayContato = new ArrayList<Contato>();
    try {
        SliderDAO sDAO = new SliderDAO();
        ServicoDAO servDAO = new ServicoDAO();
        ContatoDAO contatoDAO = new ContatoDAO();

        arraySlider = sDAO.ordenaImagemSlider();
        arrayServico = servDAO.listaServico();
        arrayContato = contatoDAO.listaContato();
    } catch (Exception e) {
        out.print("ERRO: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Informática</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Sistema Informática">
        <meta name="keywords" content="Sistema Informática,informatica,taguatinga,df,redes,cabeamento,desenvolvimento de sites">
        <meta name="description" content="A Sistema Informática busca trazer a satisfação ao seu cliente, prestando o melhor serviço.">

        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/320.css">
        <link rel="stylesheet" type="text/css" href="css/768.css">
        <link rel="stylesheet" type="text/css" href="css/992.css">
        <link rel="stylesheet" type="text/css" href="css/1200.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">
        <link rel="stylesheet" type="text/css" href="css/servico.css">
        <link rel="icon" href="img/logo_small.png">
    </head>
    <body>
        <nav class="menuSmall col-xs-12">
            <button id="closeMenu" class="btnMenu">
                <i class="fa fa-close"></i>
            </button>
            <center>
                <ul type="none">
                    <li onclick="location = 'empresa.jsp?tema=default'">
                        <i class="fa fa-info"></i>
                        <br/>
                        A Empresa
                    </li>
                    <li onclick="location = 'servico.jsp?descricao=default'">
                        <i class="fa fa-cogs"></i>
                        <br/>
                        Serviços
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

        <!--========================================SERVICO-SMALL========================================-->
        <%            if (!arrayServico.isEmpty()) {
                for (Servico servicoSmall : arrayServico) {
        %>
        <div id='<%out.print("servicoIndexSmall" + servicoSmall.getId());%>' class="descricaoServicoSmall">
            <div class="imgServicoSmall" style="
                 background: url('servico/<%=servicoSmall.getNome()%>/<%=servicoSmall.getImagem()%>');
                 background-position: 50%;
                 background-size: cover;
                 background-repeat: no-repeat;
                 ">

            </div>

            <h2><%=servicoSmall.getNome()%></h2>
            <button class="btnCloseDescricao"><i class="fa fa-close"></i></button>
                <%=servicoSmall.getConteudo()%>

        </div>
        <%}
            }%>


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
                                        <li id="li_servico">
                                            <i class="fa fa-cogs"></i>
                                            &nbsp;Serviços
                                            <div id="sub_menu_servico">
                                                <ul type="none">
                                                    <%
                                                        for (Servico servicoSmall : arrayServico) {
                                                    %>
                                                    <li onclick="location = 'servico.jsp?descricao=<%=servicoSmall.getNome()%>'">
                                                        <%=servicoSmall.getNome()%>
                                                    </li>
                                                    <%}%>
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
                <section id="sectionIndex" class="section col-xs-12">
                    <div id="conteudoIndex" class="conteudo">
                        <div class="menuService">
                            <h3>Serviços <i class="fa fa-cogs"></i></h3><br/>
                            <!--===============BTN-SMALL===============-->
                            <%
                                if (!arrayServico.isEmpty()) {
                                    for (Servico servicoSmall : arrayServico) {
                            %>
                            <button id='<%out.print("btn" + servicoSmall.getId() + "IndexSmall");%>' class="btnMenuServicoSmall">
                                <div class="icon">
                                    <div class="img" style="
                                         background: url('servico/<%=servicoSmall.getNome()%>/<%=servicoSmall.getImagem()%>');
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
                            %>
                            <button id='<%out.print("btn" + servico.getId());%>' style="background: #101d42; color: white;" class="btnMenuServico" onclick="location='servico.jsp?descricao=<%=servico.getNome()%>'">
                                <div class="icon">
                                    <div class="img" style="
                                         background: url('servico/<%=servico.getNome()%>/<%=servico.getImagem()%>');
                                         background-size: cover;
                                         background-position: 50%;
                                         background-repeat: no-repeat;
                                         ">
                                    </div>
                                </div><%=servico.getNome()%>
                            </button>
                            <br/>
                            <%}
                                }%>
                            <br/>
                            <h4>Disponível em: </h4>
                            <div class="social_icons">

                                <i class="fa fa-facebook" onclick="location = 'contato.jsp'"></i>
                                <i class="fa fa-envelope" onclick="location = 'contato.jsp'"></i>
                                <i class="fa fa-whatsapp" onclick="location = 'contato.jsp'"></i>
                            </div>
                        </div>
                        <div class="slider">
                            <div class="divImg">
                                <%
                                    if (arraySlider.isEmpty()) {
                                        out.print("Não há imagens");
                                %>
                                <%} else {

                                    for (Slider s : arraySlider) {
                                %>
                                <img src="slider/<%=s.getImagem()%>" width="700" height="450" alt="Não há imagens">
                                <%}
                                    }%>
                            </div>
                            <div class="navImg"></div>
                            <button id="next" class="btnSlider"><i class="fa fa-angle-right"></i></button>  
                            <button id="back" class="btnSlider"><i class="fa fa-angle-left"></i></button>
                        </div>
                    </div>

                </section>
            </div>
            <div class="row">
                <footer class="footer col-xs-12">

                    <div class="conteudo">
                        <div class="row">
                            <div class="r1">
                                <h2>
                                    <i class="fa fa-exclamation-circle"></i> Ligue agora
                                    <br/> <span>E marque uma visita sem compromisso</span><br/>
                                    <br/> <span id="endereco"><i class="fa fa-map-marker"></i>&nbsp;Endereço: </span><br/>
                                    <%
                                        for (Contato c : arrayContato) {
                                            if (c.getTipo().equals("Endereco")) {
                                    %>
                                    <span><%=c.getConteudo()%></span>
                                    <%
                                            }
                                        }
                                    %>
                                </h2>
                                <br/>
                                <h2 id="titleTelefone">
                                    <i class="fa fa-phone"></i> Telefone(s)
                                    <br/> 
                                    <%
                                        for (Contato c : arrayContato) {
                                            if (c.getTipo().equals("Telefone")) {

                                    %>
                                    <span id="telefone"><%=c.getConteudo()%></span><br/>
                                    <%}
                                        }%>

                                </h2>

                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            <div id="copyright" class="copyright">
                <i class="fa fa-copyright"></i>&nbsp;Copyright 2017 - Sistema Informática
            </div>
        </div>
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/cycle.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript">
                                    $(document).ready(function () {
            <%
                                            if (!arrayServico.isEmpty()) {
                                                for (Servico servicoSmall : arrayServico) {
            %>
                                        $('<%out.print("#btn" + servicoSmall.getId() + "IndexSmall");%>').click(function () {
                                            $('<%out.print("#servicoIndexSmall" + servicoSmall.getId());%>').fadeIn();
                                            $(".container-fluid").hide();
                                        });
                                        $(".btnCloseDescricao").click(function () {
                                            $('<%out.print("#servicoIndexSmall" + servicoSmall.getId());%>').hide();
                                            $(".container-fluid").show();
                                        });
            <%}
                }%>


                                        $(".divImg").cycle({
                                            fx: 'turnDown',
                                            delay: -4000,
                                            pager: ".navImg",
                                            next: "#next",
                                            prev: "#back",
                                            speed: 500
                                        });
                                    });
        </script>
    </body>
</html>