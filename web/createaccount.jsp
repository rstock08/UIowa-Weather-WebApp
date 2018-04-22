<%-- 
    Document   : createaccount
    Created on : Apr 17, 2018, 12:52:00 AM
    Author     : ReedS
--%>

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
        <title>Login Form</title>
        <link rel='stylesheet' href='css/style.css'>
    </head>
    <body>
        
        <header>
            <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
        </header>
        
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="location.jsp">Hourly</a></li>
          <li style="float:right"><a href="<%=profilePage%>"><%=profileSet%></a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
        </ul>
        
        <div class="createaccount">
            <form method="post" action="CreateAccServlet">
                <input type="text" placeholder="email" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <input type="text" placeholder="First Name" name="fname" required>
                <input type="text" placeholder="Last Name" name="lname" required>
                <input type="text" placeholder="Zip Code" name="zip" required>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>
