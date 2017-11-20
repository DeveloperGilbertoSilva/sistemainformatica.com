<%-- 
    Document   : cliente
    Created on : 02/08/2017, 19:00:54
    Author     : Gilberto
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>
<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Cliente> arrayCliente = new ArrayList<Cliente>();
    ArrayList<Servico> arrayServico = new ArrayList<Servico>();

    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();
    index = indexDAO.listaInfo();

    ServicoDAO servDAO = new ServicoDAO();

    try {
        ClienteDAO cDAO = new ClienteDAO();
        arrayCliente = cDAO.listaCliente();
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
        <link rel="stylesheet" type="text/css" href="css/cliente.css">
        <link rel="stylesheet" type="text/css" href="css/parceiro.css">
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
                        A Empresa
                    </li>
                    <li onclick="location = 'servico.jsp?descricao=default'">
                        <i class="fa fa-cogs"></i>
                        <br/>
                        Serviços
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
                <section id="sectionCliente" class="section">
                    <div class="conteudo">
                        <h3>Confira os nossos clientes &nbsp; <i class="fa fa-user"></i></h3><br/>
                            <%
                                if(arrayCliente.isEmpty()){}
                                else{
                                for (Cliente c : arrayCliente) {

                            %>
                        <div class="cliente">
                            <center>
                                <div class="logo_cliente" style="
                                     background: url('cliente/<%=c.getLogo()%>');
                                     background-position: 50%;
                                     background-size: 80px 80px;
                                     background-repeat: no-repeat;
                                     "></div>
                                     <h4><%=c.getNome()%></h4>
                                     <a href="http://<%=c.getSite()%>" target="_blank"><%=c.getSite()%></a>
                                <p>
                                    <%=c.getDesc()%>
                                </p>
                            </center>
                        </div>
                        <%}}%>
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
