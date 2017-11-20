<%
    //Verifica se está logado
    if (session.getAttribute("loginUsuario") != null || session.getAttribute("senhaUsuario") != null) {


%>
<%@page import="model.Slider"%>
<%@page import="model.SliderDAO"%>

<%    int id = Integer.parseInt(request.getParameter("id"));

    Slider slider = new Slider();
    SliderDAO sDAO = new SliderDAO();
    try {
        slider = sDAO.listaImagemEspecifica(id);
    } catch (Exception e) {
        out.print("ERRO: " + e.getMessage());
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
                        Alteração de imagem - Slider Página Inicial
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

                                <li id="form_liMenu_inserirSlider" class="liMenu">
                                    <i class="fa fa-list"></i>
                                    <button class="button btnMenu" onclick="location = 'lista_imagem_slider.jsp'">Lista imagens - Slider
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </header>

                <!--==============================SECTION==============================-->
                <section id="sectionAdministrativo" class="section col-xs-12">
                    <center>
                        <div class="img">
                            <form action="../gerente_imagem_slider.do" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="idSlider" value="<%=slider.getId()%>">
                                <input type="hidden" name="nome" value="<%=slider.getImagem()%>">

                                <button class="button trash_imagem">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>
                            <img src="../slider/<%=slider.getImagem()%>" alt="Sem Imagem">				
                        </div>

                        <form action="../gerente_slider.do" method="POST" name="form_insertImg_slider" class="form" enctype="multipart/form-data">
                            <input type="hidden" name="op" value="alterar">
                            <input type="hidden" name="id" value="<%=slider.getId()%>">
                            <input type="hidden" name="idSlider" value="<%=slider.getId()%>">

                            <label>Selecione a imagem:</label> 
                            <%
                                if (slider.getImagem().isEmpty()) {
                            %>
                            <h5 style="color: red;">Tamanho recomendado: 700x450</h5>
                            <br/>
                            <input type="file" name="img_slider" id="img_slider" accept=".jpg" required>
                            <%} else {%>
                            <h4>Para alterar a imagem, exclua a atual</h4>
                            <input type="file" name="img_slider" accept=".jpg" style="display: none;">
                            <%}%>

                            <br/><br/>
                            <label>Ordem da imagem:</label> <br/>
                            <input type="number" name="ordem_imagem" min="1" max="5" value="<%=slider.getOrdem()%>">
                            <br/><br/>
                            <input type="submit" name="btnEnviar" class="button btnAdmin" value="Alterar">
                        </form>
                    </center>
                </section>

            </div>
        </div>
        <!--==============================SCRIPT==============================-->
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/validacao.js"></script>
        <script type="text/javascript">
            function filePreview(input){
                if(input.files && input.files[0]){
                    var reader = new FileReader();
                    reader.onload = function(e){
                        $("#img_slider + img").remove();
                        $("#img_slider").after('<img src="'+e.target.result+'"width="80" height="80" style="position: relative; top: 10px; border-radius: 20px;">');
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#img_slider").change(function(){
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