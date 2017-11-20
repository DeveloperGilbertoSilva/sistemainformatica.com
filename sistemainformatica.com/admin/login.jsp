<!DOCTYPE html>
<html>
    <head>
        <title>Login - Sistema Informática</title>
        <!--==============================META-TAG==============================-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, inicial-scale=1">
        <!--==============================CSS==============================-->
        <link rel="stylesheet" type="text/css" href="css/style.css">


        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome-4.7.0/css/font-awesome.css">

        <link rel="icon" href="img/logo_small.png">


        <style type="text/css">
            .container_form_login{
                position: absolute;
                min-width: 260px;
                height: 350px;
                top: 50%;
                left: 50%;
                margin: -175px auto auto -130px;
                padding: 5px;
                border-radius: 5px;
                background: #101d42;
                font-family: "Lato-Light";
                color: white;}
            .container_form_login h4{line-height: 100px;}
            .icon{
                position: absolute;
                width: 100px;
                height: 100px;
                margin-top: -30px;
                margin-left: -30px;
                border-radius: 100px;
                background: white;
                text-align: center;
                color: #101d42;}
            .icon i{
                line-height: 100px;
                font-size: 4em;}

            .container_form_login form label{
                font-family: "Lato-Light";
                font-size: 1.3em;
                color: white;
            }
            .container_form_login input{
                border-radius: 5px;
                padding: 10px;
                outline: none;}
            .input{color: black;}
            .container_form_login input[type="submit"]{border: 2px solid white;}
        </style>
        <!--==============================SCRIPT==============================-->

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="container_form_login">
                    <div class="icon">
                        <i class="fa fa-user-circle-o"></i>
                    </div>
                    <center>
                        <h4>Administrativo</h4>
                        <form method="POST" action="../gerente_login.do" class="form">
                            <label>Login</label><br/>
                            <input type="text" name="login" size="20" maxlength="20" placeholder="Login..." class="input" required><br/><br/>

                            <label>Senha</label></br/>
                            <input type="password" name="senha" size="20" maxlength="20" placeholder="Senha" class="input" required><br/><br/>

                            <input type="submit" name="btnEnviar" value="Entrar" class="button btnAdmin">
                        </form>
                    </center>
                </div>
            </div>
        </div>
    </body>
</html>