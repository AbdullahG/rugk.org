<%-- 
    Document   : logout
    Created on : Aug 26, 2015, 2:02:47 PM
    Author     : MuhammedAbdullah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Çıkış</title>
    </head>
    <body>
        <%@include file="WEB-INF/menu.jsp" %>

        <b>
            <%                request.getSession().invalidate();
                out.println("Çıkış yaptınız, anasayfaya yönlendiriliyorsunuz..");
                response.setHeader("Refresh", "2;url=index.jsp"); // 2 sn sonra index.jsp'e yönlendir.
%>
        </b>

        <%@include file="WEB-INF/altMenu.jsp" %>
    </body>
</html>
