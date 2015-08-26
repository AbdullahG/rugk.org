<%-- 
    Document   : post
    Created on : Aug 27, 2015, 1:30:30 AM
    Author     : MuhammedAbdullah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Haber/Duyuru Ekleme Sayfası</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <table>
            <tr>
                <td>
                    <b>Başlık:</b>
                </td>
                <td>
                    <input type="text" size="100"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Yazı Alanı: </b>
                </td>
                <td>
                    <textarea cols="80" rows="25">
                        
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Kategori: </b>
                </td>
                <td>
                    <select name="categorySelect">
                        <option value="0">Seçiniz</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Yayınla"/>
                </td>
            </tr>
        </table>
    </body>
</html>
