<%-- 
    Document   : location
    Created on : Apr 17, 2018, 8:47:24 PM
    Author     : tristan
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!DOCTYPE html>
<html lang="en">
<head>
<style>      
    table, th, td{
        padding: 12px;
        border: 1px solid black;
    }
    nav {
        padding-left: 15px;
        padding-bottom: 15px;
        color: white;
        background-color: #333;
    }
    .grid-container {
        display: grid;
        grid-template-columns: auto auto auto;
        background-color: #FFF;
        padding: 10px;
    }
    .weather-container {
        border-style: solid;
        border-width: 1px;
        display: grid;
        grid-template-columns: auto auto;
        background-color: #FFF;
        padding: 10px;
    }
    .item1{
        grid-row: 1 / 7;
        padding-right: 10px;
    }
    .dropbtn {
        display: inline-block;
        float: right;
        font: 12px/1 sans-serif;
        text-decoration: none;
        top: 5px;
        transition: color .4s;
        background-color: #37a69b;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }
    .dropdown {
        float: right;
        display: inline-block;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-content a:hover {background-color: #ddd}
    .dropdown:hover .dropdown-content {
        display: block;
    }
    .dropdown:hover .dropbtn {
        background-color: #37a69b;
    }
    #hourly {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    #hourly td, #hourly th {
        border: 1px solid #ddd;
        padding: 8px;
    }
    #hourly tr:nth-child(even){background-color: #f2f2f2;}
    #hourly tr:hover {background-color: #ddd;}
    #hourly th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #37a69b;
        color: white;
    }
    #summary {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location</title>
    <link rel='stylesheet' href='css/style.css'>
</head>
<body>
    <header>
        <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
    </header>
    
    <ul>
        <li><a href="index.html">Home</a></li>
        <li style="float:right"><a class="active" href="account.jsp">Account</a></li>
        <li style="float:right"><a class="active" href="login.jsp">Login</a></li>
    </ul>
    
    <div class="topnav">
        <a id="todayDate"></a>
        <div class="search-container">
            <input id="location" type="text" placeholder="Search Location.." name="location">
            <button>Search</button>
        </div>
        <div class="dropdown">
            <button style="float:right" class="dropbtn">Saved Locations</button> 
            <%
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb","root","root");
            
            Statement slStatement = connection.createStatement();
            ResultSet slresultset = slStatement.executeQuery("select * from savedlocations");
            
            while(slresultset.next()){
            %>
            <div class="dropdown-content">
                <a><%= slresultset.getString(1) %></a>
                <a><%= slresultset.getString(2) %></a>
                <a><%= slresultset.getString(3) %></a>
                <a class="active" href="locmanagement.jsp">EDIT</a>
            </div>
            <%
            }
            %>
        </div>
    </div>
    <div class="grid-container" id="summary" action="LocationServlet">
        <div class="grid-item">
        <div class="weather-container">
            <div class="loc">
                <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
            </div> 
            <%  
            Statement displaystatement = connection.createStatement();
            String displaycommand = "Select location, temperature, humidity, feelslike, wind, pressure from weather"; //where location=?
            ResultSet displayresultset = displaystatement.executeQuery(displaycommand);

            while(displayresultset.next()){ 
            %>
            <div class="loc">            
                <a><%= displayresultset.getString(1) %></a>
            </div>
            <div class="temp"> 
                <a><%= displayresultset.getString(2) %></a>            
            </div>
            <div class="humidity">             
                <a><%= displayresultset.getString(3) %></a>
            </div>
            <div class="feelslike">             
                <a><%= displayresultset.getString(4) %></a>
            </div>
            <div class="wind">             
                <a><%= displayresultset.getString(5) %></a>
            </div>
            <div class="pressure">             
                <a><%= displayresultset.getString(6) %></a>
            </div>
            <%
            }
            %>
        </div>
        </div>
  
        <div class="grid-item">
        <table id="hourly">
            <tr>
                <th>Time</th>
                <th>Temperature</th>            
                <th>Humidity</th>
                <th>Feels Like</th>
                <th>Wind</th>
                <th>Pressure</th>
            </tr>
            <%
            Statement statement = connection.createStatement();
            String command = "Select time, temperature, humidity, feelslike, wind, pressure from weather where location=?";
            ResultSet resultset = statement.executeQuery(command);
            
            int i = 0; 
            for(int row=1; row <= 24; row++) { %>
            <tr>
                <td><%= resultset.getString(1+i) %></td>
                <td><%= resultset.getString(2+i) %></td>
                <td><%= resultset.getString(3+i) %></td>
                <td><%= resultset.getString(4+i) %></td>
                <td><%= resultset.getString(5+i) %></td>
                <td><%= resultset.getString(6+i) %></td>
            </tr>
            <%i+=6; 
            }%>
        </table>
        </div>
    </div>
    <script>
        var d = new Date();
        document.getElementById("todayDate").innerHTML = String(d.getDate())+"-"+String(d.getMonth()+1)+"-"+String(d.getFullYear());
    </script>
</body>
</html>