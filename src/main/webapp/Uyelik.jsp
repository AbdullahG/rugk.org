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
        <jsp:useBean id="Member" class="Model.User"></jsp:useBean>
            <form action="Uyelik.jsp" name="uyeForm" method="post">
                <table>
                    <tr>
                        <td>İsim:</td>
                        <td><input type="text" name="name" /></td>
                    </tr>
                    <tr>
                        <td>Soyisim: </td>
                        <td><input type="text" name="surName" \></input></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email" \></input></td>
                    </tr>
                    <tr>
                        <td>Tel: </td>
                        <td><input type="text" name="gsm" \></input></td>
                    </tr>
                    <tr>
                        <td>Fakülte: </td>
                        <td><input type="text" name="faculty"\></input></td>
                    </tr>
                    <tr>
                        <td>Bölüm: </td>
                        <td><input type="text" name="department"\></input></td>
                    </tr>
                    <tr>
                        <td>Sınıf: </td>
                        <td><input type="text" name="grade" \></input></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Gönder"  name="submit" \></input> <input type="reset" value="Sıfırla"  id="Reset"\></input></td>
                    </tr>
                </table>

            </form>

        <jsp:setProperty name="Member" property="*" />
        <%if (Member.validate()) {
                out.println("Üyelik işleminiz tamamlandı, anasayfaya yönlendiriliyorsunuz..");
                response.setHeader("Refresh", "2.2;url=index.html"); // 2.2 sn sonra index.jsp'e yönlendir.
            } else if (request.getParameter("submit") != null) {
                out.println("Tüm alanları eksiksiz doldurunuz!");
            }
        %>
    </body>
</html>