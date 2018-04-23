<%@ page import="java.sql.*" %>
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
if(session.getAttribute("type") == "admin"){
    
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
          <li style="float:right"><a class="active" href="<%=profilePage%>"><%=profileSet%></a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
        </ul>

        <div class="updatepass">
            <form method="post" action="UpdatePassServlet">
                <input type="password" placeholder="Password" name="password" required>
                <input type="submit" value="Submit">
            </form>
        </div>
        <div class="addlocation">
            <form method="post" action="AddLocationServlet">
                <input type="text" placeholder="Zipcode" name="zipcode" required>
                <input type="text" placeholder="State" name="state" required>
                <input type="text" placeholder="City" name="city" required>
                <input type="submit" value="Submit">
             </form>
        </div>
        <table id="locations">
        <tr>
            <th>Location</th>
            <th>Action</th>
        </tr>

<!--        <tr>
            <td><a>Searched Location</a></td>
            <td><button>Add Location</button></td>
        </tr> -->        
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb?","root","");
            
        // need to specify which user we are getting the saved locations from
        Statement slStatement = connection.createStatement();
        ResultSet slresultset = slStatement.executeQuery("select * from savedlocations");
            
        while(slresultset.next()){
        %>

        <tr>
            <td><a><%= slresultset.getString(1) %>   <%= slresultset.getString(2) %> <%= slresultset.getString(3) %></a></td>
            <%--<td><button>Remove Location</button></td> --%>
            <td><form id="<%= slresultset.getString(1) %>" action="DeleteSavedLocation" method="Post"><input type="hidden" name="zipcode" value="<%= slresultset.getString(1) %>"></input><button type="submit" value="Submit">Remove Location</button></form></td>
        </tr>  
        <%}
        %>
    </table>
    <script>
        var d = new Date();
        document.getElementById("todayDate").innerHTML = String(d.getMonth()+1)+"-"+String(d.getDate())+"-"+String(d.getFullYear());
    </script>
    </body>
</html>

