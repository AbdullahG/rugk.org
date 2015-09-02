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
        <div name="arge" align="center">
            <h3>AR-GE</h3>
            <%
        List<Post> allPosts = postViewBean.getPostList("");
        
        List<Post> argeList = new ArrayList<Model.Post>();
        List<Post> haberList = new ArrayList<Model.Post>();
        List<Post> galeriList = new ArrayList<Model.Post>();
        List<Post> duyuruList = new ArrayList<Model.Post>();
        for(Post tPost: allPosts)
        {
            if(tPost.getCategory().getCategoryName().equals("arge"))
                argeList.add(tPost);
            else if(tPost.getCategory().getCategoryName().equals("duyuru"))
                duyuruList.add(tPost);
            else if(tPost.getCategory().getCategoryName().equals("galeri"))
                galeriList.add(tPost);
            else if(tPost.getCategory().getCategoryName().equals("haber"))
                haberList.add(tPost);
        }
        
        for(Post argeObj: argeList)
        {
            out.println("<a href=\""+argeObj.getPostText()+"\">"+argeObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
        <div name="haberler" align="center">
            <h3>Haberler</h3>
            <%
        for(Post haberObj: haberList)
        {
            out.println("<a href=\""+haberObj.getPostText()+"\">"+haberObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
        <div name="Duyurular" align="center">
            <h3>Duyurular</h3>
            <%
        for(Post duyuruObj: duyuruList)
        {
            out.println("<a href=\""+duyuruObj.getPostText()+"\">"+duyuruObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
        <div name="galeri" align="center">
            <h3>Galeri</h3>
            <%
        for(Post galeriObj: galeriList)
        {
            out.println("<a href=\""+galeriObj.getPostText()+"\">"+galeriObj.getPostHeader()+"</a> <br/>");
        }
        %>
        </div>
    </body>
</html>
