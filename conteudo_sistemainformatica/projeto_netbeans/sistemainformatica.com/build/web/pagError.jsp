<%
    String msg = request.getParameter("msg");
%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Inform�tica</title>

    </head>
    <body>
        <%
            out.println(msg);
        %>
    </body>
</html>