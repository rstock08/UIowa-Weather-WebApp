<%-- 
    Document   : daily
    Created on : Apr 22, 2018, 3:24:29 PM
    Author     : tristan
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

<!DOCTYPE html>
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
    <title>Daily</title>
    <link rel='stylesheet' href='css/style.css'>
</head>
<body>
    <script>
        function changeDaily(zipInput){
            fetch('DailyServlet/?zip='+zipInput, {method: 'GET'})
            .then(function(res) {
                return res.json()
            })
            .then(function(data) {
                document.getElementById("savedLoc").innerHTML = data.location;
                document.getElementById("temperatureF").innerHTML = data.temperatureF;
                document.getElementById("temperatureC").innerHTML = data.temperatureC;
                document.getElementById("humidity").innerHTML = data.humidity;
                document.getElementById("feelslike").innerHTML = data.feelslike;
                document.getElementById("wind").innerHTML = data.wind;
                document.getElementById("pressure").innerHTML = data.pressure;
                
                document.getElementById("day1").innerHTML = data.day;
                document.getElementById("temperatureF1").innerHTML = data.temperatureF;
                document.getElementById("temperatureC1").innerHTML = data.temperatureC;
                document.getElementById("humidity1").innerHTML = data.humidity;
                document.getElementById("feelslike1").innerHTML = data.feelslike;
                document.getElementById("wind1").innerHTML = data.wind;
                document.getElementById("pressure1").innerHTML = data.pressure;
                
                document.getElementById("day2").innerHTML = data.day2;
                document.getElementById("temperatureF2").innerHTML = data.temperatureF2;
                document.getElementById("temperatureC2").innerHTML = data.temperatureC2;
                document.getElementById("humidity2").innerHTML = data.humidity2;
                document.getElementById("feelslike2").innerHTML = data.feelslike2;
                document.getElementById("wind2").innerHTML = data.wind2;
                document.getElementById("pressure2").innerHTML = data.pressure2;
                
                document.getElementById("day3").innerHTML = data.day3;
                document.getElementById("temperatureF3").innerHTML = data.temperatureF3;
                document.getElementById("temperatureC3").innerHTML = data.temperatureC3;
                document.getElementById("humidity3").innerHTML = data.humidity3;
                document.getElementById("feelslike3").innerHTML = data.feelslike3;
                document.getElementById("wind3").innerHTML = data.wind3;
                document.getElementById("pressure3").innerHTML = data.pressure3;
                
                document.getElementById("day4").innerHTML = data.day4;
                document.getElementById("temperatureF4").innerHTML = data.temperatureF4;
                document.getElementById("temperatureC4").innerHTML = data.temperatureC4;
                document.getElementById("humidity4").innerHTML = data.humidity4;
                document.getElementById("feelslike4").innerHTML = data.feelslike4;
                document.getElementById("wind4").innerHTML = data.wind4;
                document.getElementById("pressure4").innerHTML = data.pressure4;
                
                document.getElementById("day5").innerHTML = data.day5;
                document.getElementById("temperatureF5").innerHTML = data.temperatureF5;
                document.getElementById("temperatureC5").innerHTML = data.temperatureC5;
                document.getElementById("humidity5").innerHTML = data.humidity5;
                document.getElementById("feelslike5").innerHTML = data.feelslike5;
                document.getElementById("wind5").innerHTML = data.wind5;
                document.getElementById("pressure5").innerHTML = data.pressure5;
                
                document.getElementById("day6").innerHTML = data.day6;
                document.getElementById("temperatureF6").innerHTML = data.temperatureF6;
                document.getElementById("temperatureC6").innerHTML = data.temperatureC6;
                document.getElementById("humidity6").innerHTML = data.humidity6;
                document.getElementById("feelslike6").innerHTML = data.feelslike6;
                document.getElementById("wind6").innerHTML = data.wind6;
                document.getElementById("pressure6").innerHTML = data.pressure6;
                
                document.getElementById("day7").innerHTML = data.day7;
                document.getElementById("temperatureF7").innerHTML = data.temperatureF7;
                document.getElementById("temperatureC7").innerHTML = data.temperatureC7;
                document.getElementById("humidity7").innerHTML = data.humidity7;
                document.getElementById("feelslike7").innerHTML = data.feelslike7;
                document.getElementById("wind7").innerHTML = data.wind7;
                document.getElementById("pressure7").innerHTML = data.pressure7;
                
                console.log(data)
            })
        }
    </script>
    <header>
        <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
    </header>
    
    <ul>
        <li><a class="active" href="daily.jsp">Daily</a></li>
        <li><a href="location.jsp">Hourly</a></li>
        <li style="float:right"><a href="<%=profilePage%>"><%=profileSet%></a></li>
        <li style="float:right"><a href="<%=logPage%>"><%=logSet%></a></li>
    </ul>
    
    <div class="topnav">
        <a id="todayDate"></a>
        <div class="search-container">
            <input id="zipcode" type="text" placeholder="Search Zipcode.." name="zipcode">
            <button onclick="changeDaily(document.getElementById('zipcode').value)">Search</button>
        </div>
        <div class="dropdown">
            <button style="float:right" class="dropbtn">Saved Locations</button> 
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb?","root","");   
            
            // need to specify which user we are getting the saved locations from
            Statement slStatement = connection.createStatement();
            ResultSet slresultset = null; 
            if(session.getAttribute("email") != null){
                slresultset = slStatement.executeQuery("select location1, location2, location3 from account where email='" + session.getAttribute("email") + "'"); 
            }
            // populate saved locations bar on top of screen
            while(slresultset != null && slresultset.next()){ 
            %>
            <div class="dropdown-content">
                <a onclick="changeDaily('<%= slresultset.getString(1) %>')"><%= slresultset.getString(1) %></a>
                <a onclick="changeDaily('<%= slresultset.getString(2) %>')"><%= slresultset.getString(2) %></a>
                <a onclick="changeDaily('<%= slresultset.getString(3) %>')"><%= slresultset.getString(3) %></a>
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
                <img src="images/weatherthumbnail.jpg" alt="weather thumbnail" >
            </div> 
            <%  
            // set default location to savedlocation1
            ResultSet defaultresultset = slStatement.executeQuery("select location1 from account where email='" + session.getAttribute("email") + "'");
            
            // initialize variable
            String varZip = "'52246'";
            // check if there is a saved location
            if(defaultresultset.next()){
                // default location
                varZip = defaultresultset.getString(1);
            }
            Statement displaystatement = connection.createStatement();
            // need to introduce a time variable that can be used here to get the current 
            // times weather for the display area
            String displaycommand = "Select location, temperatureF, temperatureC, humidity, feelslike, wind, pressure from daily where zip="+ varZip +" and day='Mon'"; 
            ResultSet displayresultset = displaystatement.executeQuery(displaycommand);
            
            // populate current weather for display found on lefthand side of screen
            if(displayresultset.next()){ 
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
                <th>Day</th>
                <th>TemperatureF</th>  
                <th>TemperatureC</th> 
                <th>Humidity</th>
                <th>Feels Like</th>
                <th>Wind</th>
                <th>Pressure</th>
            </tr>
            <%
            Statement statement = connection.createStatement();
            String command = "Select day, temperatureF, temperatureC, humidity, feelslike, wind, pressure from daily where zip=" + varZip;
            ResultSet resultset = statement.executeQuery(command);
            
            // populate hourly weather table
            // need to find way to order so weather starts at current hour
            // and then proceeds 24 hours forward even if that is the next day
            if(resultset.next()){ %>
            <tr>
                <td id='day1'><%= resultset.getString(1) %></td>
                <td id='temperatureF1'><%= resultset.getString(2) %></td>
                <td id='temperatureC1'><%= resultset.getString(3) %></td>
                <td id='humidity1'><%= resultset.getString(4) %></td>
                <td id='feelslike1'><%= resultset.getString(5) %></td>
                <td id='wind1'><%= resultset.getString(6) %></td>
                <td id='pressure1'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='day2'><%= resultset.getString(1) %></td>
                <td id='temperatureF2'><%= resultset.getString(2) %></td>
                <td id='temperatureC2'><%= resultset.getString(3) %></td>
                <td id='humidity2'><%= resultset.getString(4) %></td>
                <td id='feelslike2'><%= resultset.getString(5) %></td>
                <td id='wind2'><%= resultset.getString(6) %></td>
                <td id='pressure2'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='day3'><%= resultset.getString(1) %></td>
                <td id='temperatureF3'><%= resultset.getString(2) %></td>
                <td id='temperatureC3'><%= resultset.getString(3) %></td>
                <td id='humidity3'><%= resultset.getString(4) %></td>
                <td id='feelslike3'><%= resultset.getString(5) %></td>
                <td id='wind3'><%= resultset.getString(6) %></td>
                <td id='pressure3'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='day4'><%= resultset.getString(1) %></td>
                <td id='temperatureF4'><%= resultset.getString(2) %></td>
                <td id='temperatureC4'><%= resultset.getString(3) %></td>
                <td id='humidity4'><%= resultset.getString(4) %></td>
                <td id='feelslike4'><%= resultset.getString(5) %></td>
                <td id='wind4'><%= resultset.getString(6) %></td>
                <td id='pressure4'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='day5'><%= resultset.getString(1) %></td>
                <td id='temperatureF5'><%= resultset.getString(2) %></td>
                <td id='temperatureC5'><%= resultset.getString(3) %></td>
                <td id='humidity5'><%= resultset.getString(4) %></td>
                <td id='feelslike5'><%= resultset.getString(5) %></td>
                <td id='wind5'><%= resultset.getString(6) %></td>
                <td id='pressure5'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='day6'><%= resultset.getString(1) %></td>
                <td id='temperatureF6'><%= resultset.getString(2) %></td>
                <td id='temperatureC6'><%= resultset.getString(3) %></td>
                <td id='humidity6'><%= resultset.getString(4) %></td>
                <td id='feelslike6'><%= resultset.getString(5) %></td>
                <td id='wind6'><%= resultset.getString(6) %></td>
                <td id='pressure6'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='day7'><%= resultset.getString(1) %></td>
                <td id='temperatureF7'><%= resultset.getString(2) %></td>
                <td id='temperatureC7'><%= resultset.getString(3) %></td>
                <td id='humidity7'><%= resultset.getString(4) %></td>
                <td id='feelslike7'><%= resultset.getString(5) %></td>
                <td id='wind7'><%= resultset.getString(6) %></td>
                <td id='pressure7'><%= resultset.getString(7) %></td>
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
