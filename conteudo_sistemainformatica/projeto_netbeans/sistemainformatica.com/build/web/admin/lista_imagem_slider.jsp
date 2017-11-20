<%
    //Verifica se está logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {
        

%>
<%@page import="model.Slider"%>
<%@page import="model.SliderDAO"%>

<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Slider> arraySlider = new ArrayList<Slider>();
    SliderDAO sliderDAO = new SliderDAO();

    try {
        arraySlider = sliderDAO.listaImagens();
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
        <link rel="stylesheet" type="text/css" href="css/lists.css">

        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">

        <!--==============================SCRIPT==============================-->
        <script type="text/javascript">
            function excluir(id) {
                var url = "../gerente_slider.do?opExcluir=excluir&idExcluir=" + id;
                if (confirm("Tem certeza de que deseja excluir o registro?")) {
                    window.open(url, "_self");
                }
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
                            <li id="liMenuSmall_empresa" class="liMenu liMenuSmall">
                                <i class="fa fa-plus"></i>
                                <a href="form_inserirSlider_pagInicial.jsp" class="link">Inserir Imagem</a>
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
                        <i class="fa fa-list"></i>&nbsp;
                        Lista slider - Página Inicial
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
                                <li id="list_liMenu_pagInicial" class="liMenu">
                                    <i class="fa fa-home"></i>
                                    <button class="button btnMenu" onclick="location = 'administrativo.jsp'">Página Inicial</button>
                                </li>

                                <li id="list_liMenu_pagInicial_insertImg" class="liMenu">
                                    <i class="fa fa-plus"></i>
                                    <button class="button btnMenu" onclick="location = 'form_inserir_imagem_slider.jsp'">Inserir Imagem
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <h5 id="msg_slider" style="display: block;">Não há dados</h5>
                        <table id="table_slider" class="tableSmall" style="visibility: hidden;">
                            <tr>
                                <th class="table_border table_padding">Imagem</th>
                                <th class="table_border table_padding">Ordem</th>
                            </tr>
                            <%
                                if (arraySlider.isEmpty()) {
                            %>
                            
                            <button class="button btnAdmin" onclick="location='form_inserir_imagem_slider.jsp'">
                                 <i class="fa fa-plus"></i>&nbsp;Inserir
                            </button>
                            <%}else {%>
                            <script>
                                $(document).ready(function () {
                                    $("#msg_slider").css('display', 'none');
                                    $("#table_slider").css('visibility', 'visible');
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
                                         background-size: cover;
                                         background-repeat: no-repeat;
                                         ">
                                    </div>                                    
                                </td>
                                <td class="table_border table_padding"><%=slider.getOrdem()%></td>
                                <td class="table_border table_padding">
                                    <button class="button btnOpcao" onclick="location = 'form_alterar_imagem_slider.jsp?id=<%=slider.getId()%>'">
                                        <i class="fa fa-pencil"></i>
                                    </button>
                                    <br/>
                                    <button class="button btnOpcao" onclick="if(confirm('Deseja realmente excluir a imagem?')){location='../gerente_slider.do?opExcluir=excluir&imagemExcluir=<%=slider.getImagem()%>&idExcluir=<%=slider.getId()%>';}"">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <%}}%>
                        </table>
                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>


</html>
<%
    } else {
        out.println("Você não está logado no sistema. Clique <a href='login.jsp'>aqui</a> para logar-se");
    }
%>