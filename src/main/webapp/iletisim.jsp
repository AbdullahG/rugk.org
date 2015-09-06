<%-- 
    Document   : iletisim
    Created on : Sep 5, 2015, 5:35:21 PM
    Author     : MuhammedAbdullah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RUGK.ORG - İletişim</title>
        <%@include file="WEB-INF/menu.jsp" %>

        <style>
            .jumbotron {
                background: #358CCE;
                color: #FFF;
                border-radius: 0px;
            }
            .jumbotron-sm { padding-top: 24px;
                            padding-bottom: 24px; }
            .jumbotron small {
                color: #FFF;
            }
            .h1 small {
                font-size: 24px;
            }
        </style>
    </head>
    <body>
        <div class="jumbotron jumbotron-sm">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                        <h1 class="h1">
                            Contact us <small>Feel free to contact us</small></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="well well-sm">
                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">
                                            İsim</label>
                                        <input type="text" class="form-control" id="name" placeholder="İsim giriniz" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <label for="email">
                                            E-Posta Adresi</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                            </span>
                                            <input type="email" class="form-control" id="email" placeholder="E-Posta giriniz" required="required" /></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="subject">
                                            Konu</label>
                                        <select id="subject" name="subject" class="form-control" required="required">
                                            <option value="na" selected="">Genel</option>
                                            <option value="service">Öneri</option>
                                            <option value="suggestions">İstek</option>
                                            <option value="product">Şikayet</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">
                                            Mesaj</label>
                                        <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                                  placeholder="Mesaj"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                                        Gönder</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <form>
                        <legend><span class="glyphicon glyphicon-globe"></span>Neredeyiz?</legend>
                        <address>
                            <strong>Robotik Uygulama ve Geliştirme Kulübü</strong><br>
                            Yıldırım Beyazıt Üniversitesi<br>
                            Mühendislik ve Doğa Bilimleri Fakültesi<br>
                            <abbr title="Phone">
                                Tel:</abbr>
                            (507) 975-5170
                        </address>
                        <address>
                            <strong>Abdullah Gürsu</strong><br>
                            <a href="mailto:#">muhammedabdullahgursu@gmail.com</a>
                        </address>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/altMenu.jsp" %>
    </body>
</html>
