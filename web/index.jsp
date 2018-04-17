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
String logPage, logSet;
if (session.getAttribute("email") != null) {
    //accountText = session.getAttribute("userEmail").toString();
    logPage = "logout.jsp";
    logSet = "Logout";
} else {
    //accountText = "My Account";
    logPage = "login.jsp";
    logSet = "Login";
    //profilePage = "login.jsp";
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
          <li><a href="#change 1">Change 1</a></li>
          <li><a href="#change 2">Change 2</a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
        </ul>

    </body>
</html>
