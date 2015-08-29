<%-- 
    Document   : login
    Created on : Aug 22, 2015, 12:04:17 AM
    Author     : MuhammedAbdullah
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Üye Girişi</title>
    </head>
    <body>
        <%!String userNameForCookie="", passwordForCookie=""; %>
        <%
            
            Cookie[] cookies = request.getCookies();
            if(cookies!=null)
            for(int i=0; i<cookies.length; i++)
            {
                Cookie cookie = cookies[i];
                if(cookie.getName().equals("userName"))
                    this.userNameForCookie = cookie.getValue();
                else
                    if(cookie.getName().equals("password"))
                        this.passwordForCookie = cookie.getValue();
            }
            %>
            <%@include file="WEB-INF/menu.jsp" %>
        <jsp:useBean id="User" class="Model.User"></jsp:useBean>
            <form action="login.jsp" name="loginForm" method="post">
                <table>
                    <tr>
                        <td>Kullanıcı Adı/E-Posta: </td>
                        <td><input type="text" name="userName" value="<%=this.userNameForCookie%>" /></td>
                    </tr>
                    <tr>
                        <td>Şifre: </td>
                        <td><input type="password" name="password" value = "<%=this.passwordForCookie%>" /></input></td>
                    </tr>
                    <tr><td><input type="checkbox" name="remember" value="rememberChecked" checked/>Beni Hatırla</td>
                        <td><input type="submit" name="loginSubmit" value="Giriş"/></td>
                    </tr>
                </table>
            </form>
            <jsp:setProperty name="User" property="*" />
            <%
                if(User.getUserName()!=null && !User.getUserName().equals("") && User.getPassword()!=null && !User.getPassword().equals(""))
                {
                    User userTemp = null;
                    if((userTemp = User.getRepoService().loginUser(User.getUserName(), User.getPassword()))!=null)
                    {
                        //SESSION SET EDILECEK
                        HttpSession sessionObj = request.getSession();
                        sessionObj.setAttribute("userObject", userTemp);
                        
                        if(request.getParameter("remember")!=null)
                        {
                            Cookie cookie = new Cookie("userName", userTemp.getUserName());
                            cookie.setMaxAge(2600000); // 1 ay süreli cookie
                            response.addCookie(cookie);
                            cookie = new Cookie("password", userTemp.getPassword());
                            cookie.setMaxAge(2600000);
                            
                            response.addCookie(cookie);
                        }
                        else
                        {
                            Cookie cookie = new Cookie("userName", "");
                            cookie.setMaxAge(2600000); // 1 ay süreli cookie
                            response.addCookie(cookie);
                            cookie = new Cookie("password", "");
                            cookie.setMaxAge(2600000);
                            response.addCookie(cookie);
                        }
                        
                        out.println("Başarılı bir şekilde giriş yaptınız, anasayfaya yönlendiriliyorsunuz..");
                        response.setHeader("Refresh", "2.2;url=index.jsp"); // 2.2 sn sonra index.jsp'e yönlendir.
                    }
                    else
                        out.println("Kullanıcı adı yada şifre hatalı!");
                }
                %>
    </body>
</html>
