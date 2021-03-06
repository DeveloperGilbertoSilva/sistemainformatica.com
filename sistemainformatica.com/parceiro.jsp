<%-- 
    Document   : parceiro
    Created on : 02/08/2017, 19:00:37
    Author     : Gilberto
--%>

<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>
<%@page import="model.Parceiro"%>
<%@page import="model.ParceiroDAO"%>
<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Parceiro> arrayParceiro = new ArrayList<Parceiro>();
    ArrayList<Servico> arrayServico = new ArrayList<Servico>();
    
    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();
    index = indexDAO.listaInfo();
    
    try {
        ServicoDAO servDAO = new ServicoDAO();
        ParceiroDAO pDAO = new ParceiroDAO();
        arrayParceiro = pDAO.listaParceiro();
        arrayServico = servDAO.listaServico();        
    } catch (Exception e) {
        out.print("ERRO: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Inform�tica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Sistema Inform�tica">
        <meta name="keywords" content="Sistema Inform�tica,informatica,taguatinga,df,redes,cabeamento,desenvolvimento de sites">
        <meta name="description" content="A Sistema Inform�tica busca trazer a satisfa��o ao seu cliente, prestando o melhor servi�o.">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/parceiro.css">
        <link rel="stylesheet" type="text/css" href="css/320.css">
        <link rel="stylesheet" type="text/css" href="css/768.css">
        <link rel="stylesheet" type="text/css" href="css/992.css">
        <link rel="stylesheet" type="text/css" href="css/1200.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">
        <link rel="icon" href="img/logo_small.png">
        
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
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
                        In�cio
                    </li>
                    <li onclick="location = 'empresa.jsp?tema=default'">
                        <i class="fa fa-info"></i>
                        <br/>
                        A Empresa
                    </li>
                    <li onclick="location = 'servico.jsp?descricao=default'">
                        <i class="fa fa-cogs"></i>
                        <br/>
                        Servi�os
                    </li>
                    <li onclick="location = 'cliente.jsp'">
                        <i class="fa fa-user"></i>
                        <br/>
                        Clientes
                    </li>
                    <li onclick="location = 'contato.jsp'">
                        <i class="fa fa-phone"></i>
                        <br/>
                        Contato
                    </li>
                </ul>
            </center>
        </nav>

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
                                        <li onclick="location = 'index.jsp'">
                                            <i class="fa fa-home"></i>
                                            &nbsp;In�cio
                                        </li>
                                        <li id="li_empresa">
                                            <i class="fa fa-info"></i>
                                            &nbsp;A Empresa
                                            <div id="sub_menu_empresa">
                                                <ul type="none">
                                                    <li onclick="location = 'empresa.jsp?tema=historico'">Hist�rico</li>
                                                    <li onclick="location = 'empresa.jsp?tema=visao'">Vis�o</li>
                                                    <li onclick="location = 'empresa.jsp?tema=missao'">Miss�o</li>
                                                    <li onclick="location = 'empresa.jsp?tema=valores'">Valores</li>
                                                    <li style="border-bottom:none;" onclick="location = 'empresa.jsp?tema=equipe'">Equipe</li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li id="li_servico">
                                            <i class="fa fa-cogs"></i>
                                            &nbsp;Servi�os
                                            <div id="sub_menu_servico">
                                                <ul type="none">
                                                    <%
                                                        for(Servico servicoSmall:arrayServico){
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
                <section id="sectionParceiro" class="section">
                        <div class="conteudo">
                            <h3>Confira os nossos parceiros &nbsp; <i class="fa fa-users"></i></h3><br/>
                            <%
                                for (Parceiro p : arrayParceiro) {

                            %>
                        <div class="parceiro">
                            <center>
                                <div class="logo_parceiro" style="
                                     background: url('parceiro/<%=p.getLogo()%>');
                                     background-position: 50%;
                                     background-size: 80px 80px;
                                     background-repeat: no-repeat;
                                     "></div>
                                     <h4><%=p.getNome()%></h4>
                                     <a href="http://<%=p.getSite()%>" target="_blank"><%=p.getSite()%></a>
                                <p>
                                    <%=p.getDesc()%>
                                </p>
                            </center>
                        </div>
                        <%}%>
                        </div>
                </section>
            </div>

        </div>
        <div id="copyParceiro" class="copyright">
            <i class="fa fa-copyright"></i>&nbsp;Copyright 2017 - Sistema Inform�tica
        </div>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
