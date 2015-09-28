<%-- 
    Document   : ar-ge
    Created on : Sep 8, 2015, 1:13:36 PM
    Author     : MuhammedAbdullah
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AR-GE</title>
        <%@include file="WEB-INF/menu.jsp" %>
    </head>
    
    <jsp:useBean id="postViewBean" class="View.PostView"></jsp:useBean>
    
        <body>
            <div class="container">
            <%
            List<Post> argeList = null;
            argeList = postViewBean.getPostList("arge");
            
            for(int i=0;i<argeList.size();i++)
            {%>
                <div class="row">
                    <div class="span8">
                        <div class="row">
                            <div class="span8">
                                <h4><strong><a href="#"><%= argeList.get(i).getPostHeader() %></a></strong></h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span2">
                                <a href="<%=argeList.get(i).getPostText()  %>" class="thumbnail">
                                    <img src="photo/1.jpg" alt="argephoto">
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span8">
                                <p></p>
                                <p>
                                    <i class="icon-user"></i> by <a href="#">Admin</a> 
                                    | <i class="icon-calendar"></i> Sept 16th, 2012
                                    | <i class="icon-comment"></i> <a href="#">3 Comments</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                
            <%
            }
            %>
                
            </div>


        <%@include file="WEB-INF/altMenu.jsp" %>
    </body>
</html>
