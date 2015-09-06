<%-- 
    Document   : post
    Created on : Aug 27, 2015, 1:30:30 AM
    Author     : MuhammedAbdullah
--%>

<%@page import="View.PostView"%>
<%@page import="java.io.File"%>
<%@page import="Controller.RepoServiceImp"%>
<%@page import="Controller.RepoService"%>
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

        <jsp:useBean id="postBean" class="Model.Post"></jsp:useBean>
        <jsp:useBean id="postViewBean" class="View.PostView"></jsp:useBean>
        <% postViewBean.getCategoriesAsString();
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
                            <% out.println(postViewBean.getCategoriesAsString()); %>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Yayınla" name="postYayinla"/>
                    </td>
                </tr>
            </table>

                            <jsp:setProperty name="postBean" property="*"/>
        </form>
        <%
            if (request.getParameter("postYayinla") != null) {
                if (postBean.getCategoryID()==-1 || postBean.getCategoryID()==0) {
                    out.println("Kategori seçiniz.");
                }
                if (postBean.getPostHeader().equals("")) {
                    out.println("Başlık giriniz.");
                }
                if (postBean.getPostText().trim().equals("")) {
                    out.println("Yazı alanına metin giriniz");
                } else if (postBean.getCategoryID()!=-1 && postBean.getCategoryID()!=0 && !postBean.getPostHeader().equals("") 
                        && !postBean.getPostText().equals("")) {
                    out.println("Yazı eklendi");
                    Post tempPost = new Post();
                    tempPost.setCategoryID(postBean.getCategoryID());
                    tempPost.setPostHeader(postBean.getPostHeader());
                    tempPost.setPostText(postBean.getPostText());
                    View.PostView postView = new PostView();
                    if(postView.registerToDB(application.getRealPath(""), tempPost))
                        out.println("Post kaydedildi. Görüntülemek için <a href=\""+tempPost.getPostText()+"\">Tıklayın</a>");
                    else
                        out.println("Bir hata oluştu, post kaydedilemedi");
                    
                }
            }
            
        %>
    </body>
</html>
