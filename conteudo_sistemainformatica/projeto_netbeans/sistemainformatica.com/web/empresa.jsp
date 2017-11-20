<%@page import="model.Empresa"%>
<%@page import="model.EmpresaDAO"%>
<%@page import="model.Index"%>
<%@page import="model.IndexDAO"%>
<%@page import="model.Servico"%>
<%@page import="model.ServicoDAO"%>

<%@page import="java.util.ArrayList"%>

<%
    String tema = request.getParameter("tema");
    Empresa empresa = new Empresa();
    EmpresaDAO empresaDAO = new EmpresaDAO();

    ArrayList<Servico> arrayServico = new ArrayList<Servico>();

    Index index = new Index();
    IndexDAO indexDAO = new IndexDAO();

    index = indexDAO.listaInfo();

    try {
        
        ServicoDAO servicoDAO = new ServicoDAO();
        empresa = empresaDAO.listaDescricao(empresa);

        arrayServico = servicoDAO.listaServico();
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/empresa.css">
        <link rel="stylesheet" type="text/css" href="css/320.css">
        <link rel="stylesheet" type="text/css" href="css/768.css">
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
                    <li onclick="location = 'servico.jsp'">
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

        <!--==========================DESCRICAO-EMPRESA==========================-->
        <div id="historicoEmpresaSmall" class="descricaoEmpresaSmall">
            <button class="btnCloseDescricao">
                <i class="fa fa-close"></i>
            </button>
            <h1><i class="fa fa-history"></i>&nbsp;Histórico</h1><br/>
            <p>
                <%=empresa.getHistorico()%>
            </p>
        </div>

        <div id="visaoEmpresaSmall" class="descricaoEmpresaSmall">
            <button class="btnCloseDescricao">
                <i class="fa fa-close"></i>
            </button>
            <h1><i class="fa fa-street-view"></i>&nbsp;Visão</h1><br/>
            <p>
                <%=empresa.getVisao()%>
            </p>
        </div>

        <div id="missaoEmpresaSmall" class="descricaoEmpresaSmall">
            <button class="btnCloseDescricao">
                <i class="fa fa-close"></i>
            </button>
            <h1><i class="fa fa-crosshairs"></i>&nbsp;Missão</h1><br/>
            <p>
                <%=empresa.getMissao()%>
            </p>
        </div>

        <div id="valoresEmpresaSmall" class="descricaoEmpresaSmall">
            <button class="btnCloseDescricao">
                <i class="fa fa-close"></i>
            </button>
            <h1><i class="fa fa-handshake-o"></i>&nbsp;Valores</h1><br/>
            <p>
                <%=empresa.getValores()%>
            </p>
        </div>

        <div id="equipeEmpresaSmall" class="descricaoEmpresaSmall">
            <button class="btnCloseDescricao">
                <i class="fa fa-close"></i>
            </button>
            <h1><i class="fa fa-users"></i>&nbsp;Equipe</h1><br/>
            <p>
                <%=empresa.getEquipe()%>
            </p>
        </div>


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
                <section id="sectionEmpresa" class="section">
                    <div class="conteudo">
                        <div class="menuEmpresa">


                            <!--================BTN-SMALL================-->
                            <button id="btnHistoricoEmpresaSmall" class="btnMenuEmpresaSmall"><i class="fa fa-history"></i>&nbsp;&nbsp;
                                <span>Historico</span>
                            </button>

                            <button id="btnVisaoEmpresaSmall" class="btnMenuEmpresaSmall"><i class="fa fa-street-view"></i>&nbsp;&nbsp;
                                <span>Visão</span>
                            </button>

                            <button id="btnMissaoEmpresaSmall" class="btnMenuEmpresaSmall"><i class="fa fa-crosshairs"></i>&nbsp;&nbsp;
                                <span>Missão</span>
                            </button>

                            <button id="btnValoresEmpresaSmall" class="btnMenuEmpresaSmall"><i class="fa fa-handshake-o"></i>&nbsp;&nbsp;
                                <span>Valores</span>
                            </button>
                            <button id="btnEquipeEmpresaSmall" class="btnMenuEmpresaSmall"><i class="fa fa-users"></i>&nbsp;&nbsp;
                                <span>Equipe</span>
                            </button>


                            <!--================BTN-LONG================-->
                            <%
                                if (tema.equals("historico")) {
                            %>
                            <button id="btnHistoricoEmpresa" class="btnMenuEmpresa" style="background: #101d42; color: white;"><i class="fa fa-history"></i>&nbsp;&nbsp;
                                <span>Historico</span>
                            </button>
                            <%} else {%>
                            <button id="btnHistoricoEmpresa" class="btnMenuEmpresa"><i class="fa fa-history"></i>&nbsp;&nbsp;
                                <span>Historico</span>
                            </button>
                            <%}%>


                            <%
                                if (tema.equals("visao")) {
                            %>
                            <button id="btnVisaoEmpresa" class="btnMenuEmpresa" style="background: #101d42; color: white;"><i class="fa fa-street-view"></i>&nbsp;&nbsp;
                                <span>Visão</span>
                            </button>
                            <%} else {%>
                            <button id="btnVisaoEmpresa" class="btnMenuEmpresa"><i class="fa fa-street-view"></i>&nbsp;&nbsp;
                                <span>Visão</span>
                            </button>
                            <%}%>


                            <%
                                if (tema.equals("missao")) {
                            %>
                            <button id="btnMissaoEmpresa" class="btnMenuEmpresa" style="background: #101d42; color: white;"><i class="fa fa-crosshairs"></i>&nbsp;&nbsp;
                                <span>Missão</span>
                            </button>
                            <%} else {%>
                            <button id="btnMissaoEmpresa" class="btnMenuEmpresa"><i class="fa fa-crosshairs"></i>&nbsp;&nbsp;
                                <span>Missão</span>
                            </button>
                            <%}%>


                            <%
                                if (tema.equals("valores")) {
                            %>
                            <button id="btnValoresEmpresa" class="btnMenuEmpresa" style="background: #101d42; color: white;"><i class="fa fa-handshake-o"></i>&nbsp;&nbsp;
                                <span>Valores</span>
                            </button>
                            <%} else {%>
                            <button id="btnValoresEmpresa" class="btnMenuEmpresa"><i class="fa fa-handshake-o"></i>&nbsp;&nbsp;
                                <span>Valores</span>
                            </button>
                            <%}%>


                            <%
                                if (tema.equals("equipe")) {
                            %>
                            <button id="btnEquipeEmpresa" class="btnMenuEmpresa" style="background: #101d42; color: white;"><i class="fa fa-users"></i>&nbsp;&nbsp;
                                <span>Equipe</span>
                            </button>
                            <%} else {%>
                            <button id="btnEquipeEmpresa" class="btnMenuEmpresa"><i class="fa fa-users"></i>&nbsp;&nbsp;
                                <span>Equipe</span>
                            </button>
                            <%}%>
                        </div>

                        <!--========================DESCRIÇÕES========================-->                        
                        <div id="container_descricao">
                            <%
                                if (tema.equals("historico")) {
                            %>
                            <div id="historicoEmpresa" class="descricaoEmpresa" style="display: block;">
                                <i class="fa fa-history iconDescricao"></i>
                                <p>
                                    <%=empresa.getHistorico()%>
                                </p>
                            </div>
                            <%} else {%>    
                            <div id="historicoEmpresa" class="descricaoEmpresa">
                                <i class="fa fa-history iconDescricao"></i>
                                <p>
                                    <%=empresa.getHistorico()%>
                                </p>
                            </div>
                            <%}%>    


                            <%
                                if (tema.equals("visao")) {
                            %>
                            <div id="visaoEmpresa" class="descricaoEmpresa" style="display: block;">
                                <i class="fa fa-street-view iconDescricao"></i>
                                <p>
                                    <%=empresa.getVisao()%>
                                </p>
                            </div>
                            <%} else {%>    
                            <div id="visaoEmpresa" class="descricaoEmpresa">
                                <i class="fa fa-street-view iconDescricao"></i>
                                <p>
                                    <%=empresa.getVisao()%>
                                </p>
                            </div>
                            <%}%>


                            <%
                                if (tema.equals("missao")) {
                            %>
                            <div id="missaoEmpresa" class="descricaoEmpresa" style="display: block;">
                                <i class="fa fa-crosshairs iconDescricao"></i>
                                <p>
                                    <%=empresa.getMissao()%>
                                </p>
                            </div>
                            <%} else {%>    
                            <div id="missaoEmpresa" class="descricaoEmpresa">
                                <i class="fa fa-crosshairs iconDescricao"></i>
                                <p>
                                    <%=empresa.getMissao()%>
                                </p>
                            </div>
                            <%}%>    


                            <%
                                if (tema.equals("valores")) {
                            %>
                            <div id="valoresEmpresa" class="descricaoEmpresa" style="display: block;">
                                <i class="fa fa-handshake-o iconDescricao"></i>
                                <p>
                                    <%=empresa.getValores()%>
                                </p>
                            </div>
                            <%} else {%>
                            <div id="valoresEmpresa" class="descricaoEmpresa">
                                <i class="fa fa-handshake-o iconDescricao"></i>
                                <p>
                                    <%=empresa.getValores()%>
                                </p>
                            </div>
                            <%}%>


                            <%
                                if (tema.equals("equipe")) {
                            %>
                            <div id="equipeEmpresa" class="descricaoEmpresa" style="display: block;">
                                <i class="fa fa-users iconDescricao"></i>
                                <p>
                                    <%=empresa.getEquipe()%>
                                </p>
                            </div>
                            <%} else {%>    
                            <div id="equipeEmpresa" class="descricaoEmpresa">
                                <i class="fa fa-users iconDescricao"></i>
                                <p>
                                    <%=empresa.getEquipe()%>
                                </p>
                            </div>
                            <%}%>
                        </div>
                        <div class="contatoEmpresa"></div>
                    </div>
                </section>
            </div>
            <div class="copyright">
                <i class="fa fa-copyright"></i>&nbsp;Copyright 2017 - Sistema Informática
            </div>
        </div>
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/scriptEmpresa.js"></script>
    </body>
</html>
