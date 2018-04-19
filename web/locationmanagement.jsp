<%-- 
    Document   : locationmanagement.jsp
    Created on : Apr 19, 2018, 12:46:46 PM
    Author     : tristan
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
        #locations {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #locations td, #locations th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #locations tr:nth-child(even){background-color: #f2f2f2;}
        #locations tr:hover {background-color: #ddd;}
        #locations th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #37a69b;
            color: white;
        }
.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #37a69b;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
    </style>
        <title>Location Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='css/style.css'>
    </head>
<body>
    <header>
        <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
    </header>
    
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="location.jsp">Hourly</a></li>
        <li style="float:right"><a class="active" href="account.jsp">Account</a></li>
        <li style="float:right"><a class="active" href="login.jsp">Login</a></li>
    </ul>

    <div class="topnav">
        <a id="todayDate"></a>
        <div class="search-container">
            <input id="locationEntry" type="text" placeholder="Search Location.." name="search">
            <button onclick="varLocation=locationEntry">Search</button>
        </div>
    </div>

    <table id="locations">
        <tr>
            <th>Location</th>
            <th>Action</th>
        </tr>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb?","root","");
            
        // need to specify which user we are getting the saved locations from
        Statement slStatement = connection.createStatement();
        ResultSet slresultset = slStatement.executeQuery("select * from savedlocations");
            
        while(slresultset.next()){
        %>
        <tr>
            <td><a>Searched Location</a></td>
            <td><button>Add Location</button></td>
        </tr>
        <tr>
            <td><a><%= slresultset.getString(1) %></a></td>
            <td><button>Remove Location</button></td> 
        </tr>  
        <tr>
            <td><a><%= slresultset.getString(2) %></a></td>
            <td><button>Remove Location</button></td> 
        </tr> 
        <tr>
            <td><a><%= slresultset.getString(3) %></a></td>
            <td><button>Remove Location</button></td> 
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
