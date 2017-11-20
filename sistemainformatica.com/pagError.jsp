<%
    String msg = request.getParameter("msg");
%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Informática</title>
        <link rel="icon" href="img/logo_small.png">
    </head>
    <body>
        <%
            out.println(msg);
        %>
    </body>
</html>