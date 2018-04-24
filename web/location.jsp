<%-- 
    Document   : location
    Created on : Apr 17, 2018, 8:47:24 PM
    Author     : tristan
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


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


<html lang="en">
<head>
<style>      
    table, th, td{
        padding: 1px;
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
        grid-row: 1 / 8;
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
  margin-top: 4px;
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
    
    
    
    <script>
        function changeLoc(zipInput){
            fetch('LocationServlet/?zip='+zipInput, {method: 'GET'})
            .then(function(res) {
                return res.json()
                //console.log(res)
            })
            .then(function(data) {
                // do something with returned data
                document.getElementById("savedLoc").innerHTML = data.location;
                document.getElementById("time").innerHTML = data.time;
                document.getElementById("temperatureF").innerHTML = data.temperatureF;
                document.getElementById("temperatureC").innerHTML = data.temperatureC;
                document.getElementById("humidity").innerHTML = data.humidity;
                document.getElementById("feelslike").innerHTML = data.feelslike;
                document.getElementById("wind").innerHTML = data.wind;
                document.getElementById("pressure").innerHTML = data.pressure;
                console.log(data)
            })
        }
    </script>
    <header>
        <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
    </header>
    
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="location.jsp">Hourly</a></li>
      <li style="float:right"><a class="active" href="<%=profilePage%>"><%=profileSet%></a></li>
      <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>

    </ul>
    
    <div class="topnav">
        <a id="todayDate"></a>
        <div class="search-container">
            <input id="zipcode" type="text" placeholder="Search Zipcode.." name="zipcode">
            <button onclick="changeLoc(document.getElementById('zipcode').value)">Search</button>
        </div>
        <div class="dropdown">
            <button style="float:right" class="dropbtn">Saved Locations</button> 
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb?","root","");
            
            // default location
            String varZip = "'54855'";
            
            // need to specify which user we are getting the saved locations from
            Statement slStatement = connection.createStatement();
            ResultSet slresultset = slStatement.executeQuery("select * from savedlocations");
            
            // populate saved locations bar on top of screen
            while(slresultset.next()){
            %>
            <div class="dropdown-content">
                <!-- need to make it so when these are clicked the varLocation
                     variable gets set to the contents of slresultset.getString(x)
                -->
                <a onclick="changeLoc('<%= slresultset.getString(1) %>')"><%= slresultset.getString(1) %></a>
                <a onclick="changeLoc('<%= slresultset.getString(2) %>')"><%= slresultset.getString(2) %></a>
                <a onclick="changeLoc('<%= slresultset.getString(3) %>')"><%= slresultset.getString(3) %></a>
                <a class="active" href="locationmanagement.jsp">EDIT</a>
            </div>
            <%
            }
            %>
        </div>
    </div>
    <div class="grid-container" id="summary">
        <div class="grid-item">
        <div class="weather-container">
            <div>
                <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
            </div> 
            <%  
            Statement displaystatement = connection.createStatement();
            // need to introduce a time variable that can be used here to get the current 
            // times weather for the display area
            String displaycommand = "Select location, temperatureF, temperatureC, humidity, feelslike, wind, pressure from weather where zip="+ varZip +" and time='1:00AM'"; 
            ResultSet displayresultset = displaystatement.executeQuery(displaycommand);
            
            // populate current weather for display found on lefthand side of screen
            while(displayresultset.next()){ 
            %>
            <table id="hourly">
                <tr><td id='savedLoc'><%= displayresultset.getString(1) %></td></tr>
                <tr><td id='temperatureF'><%= displayresultset.getString(2) %></td></tr>
                <tr><td id='temperatureC'><%= displayresultset.getString(3)%>
                <tr><td id='humidity'><%= displayresultset.getString(4) %></td></tr>
                <tr><td id='feelslike'><%= displayresultset.getString(5) %></td></tr>
                <tr><td id='wind'><%= displayresultset.getString(6) %></td></tr>
                <tr><td id='pressure'><%= displayresultset.getString(7) %></td></tr>
            </table>
            <%
            }
            %>
        </div>
        </div>
  
        <div class="grid-item">
        <table id="hourly">
            <tr>
                <th>Time</th>
                <th>TemperatureF</th>  
                <th>TemperatureC</th> 
                <th>Humidity</th>
                <th>Feels Like</th>
                <th>Wind</th>
                <th>Pressure</th>
            </tr>
            <%
            Statement statement = connection.createStatement();
            String command = "Select time, temperatureF, temperatureC, humidity, feelslike, wind, pressure from weather where zip=" + varZip;
            ResultSet resultset = statement.executeQuery(command);
            
            // populate hourly weather table
            // need to find way to order so weather starts at current hour
            // and then proceeds 24 hours forward even if that is the next day
            while(resultset.next()){ %>
            <tr>
                <td id='time'><%= resultset.getString(1) %></td>
                <td id='temperatureF'><%= resultset.getString(2) %></td>
                <td id='temperatureC'><%= resultset.getString(3) %></td>
                <td id='humidity'><%= resultset.getString(4) %></td>
                <td id='feelslike'><%= resultset.getString(5) %></td>
                <td id='wind'><%= resultset.getString(6) %></td>
                <td id='pressure'><%= resultset.getString(7) %></td>
            </tr>
            <%}%>
        </table>
        </div>
    </div>
    <script>
        var d = new Date();
        document.getElementById("todayDate").innerHTML = String(d.getMonth()+1)+"-"+String(d.getDate())+"-"+String(d.getFullYear());
    </script>
    <script>
        // get current hour (0-23) and add 1 to get readable hour
        var d2 = new Date();
        time = d2.getHours() + 1;
        // create string for time ex. "1:00AM"
        timeAMPM = String(time)+":00AM";
        // if time is greater than 12 it is in the afternoon
        if(time > 12){
            time = time - 12;
            AMPM = String(time)+":00PM";
        }
    </script>
</body>
</html>
