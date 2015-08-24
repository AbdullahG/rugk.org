<%-- 
    Document   : Uyelik
    Created on : Aug 21, 2015, 2:39:45 AM
    Author     : MuhammedAbdullah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <jsp:useBean id="User" class="Model.User"></jsp:useBean>
            <form action="Uyelik.jsp" name="uyeForm" method="post">
                <table>
                    <tr>
                        <td>Kullanıcı Adı: </td>
                        <td><input type="text" name="userName" /></td>
                    </tr>
                    <tr>
                        <td>Şifre: </td>
                        <td><input type="text" name="password" /></td>
                    </tr>
                    <tr>
                        <td>İsim:</td>
                        <td><input type="text" name="name" /></td>
                    </tr>
                    <tr>
                        <td>Soyisim: </td>
                        <td><input type="text" name="surName" /></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email" /></td>
                    </tr>
                    <tr>
                        <td>Tel: </td>
                        <td><input type="text" name="gsm" /></td>
                    </tr>
                    <tr>
                        <td>Fakülte: </td>
                        <td><input type="text" name="faculty"/></td>
                    </tr>
                    <tr>
                        <td>Bölüm: </td>
                        <td><input type="text" name="department"/></td>
                    </tr>
                    <tr>
                        <td>Sınıf: </td>
                        <td><input type="text" name="grade" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Gönder"  name="submit" /> <input type="reset" value="Sıfırla"  id="Reset"\></input></td>
                    </tr>
                </table>

            </form>

        <jsp:setProperty name="User" property="*" />
        <%if (User.validate()) {
                String registrationMsg = User.registerToDB();
                out.println(registrationMsg + ", anasayfaya yönlendiriliyorsunuz..");
                response.setHeader("Refresh", "2.2;url=index.jsp"); // 2.2 sn sonra index.jsp'e yönlendir.
            } else if (request.getParameter("submit") != null) {
                out.println("Tüm alanları eksiksiz doldurunuz!");
            }
        %>
    </body>
</html>