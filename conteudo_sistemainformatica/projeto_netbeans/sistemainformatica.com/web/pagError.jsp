<%
    String msg = request.getParameter("msg");
%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Informática</title>

    </head>
    <body>
        <%
            out.println(msg);
        %>
    </body>
</html>