<%-- 
    Document   : index
    Created on : Aug 24, 2015, 9:09:50 PM
    Author     : MuhammedAbdullah
--%>

<%@page import="java.util.Random"%>
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
    <style>

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
        }
        .container{
            max-width:1060px;margin:auto;margin-top:50px;
        }
    </style>
    <body>
        <jsp:useBean id="postViewBean" class="View.PostView"></jsp:useBean>
        <%@include file="WEB-INF/menu.jsp" %>

        <div name="posts">
            <%                List<Post> allPosts = postViewBean.getPostList("");

                List<Post> argeList = new ArrayList<Model.Post>();
                List<Post> haberList = new ArrayList<Model.Post>();
                List<Post> galeriList = new ArrayList<Model.Post>();
                List<Post> duyuruList = new ArrayList<Model.Post>();
                for (Post tPost : allPosts) {
                    if (tPost.getCategory().getCategoryName().equals("arge")) {
                        argeList.add(tPost);
                    } else if (tPost.getCategory().getCategoryName().equals("duyuru")) {
                        duyuruList.add(tPost);
                    } else if (tPost.getCategory().getCategoryName().equals("galeri")) {
                        galeriList.add(tPost);
                    } else if (tPost.getCategory().getCategoryName().equals("haber")) {
                        haberList.add(tPost);
                    }
                }
            %>
        </div>

        <div class="container">
            <br>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">

                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <%
                        Random rnd = new Random();
                        for (int i = 0; i < 4; i++) {
                            if (i == 0) {
                                out.println("<div class=\"item active\">"
                                        + "<a href=\"" + allPosts.get(i).getPostText() + "\"><img src=\"photo/" + i + ".jpg\" alt=\"Chania\" width=\"460\" height=\"345\"></a>"
                                        + "<div class=\"carousel-caption\">"
                                        + "<p>" + allPosts.get(i).getPostHeader() + "</p>"
                                        + "</div>"
                                        + "</div>");
                                continue;
                            }
                            out.println("<div class=\"item\">"
                                    + "<a href=\"" + allPosts.get(i).getPostText() + "\"><img src=\"photo/" + i + ".jpg\" alt=\"Chania\" width=\"460\" height=\"345\"></a>"
                                    + "<div class=\"carousel-caption\">"
                                    + "<p>" + allPosts.get(i).getPostHeader() + "</p>"
                                    + "</div>"
                                    + "</div>");
                        }
                    %>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
                    <%@include file="WEB-INF/altMenu.jsp" %>
    </body>
</html>
