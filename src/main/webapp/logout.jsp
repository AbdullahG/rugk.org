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

        <b>
            <%           if (request != null && request.getSession() != null) {
                    request.getSession().invalidate();
                }%>
            <h4 align="center">
                <%                            out.println("Çıkış yaptınız, anasayfaya yönlendiriliyorsunuz..");
                %>
            </h4>
            <%
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "index.jsp");
            %>
        </b>

    </body>
</html>
