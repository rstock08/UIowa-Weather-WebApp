<%-- 
    Document   : Email results
    Created on : Apr 18, 2018, 11:35:37 PM
    Author     : ReedS
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">

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
        <title>Results</title>
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
        
        <div class="Results">
            <center>
                <h3><%=request.getAttribute("Message")%></h3>
            </center>
        </div>
    </body>
</html>

