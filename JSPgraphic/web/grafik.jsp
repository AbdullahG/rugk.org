<%-- 
    Document   : grafik
    Created on : Aug 24, 2015, 1:16:58 AM
    Author     : MuhammedAbdullah
--%>

<%@page import="com.sun.image.codec.jpeg.JPEGCodec"%>
<%@page import="com.sun.image.codec.jpeg.JPEGImageEncoder"%>
<%@page import="java.awt.Font"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ServletOutputStream sos = response.getOutputStream();
            response.reset();
            
           
           BufferedImage servletResim = new BufferedImage(500, 300, BufferedImage.TYPE_INT_RGB);
           Graphics2D graf = (Graphics2D) servletResim.getGraphics();
           
           graf.setColor(Color.GRAY);
           graf.fill3DRect(0, 0, 550, 300, true);
           
           Font font = new Font("TimesRoman",Font.BOLD,25);
           graf.setFont(font);
           graf.setColor(Color.BLACK);
           
           graf.drawString("BURASI BENIM GRAPH SAYFAM", 50, 30);
           graf.setColor(new Color(255,230,250));
           graf.drawString("BURASI BENIM GRAPH SAYFAM", 48, 28);
           graf.setColor(Color.WHITE);
           graf.drawRect(50, 70, 60, 60);
           graf.fillRect(50, 170, 80, 60);
           graf.drawOval(200, 70, 60, 60);
           graf.fillOval(200, 170, 120, 80);
           graf.drawLine(350, 100, 500, 220);
           graf.drawLine(350, 220, 500, 100);
           JPEGImageEncoder encode = JPEGCodec.createJPEGEncoder(sos);
           encode.encode(servletResim);
           sos.close();
            %>
    </body>
</html>
