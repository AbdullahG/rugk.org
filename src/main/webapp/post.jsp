<%-- 
    Document   : post
    Created on : Aug 27, 2015, 1:30:30 AM
    Author     : MuhammedAbdullah
--%>

<%@page import="java.io.File"%>
<%@page import="Model.RepoServiceImp"%>
<%@page import="Model.RepoService"%>
<%@page import="Model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haber/Duyuru Ekleme Sayfası</title>
    </head>
    <body>

        <%@include file="WEB-INF/menu.jsp" %>

        <jsp:useBean id="Post" class="Model.Post"></jsp:useBean>
        <% Post post = new Post();
            post.getCategoriesAsString();
        %>
        <form action="post.jsp" name="postForm" method="post">
            <table>
                <tr>
                    <td>
                        <b>Başlık:</b>
                    </td>
                    <td>
                        <input type="text" size="110" name="postHeader"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Yazı Alanı: </b>
                    </td>
                    <td>
                        <textarea  name="postText" cols="80" rows="25">
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Kategori: </b>
                    </td>
                    <td>
                        <select name="categoryID">
                            <option value="-1">Seçiniz</option>
                            <% out.println(Post.getCategoriesAsString()); %>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Yayınla" name="postYayinla"/>
                    </td>
                </tr>
            </table>

            <jsp:setProperty name="Post" property="*"/>
        </form>
        <%
            if (request.getParameter("postYayinla") != null) {
                if (Post.getCategoryID()==-1 || Post.getCategoryID()==0) {
                    out.println("Kategori seçiniz.");
                }
                if (Post.getPostHeader().equals("")) {
                    out.println("Başlık giriniz.");
                }
                if (Post.getPostText().trim().equals("")) {
                    out.println("Yazı alanına metin giriniz");
                } else if (Post.getCategoryID()!=-1 && Post.getCategoryID()!=0 && !Post.getPostHeader().equals("") 
                        && !Post.getPostText().equals("")) {
                    out.println("Yazı eklendi");
                    Post tempPost = new Post();
                    tempPost.setCategoryID(Post.getCategoryID());
                    tempPost.setPostHeader(Post.getPostHeader());
                    tempPost.setPostHeader(Post.getPostHeader());
                    
                    if(tempPost.registerToDB(application.getRealPath("")))
                        out.println("Post kaydedildi");
                    else
                        out.println("Bir hata oluştu, post kaydedilemedi");
                    
                }
            }
            
        %>
    </body>
</html>
