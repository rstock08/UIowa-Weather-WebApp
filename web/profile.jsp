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
    if (session.getAttribute("type").equals("admin")){
        profilePage = "admin.jsp";
        profileSet = "Admin";
        logPage = "logout.jsp";
        logSet = "Logout";
    } else {
        profilePage = "profile.jsp";
        profileSet = "Profile";
        logPage = "logout.jsp";
        logSet = "Logout";
    }
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
          <li><a href="daily.jsp">Daily</a></li>
          <li><a href="location.jsp">Hourly</a></li>
          <li style="float:right"><a class="active" href="<%=profilePage%>"><%=profileSet%></a></li>
          <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
          
        </ul>

        <div class="updatepass">
            <form method="post" action="UpdatePassServlet">
                <input type="password" placeholder="Password" name="password"  required>
                <input type="submit" value="Update Password">
            </form>
        </div>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb?","root","");
            
        // need to specify which user we are getting the saved locations from
        Statement slStatement = connection.createStatement();
        ResultSet slresultset = slStatement.executeQuery("select loc1, loc2, loc3 from login where email='" + session.getAttribute("email") + "'");
            
		while(slresultset.next())
		{
        %>

		<div class="addlocation">
            <form id="addlocationform" method="post" action="AddLocationServlet">
                <input  type="text" placeholder="Zipcode" name="zipcode" required>
				<input type = "hidden" name = "email" value ="<%= session.getAttribute("email") %>">
				<input type = "hidden" name = "loc1" value ="<%= slresultset.getString(1) %>">
				<input type = "hidden" name = "loc2" value ="<%= slresultset.getString(2) %>">
				<input type = "hidden" name = "loc3" value ="<%= slresultset.getString(3) %>">
                <input type="submit" value="Add Location">
            </form>
		</div>  
		
		<div class="locations">        
			<table id="locations">
				<tr>
					<th>Location</th>
					<th>Action</th>
				</tr>

				<tr>
					<td>
						<a><%= slresultset.getString(1) %></a>
					</td>
					<%--<td><button>Remove Location</button></td> --%>
					<td>
						<form id="<%= slresultset.getString(1) %>" action="DeleteSavedLocation" method="Post">
							<input type="hidden" name="location" value="loc1"></input>
							<input type="hidden" name="email" value="<%= session.getAttribute("email") %>"></input>
							<button type="submit" value="Submit">Remove Location</button>
						</form>
					</td>
				</tr>
				<tr>
					<td><a><%= slresultset.getString(2) %></a></td>
					<td>
						<form id="<%= slresultset.getString(2) %>" action="DeleteSavedLocation" method="Post">
							<input type="hidden" name="location" value="loc2"></input>
							<input type="hidden" name="email" value="<%= session.getAttribute("email") %>"></input>
							<button type="submit" value="Submit">Remove Location</button>
						</form>
					</td>
				</tr>  
				<tr>
					<td><a><%= slresultset.getString(3) %></a></td>
					<td>
						<form id="<%= slresultset.getString(3) %>" action="DeleteSavedLocation" method="Post">
							<input type="hidden" name="location" value="loc3"></input>
							<input type="hidden" name="email" value="<%= session.getAttribute("email") %>"></input>
							<button type="submit" value="Submit">Remove Location</button>
						</form>
					</td>
				</tr>  
			</table>  <%--THIS IS NEW--%>
		</div>  <%--THIS IS NEW--%>

        <%
		}
		%>
       
    <%--</table> WRONG LOCATION--%>
    <script>
        var d = new Date();
        document.getElementById("todayDate").innerHTML = String(d.getMonth()+1)+"-"+String(d.getDate())+"-"+String(d.getFullYear());
    </script>
    </body>
</html>
