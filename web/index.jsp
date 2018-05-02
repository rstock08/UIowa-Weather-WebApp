<%-- 
    Document   : index
    Created on : Apr 12, 2018, 4:44:25 PM
    Author     : ReedS
--%>

<%@page import="javax.mail.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%      
String logPage, logSet, profilePage, profileSet;
if (session.getAttribute("email") != null) {
    profilePage = "profile.jsp";
    profileSet = "Profile";
    logPage = "logout.jsp";
    logSet = "Logout";
} else {
    logPage = "login.jsp";
    logSet = "Login";
    profilePage = "";
    profileSet = "";
}
%>

<html>
    <head>
        <title>Weather Web Service</title>
        <link rel='stylesheet' href='css/style.css'>
    </head>

    <body>
        
        <header>
            <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
        </header>
        
        <ul>
          <li><a class="active" href="index.jsp">Home</a></li>
          <li><a href="location.jsp">Hourly</a></li>
          <li style="float:right"><a href="<%=profilePage%>"><%=profileSet%></a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
        </ul>

    </body>
</html>
