<%-- 
    Document   : altMenu
    Created on : Sep 6, 2015, 1:29:13 AM
    Author     : MuhammedAbdullah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            @import url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css);
            body{margin-top:20px}
            .container-cont{
                width:1100px;
            }
            .fa{font-size:24px;margin-right:5px}
            .row-first{margin-bottom:10px;margin-top:8px}
            .title-contact{margin-top:32px;display:none;color: black;}
            .contact-email { display:none;color: black; }
            a{transition:all .3s ease;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-o-transition:all .3s ease}
            .quick-contact{text-align:center}
            .contact a{-webkit-border-radius:2px;-moz-border-radius:2px;-o-border-radius:2px;border-radius:2px;display:block;background-color:#D0D0D0;font-size:20px;text-align:center;color:#fff;padding:7px}
            .contact a:hover{background-color:rgba(255,255,255,0.85);text-decoration:none}
            .contact a.facebook:hover,.fa-facebook{color:#3b5998}
            .contact a.instagram:hover,.fa-instagram{color:#3f729b}
            .contact a.linkedin:hover,.fa-linkedin{color:#0e76a8}
            .contact a.twitter:hover,.fa-twitter{color:#00acee}
        </style>
        <script>
            $(document).ready(function () {
                $(".title-contact, .contact-email").fadeIn("slow");
            });
        </script>
    </head>
    <body>
        <div class="container" width="1400px">
            <div class="well well-sm quick-contact">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">
                                <h4 class="title-contact">
                                    Kulübümüz ile ilgili haberleri sosyal medya hesaplarımızdan da takip edebilirsiniz. </h4>
                            </div>
                            <div class="col-md-4">
                                <div class="row contact row-first">
                                    <div class="col-md-6">
                                        <a href="http://www.jquery2dotnet.com" class="facebook"><i class="fa fa-facebook"></i>facebook</a>
                                    </div>
                                    <div class="col-md-6">
                                        <a href="http://www.jquery2dotnet.com" class="instagram"><i class="fa fa-instagram"></i>Instagram</a>
                                    </div>
                                </div>
                                <div class="row contact">
                                    <div class="col-md-6">
                                        <a href="http://www.jquery2dotnet.com" class="linkedin"><i class="fa fa-linkedin"></i>Linkedin</a>
                                    </div>
                                    <div class="col-md-6">
                                        <a href="http://www.jquery2dotnet.com" class="twitter"><i class="fa fa-twitter"></i>Twitter</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h4  class="title-contact">rugk.org<br>©2014-2015 </h4>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
