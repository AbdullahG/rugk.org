<%-- 
    Document   : index
    Created on : Aug 24, 2015, 9:09:50 PM
    Author     : MuhammedAbdullah
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YBU Robotik Uygulama ve Geliştirme Kulübü Websitesi</title>
    </head>
    
    <body>
        <%@include file="menu.jsp" %>
        <h1>Anasayfa</h1>
        <% 
        if(request.getSession().getAttribute("userObject")!=null)
        {
            User user = (User)request.getSession().getAttribute("userObject");
            out.println("Hoşgeldiniz: "+user.getName()+" "+user.getSurName());
            %>
            <b />
            <a href="logout.jsp"><b>Çıkış</b></a><br/>
            <a href="post.jsp"><b>Yazı Ekle</b></a>
            <%
        }
        else
        {
        %>
        <b>Üye Olmak için <a href='Uyelik.jsp'>Tıklayınız </a></b><br/>
        <b>Üye girişi yapmak için <a href="login.jsp">Tıklayınız</a></b>
        <%
        }
        %>
    </body>
</html>
