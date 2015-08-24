<%-- 
    Document   : login
    Created on : Aug 22, 2015, 12:04:17 AM
    Author     : MuhammedAbdullah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Üye Girişi</title>
    </head>
    <body>
        <jsp:useBean id="User" class="Model.User"></jsp:useBean>
            <form action="login.jsp" name="loginForm" method="post">
                <table>
                    <tr>
                        <td>Kullanıcı Adı: </td>
                        <td><input type="text" name="userName" /></td>
                    </tr>
                    <tr>
                        <td>Şifre: </td>
                        <td><input type="text" name="password" \></input></td>
                    </tr>
                    <tr><td></td><td><input type="submit" name="loginSubmit" value="Giriş"/></tr>
                </table>
            </form>
            <jsp:setProperty name="User" property="*" />
            <%
                if(User.getUserName()!=null && !User.getUserName().equals("") && User.getPassword()!=null && !User.getPassword().equals(""))
                {
                    if(User.getRepoService().loginUser(User.getUserName(), User.getPassword())!=null)
                    {
                        //SESSION SET EDILECEK
                        out.println("Başarılı bir şekilde giriş yaptınız, anasayfaya yönlendiriliyorsunuz..");
                        response.setHeader("Refresh", "2.2;url=index.html"); // 2.2 sn sonra index.jsp'e yönlendir.
                    }
                    else
                        out.println("Kullanıcı adı yada şifrenizi yanlış girdiniz!");
                }
                %>
    </body>
</html>
