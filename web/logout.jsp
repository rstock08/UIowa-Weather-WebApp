<%-- 
    Document   : logout
    Created on : Apr 17, 2018, 12:45:28 AM
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

String logPage, logSet;
if (session.getAttribute("email") != null) {
    session.setAttribute("email", null);
    session.invalidate();
    logPage = "index.jsp";
    logSet = "Login";
} else {
    logPage = "login.jsp";
    logSet = "Login";
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
          <li style="float:right"><a class="active" href="<%=logPage%>"><%=logSet%></a></li>
        </ul>
        
        <div class="createaccount">
            <form method="post" action="LoginServlet">
                <input type="text" placeholder="email" name="email" required>  
                <input type="password" placeholder="password" name="password" required>
                <br>
                <a href="createaccount.jsp" class="accountoption">Create Account</a>
                <br> 
                <a href="forgotpassword.jsp" class="accountoption">Forgot Password</a>
                <input type="submit" value="Sign In">
            </form>
        </div>
    </body>
</html>

