<%-- 
    Document   : index
    Created on : Aug 24, 2015, 9:09:50 PM
    Author     : MuhammedAbdullah
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="Model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YBU Robotik Uygulama ve Geliştirme Kulübü Websitesi</title>
    </head>
    
    <body>
        <jsp:useBean id="postViewBean" class="View.PostView"></jsp:useBean>
        <%@include file="WEB-INF/menu.jsp" %>
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
        <div name="arge">
            <h3>AR-GE</h3>
            <%
        List<Post> argeList = new ArrayList<Model.Post>();
        argeList = postViewBean.getPostList("arge");
        for(Post argeObj: argeList)
        {
            out.println("<a href=\""+argeObj.getPostText()+"\">"+argeObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
        <div name="haberler">
            <h3>Haberler</h3>
            <%
        List<Model.Post> haberList = new ArrayList<Model.Post>();
        haberList = postViewBean.getPostList("haber");
        for(Post haberObj: haberList)
        {
            out.println("<a href=\""+haberObj.getPostText()+"\">"+haberObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
        <div name="Duyurular">
            <h3>Duyurular</h3>
            <%
        List<Post> duyuruList = new ArrayList<Post>();
        duyuruList = postViewBean.getPostList("duyuru");
        for(Post duyuruObj: duyuruList)
        {
            out.println("<a href=\""+duyuruObj.getPostText()+"\">"+duyuruObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
        <div name="galeri">
            <h3>Galeri</h3>
            <%
        List<Model.Post> galeriList = new ArrayList<Model.Post>();
        galeriList = postViewBean.getPostList("galeri");
        for(Post galeriObj: galeriList)
        {
            out.println("<a href=\""+galeriObj.getPostText()+"\">"+galeriObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
    </body>
</html>
