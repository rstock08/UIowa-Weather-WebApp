<%-- 
    Document   : login
    Created on : Apr 17, 2018, 12:44:45 AM
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
        <title>Login Form</title>
        <link rel='stylesheet' href='css/style.css'>
    </head>
    <body>
        
        <header>
            <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
        </header>
        
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="#change 1">Change 1</a></li>
          <li><a href="#change 2">Change 2</a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
        </ul>
        
        
        <div class="login">
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
