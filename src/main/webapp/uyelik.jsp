<%-- 
    Document   : Uyelik
    Created on : Aug 21, 2015, 2:39:45 AM
    Author     : MuhammedAbdullah
--%>

<%@page import="Model.Faculty"%>
<%@page import="java.util.List"%>
<%@page import="View.userView"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Üye Ol</title>
    </head>

    <%@include file="WEB-INF/menu.jsp" %>
    <jsp:useBean id="userViewBean" class="View.userView"></jsp:useBean>
    <jsp:useBean id="userBean" class="Model.User"></jsp:useBean>

        <body>
        <%            List<Faculty> facultyList = userViewBean.getFacultyList();
        %>
        <script language="javascript" type="text/javascript">
            function dropdownlist(listindex)
            {

                document.uyeForm.selectDepartment.options.length = 0;
                switch (listindex)
                {
            <%
                for (int i = 0; i < facultyList.size(); i++) {
                    out.println("case \"" + facultyList.get(i).getFacultyName() + "\" :");
                    for (int k = 0; k < facultyList.get(i).getDepartmentList().size(); k++) {
                        out.println("document.uyeForm.selectDepartment.options[" + k + "] = new Option(\"" + facultyList.get(i).getDepartmentList().get(k).getDepartmentName() + "\""
                                + ", \"" + facultyList.get(i).getDepartmentList().get(k).getDepartmentName() + "\");");
                    }
                    out.println(" break; ");
                }
            %>
                }
                return true;
            }
        </script>
        <div class="container">
            <div class="row">
                <form action="uyelik.jsp" name="uyeForm" method="post" role="form">
                    <div class="col-lg-6">
                        <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Doldurulması zorunlu alanlar</strong></div>
                        <div class="form-group">
                            <label for="InputName"></label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="name" id="InputName" placeholder="İsim" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" name="surName" id="InputSurname" placeholder="Soyisim" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail"></label>
                            <div class="input-group">
                                <input type="email" class="form-control" id="InputEmail" name="email" placeholder="E-Posta" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputPasswordFirst"></label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="InputPasswordFirst" name="password" placeholder="Şifre" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="password" class="form-control" id="InputPasswordSecond" name="password" placeholder="Şifre" required>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <label for="InputMessage">Enter Message</label>
                            <div class="input-group">
                                <textarea name="InputMessage" id="InputMessage" class="form-control" rows="5" required></textarea>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        -->

                        <div class="form-group">
                            <label for="selectFaculty"></label>
                            <div class="input-group">
                                <select name="faculty" id="selectFaculty" class="form-control" onchange="javascript: dropdownlist(this.options[this.selectedIndex].value);">
                                    <option value="">Fakülte</option>
                                    <%                                        for (int i = 0; i < facultyList.size(); i++) {
                                            out.println("<option value=\"" + facultyList.get(i).getFacultyName() + "\">" + facultyList.get(i).getFacultyName() + "</option>");
                                        }
                                    %>
                                </select>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <script type="text/javascript" language="JavaScript">
                                    document.write('<select name="department" id="selectDepartment" class="form-control"><option value="">Bölüm</option></select>')
                                </script>

                                <noscript>
                                <select name="department" id="selectDepartment" class="form-control" >
                                    <option value="">Bölüm</option>
                                </select>
                                </noscript>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>




                        <div class="form-group">
                            <label for="GSM"></label>
                            <div class="input-group">
                                <input type="phone" class="form-control" id="InputPasswordSecond" name="gsm" placeholder="Cep Tel No">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-phone glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <input type="submit" name="submit" id="submit" value="Gönder" class="btn btn-info pull-right">
                    </div>
                </form>
                
                            


            </div>
        </div>

        <jsp:setProperty name="userBean" property="*"></jsp:setProperty>


        <%if (userViewBean.checkInput(userBean.getName()) && userViewBean.checkInput(userBean.getSurName()) && userViewBean.checkInput(userBean.getEmail())
                    && userViewBean.checkInput(userBean.getPassword()) && userViewBean.checkInput(userBean.getFaculty()) && userViewBean.checkInput(userBean.getDepartment())
                    && userViewBean.checkInput(userBean.getGsm())) {
                userViewBean.setUser(userBean);
                String registrationMsg = userViewBean.registerToDB();
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("userObject", userBean);
        %>
                <div class="col-lg-5 col-md-push-1">
                    <div class="col-md-12">
                        <div class="alert alert-success">
                            <strong><span class="glyphicon glyphicon-ok"></span><%=registrationMsg+", anasayfaya yönlendiriliyorsunuz.."%></strong>
                        </div>
                    </div>
                </div>
        <script type="text/javascript">
            window.location = "<%=request.getContextPath() + "/index.jsp"%>"
        </script>

        <%
            } else if (request.getParameter("submit") != null) {
                %>
                <div class="col-lg-5 col-md-push-1">
                    <div class="col-md-12">
                        <div class="alert alert-danger">
                            <span class="glyphicon glyphicon-remove"></span><strong> Formları özel karakter('\"<>/,=!;) kullanmadan doldurunuz.</strong>
                        </div>
                    </div>
                </div>  
                <%
            }
        %>


        <%@include file="WEB-INF/altMenu.jsp" %>
    </body>
</html>
