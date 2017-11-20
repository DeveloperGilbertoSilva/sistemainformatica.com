<%-- 
    Document   : empresa
    Created on : 02/08/2017, 19:02:08
    Author     : Gilberto
--%>
<%@page import="model.Contato"%>
<%@page import="model.ContatoDAO"%>
<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>
<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Contato> arrayContato = new ArrayList<Contato>();
    ArrayList<Servico> arrayServico = new ArrayList<Servico>();

    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();

    index = indexDAO.listaInfo();

    ServicoDAO servDAO = new ServicoDAO();

    try {
        ContatoDAO cDAO = new ContatoDAO();
        arrayContato = cDAO.listaContato();
        arrayServico = servDAO.listaServico();
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
        <link rel="stylesheet" type="text/css" href="css/contato.css">
        <link rel="stylesheet" type="text/css" href="css/320.css">
        <link rel="stylesheet" type="text/css" href="css/768.css">
        <link rel="stylesheet" type="text/css" href="css/992.css">
        <link rel="stylesheet" type="text/css" href="css/1200.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">
        <link rel="icon" href="img/logo_small.png">
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
                    <li onclick="location = 'empresa.jsp?tema=default'">
                        <i class="fa fa-info"></i>
                        <br/>
                        Empresa
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
                </ul>
            </center>
        </nav>

        <div class="container-fluid container_absolute">
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
                                        <li onclick="location = 'index.jsp'">
                                            <i class="fa fa-home"></i>
                                            &nbsp;Início
                                        </li>
                                        <li id="li_empresa">
                                            <i class="fa fa-info"></i>
                                            &nbsp;Empresa
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
                <section id="sectionContato" class="section">
                    <div id="conteudo_contato" class="conteudo">
                        <h3><i class="fa fa-phone"></i></h3><br/>

                        <div class="contato">
                            <%
                                for (Contato c : arrayContato) {
                            %>
                            <h4 class="nome_contato"><%=c.getNome()%></h4>
                            <h5 class="conteudo_contato">
                                <%
                                    if(c.getTipo().equals("Rede Social")){
                                %>
                                <a href="http://<%=c.getConteudo()%>" target="_blank"><%=c.getConteudo()%></a>
                                <%}else{%>
                                <%=c.getConteudo()%>    
                                <%}%>
                            </h5><br/>
                            <%}%>
                        </div>
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d872.372816162484!2d-48.07041896674319!3d-15.806924518487461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x935a33383b16cb6f%3A0x8d80d384a3d37132!2sSistema+Inform%C3%A1tica!5e1!3m2!1spt-BR!2sbr!4v1503655835753" width="800" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                    </div>

                </section>
            </div>
        </div>
        <div id="copyParceiro" class="copyright">
            <i class="fa fa-copyright"></i>&nbsp;Copyright 2017 - Sistema Informática
        </div>
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>