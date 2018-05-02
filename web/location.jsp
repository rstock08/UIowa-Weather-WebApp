<%-- 
    Document   : location
    Created on : Apr 17, 2018, 8:47:24 PM
    Author     : tristan
--%>

<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
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
                return res.json();
            })
            .then(function(data) {
                document.getElementById("savedLoc").innerHTML = data.location;
                document.getElementById("temperatureF").innerHTML = data.temperatureF;
                document.getElementById("temperatureC").innerHTML = data.temperatureC;
                document.getElementById("humidity").innerHTML = data.humidity;
                document.getElementById("feelslike").innerHTML = data.feelslike;
                document.getElementById("wind").innerHTML = data.wind;
                document.getElementById("pressure").innerHTML = data.pressure;
                
                document.getElementById("time1").innerHTML = data.time;
                document.getElementById("temperatureF1").innerHTML = data.temperatureF;
                document.getElementById("temperatureC1").innerHTML = data.temperatureC;
                document.getElementById("humidity1").innerHTML = data.humidity;
                document.getElementById("feelslike1").innerHTML = data.feelslike;
                document.getElementById("wind1").innerHTML = data.wind;
                document.getElementById("pressure1").innerHTML = data.pressure;
                
                document.getElementById("time2").innerHTML = data.time2;
                document.getElementById("temperatureF2").innerHTML = data.temperatureF2;
                document.getElementById("temperatureC2").innerHTML = data.temperatureC2;
                document.getElementById("humidity2").innerHTML = data.humidity2;
                document.getElementById("feelslike2").innerHTML = data.feelslike2;
                document.getElementById("wind2").innerHTML = data.wind2;
                document.getElementById("pressure2").innerHTML = data.pressure2;
                
                document.getElementById("time3").innerHTML = data.time3;
                document.getElementById("temperatureF3").innerHTML = data.temperatureF3;
                document.getElementById("temperatureC3").innerHTML = data.temperatureC3;
                document.getElementById("humidity3").innerHTML = data.humidity3;
                document.getElementById("feelslike3").innerHTML = data.feelslike3;
                document.getElementById("wind3").innerHTML = data.wind3;
                document.getElementById("pressure3").innerHTML = data.pressure3;
                
                document.getElementById("time4").innerHTML = data.time4;
                document.getElementById("temperatureF4").innerHTML = data.temperatureF4;
                document.getElementById("temperatureC4").innerHTML = data.temperatureC4;
                document.getElementById("humidity4").innerHTML = data.humidity4;
                document.getElementById("feelslike4").innerHTML = data.feelslike4;
                document.getElementById("wind4").innerHTML = data.wind4;
                document.getElementById("pressure4").innerHTML = data.pressure4;
                
                document.getElementById("time5").innerHTML = data.time5;
                document.getElementById("temperatureF5").innerHTML = data.temperatureF5;
                document.getElementById("temperatureC5").innerHTML = data.temperatureC5;
                document.getElementById("humidity5").innerHTML = data.humidity5;
                document.getElementById("feelslike5").innerHTML = data.feelslike5;
                document.getElementById("wind5").innerHTML = data.wind5;
                document.getElementById("pressure5").innerHTML = data.pressure5;
                
                document.getElementById("time6").innerHTML = data.time6;
                document.getElementById("temperatureF6").innerHTML = data.temperatureF6;
                document.getElementById("temperatureC6").innerHTML = data.temperatureC6;
                document.getElementById("humidity6").innerHTML = data.humidity6;
                document.getElementById("feelslike6").innerHTML = data.feelslike6;
                document.getElementById("wind6").innerHTML = data.wind6;
                document.getElementById("pressure6").innerHTML = data.pressure6;
                
                document.getElementById("time7").innerHTML = data.time7;
                document.getElementById("temperatureF7").innerHTML = data.temperatureF7;
                document.getElementById("temperatureC7").innerHTML = data.temperatureC7;
                document.getElementById("humidity7").innerHTML = data.humidity7;
                document.getElementById("feelslike7").innerHTML = data.feelslike7;
                document.getElementById("wind7").innerHTML = data.wind7;
                document.getElementById("pressure7").innerHTML = data.pressure7;
                
                document.getElementById("time8").innerHTML = data.time8;
                document.getElementById("temperatureF8").innerHTML = data.temperatureF8;
                document.getElementById("temperatureC8").innerHTML = data.temperatureC8;
                document.getElementById("humidity8").innerHTML = data.humidity8;
                document.getElementById("feelslike8").innerHTML = data.feelslike8;
                document.getElementById("wind8").innerHTML = data.wind8;
                document.getElementById("pressure8").innerHTML = data.pressure8;
                
                document.getElementById("time9").innerHTML = data.time9;
                document.getElementById("temperatureF9").innerHTML = data.temperatureF9;
                document.getElementById("temperatureC9").innerHTML = data.temperatureC9;
                document.getElementById("humidity9").innerHTML = data.humidity9;
                document.getElementById("feelslike9").innerHTML = data.feelslike9;
                document.getElementById("wind9").innerHTML = data.wind9;
                document.getElementById("pressure9").innerHTML = data.pressure9;
                
                document.getElementById("time10").innerHTML = data.time10;
                document.getElementById("temperatureF10").innerHTML = data.temperatureF10;
                document.getElementById("temperatureC10").innerHTML = data.temperatureC10;
                document.getElementById("humidity10").innerHTML = data.humidity10;
                document.getElementById("feelslike10").innerHTML = data.feelslike10;
                document.getElementById("wind10").innerHTML = data.wind10;
                document.getElementById("pressure10").innerHTML = data.pressure10;
                
                document.getElementById("time11").innerHTML = data.time11;
                document.getElementById("temperatureF11").innerHTML = data.temperatureF11;
                document.getElementById("temperatureC11").innerHTML = data.temperatureC11;
                document.getElementById("humidity11").innerHTML = data.humidity11;
                document.getElementById("feelslike11").innerHTML = data.feelslike11;
                document.getElementById("wind11").innerHTML = data.wind11;
                document.getElementById("pressure11").innerHTML = data.pressure11;
                
                document.getElementById("time12").innerHTML = data.time12;
                document.getElementById("temperatureF12").innerHTML = data.temperatureF12;
                document.getElementById("temperatureC12").innerHTML = data.temperatureC12;
                document.getElementById("humidity12").innerHTML = data.humidity12;
                document.getElementById("feelslike12").innerHTML = data.feelslike12;
                document.getElementById("wind12").innerHTML = data.wind12;
                document.getElementById("pressure12").innerHTML = data.pressure12;
                
                document.getElementById("time13").innerHTML = data.time13;
                document.getElementById("temperatureF13").innerHTML = data.temperatureF13;
                document.getElementById("temperatureC13").innerHTML = data.temperatureC13;
                document.getElementById("humidity13").innerHTML = data.humidity13;
                document.getElementById("feelslike13").innerHTML = data.feelslike13;
                document.getElementById("wind13").innerHTML = data.wind13;
                document.getElementById("pressure13").innerHTML = data.pressure13;
                
                document.getElementById("time14").innerHTML = data.time14;
                document.getElementById("temperatureF14").innerHTML = data.temperatureF14;
                document.getElementById("temperatureC14").innerHTML = data.temperatureC14;
                document.getElementById("humidity14").innerHTML = data.humidity14;
                document.getElementById("feelslike14").innerHTML = data.feelslike14;
                document.getElementById("wind14").innerHTML = data.wind14;
                document.getElementById("pressure14").innerHTML = data.pressure14;
                
                document.getElementById("time15").innerHTML = data.time15;
                document.getElementById("temperatureF15").innerHTML = data.temperatureF15;
                document.getElementById("temperatureC15").innerHTML = data.temperatureC15;
                document.getElementById("humidity15").innerHTML = data.humidity15;
                document.getElementById("feelslike15").innerHTML = data.feelslike15;
                document.getElementById("wind15").innerHTML = data.wind15;
                document.getElementById("pressure15").innerHTML = data.pressure15;
                
                document.getElementById("time16").innerHTML = data.time16;
                document.getElementById("temperatureF16").innerHTML = data.temperatureF16;
                document.getElementById("temperatureC16").innerHTML = data.temperatureC16;
                document.getElementById("humidity16").innerHTML = data.humidity16;
                document.getElementById("feelslike16").innerHTML = data.feelslike16;
                document.getElementById("wind16").innerHTML = data.wind16;
                document.getElementById("pressure16").innerHTML = data.pressure16;
                
                document.getElementById("time17").innerHTML = data.time17;
                document.getElementById("temperatureF17").innerHTML = data.temperatureF17;
                document.getElementById("temperatureC17").innerHTML = data.temperatureC17;
                document.getElementById("humidity17").innerHTML = data.humidity17;
                document.getElementById("feelslike17").innerHTML = data.feelslike17;
                document.getElementById("wind17").innerHTML = data.wind17;
                document.getElementById("pressure17").innerHTML = data.pressure17;
                
                document.getElementById("time18").innerHTML = data.time18;
                document.getElementById("temperatureF18").innerHTML = data.temperatureF18;
                document.getElementById("temperatureC18").innerHTML = data.temperatureC18;
                document.getElementById("humidity18").innerHTML = data.humidity18;
                document.getElementById("feelslike18").innerHTML = data.feelslike18;
                document.getElementById("wind18").innerHTML = data.wind18;
                document.getElementById("pressure18").innerHTML = data.pressure18;
                
                document.getElementById("time19").innerHTML = data.time19;
                document.getElementById("temperatureF19").innerHTML = data.temperatureF19;
                document.getElementById("temperatureC19").innerHTML = data.temperatureC19;
                document.getElementById("humidity19").innerHTML = data.humidity19;
                document.getElementById("feelslike19").innerHTML = data.feelslike19;
                document.getElementById("wind19").innerHTML = data.wind19;
                document.getElementById("pressure19").innerHTML = data.pressure19;
                
                document.getElementById("time20").innerHTML = data.time20;
                document.getElementById("temperatureF20").innerHTML = data.temperatureF20;
                document.getElementById("temperatureC20").innerHTML = data.temperatureC20;
                document.getElementById("humidity20").innerHTML = data.humidity20;
                document.getElementById("feelslike20").innerHTML = data.feelslike20;
                document.getElementById("wind20").innerHTML = data.wind20;
                document.getElementById("pressure20").innerHTML = data.pressure20;
                
                document.getElementById("time21").innerHTML = data.time21;
                document.getElementById("temperatureF21").innerHTML = data.temperatureF21;
                document.getElementById("temperatureC21").innerHTML = data.temperatureC21;
                document.getElementById("humidity21").innerHTML = data.humidity21;
                document.getElementById("feelslike21").innerHTML = data.feelslike21;
                document.getElementById("wind21").innerHTML = data.wind21;
                document.getElementById("pressure21").innerHTML = data.pressure21;
                
                document.getElementById("time22").innerHTML = data.time22;
                document.getElementById("temperatureF22").innerHTML = data.temperatureF22;
                document.getElementById("temperatureC22").innerHTML = data.temperatureC22;
                document.getElementById("humidity22").innerHTML = data.humidity22;
                document.getElementById("feelslike22").innerHTML = data.feelslike22;
                document.getElementById("wind22").innerHTML = data.wind22;
                document.getElementById("pressure22").innerHTML = data.pressure22;
                
                document.getElementById("time23").innerHTML = data.time23;
                document.getElementById("temperatureF23").innerHTML = data.temperatureF23;
                document.getElementById("temperatureC23").innerHTML = data.temperatureC23;
                document.getElementById("humidity23").innerHTML = data.humidity23;
                document.getElementById("feelslike23").innerHTML = data.feelslike23;
                document.getElementById("wind23").innerHTML = data.wind23;
                document.getElementById("pressure23").innerHTML = data.pressure23;
                
                document.getElementById("time24").innerHTML = data.time24;
                document.getElementById("temperatureF24").innerHTML = data.temperatureF24;
                document.getElementById("temperatureC24").innerHTML = data.temperatureC24;
                document.getElementById("humidity24").innerHTML = data.humidity24;
                document.getElementById("feelslike24").innerHTML = data.feelslike24;
                document.getElementById("wind24").innerHTML = data.wind24;
                document.getElementById("pressure24").innerHTML = data.pressure24;
                console.log(data)
            })
        }
    </script>
    <header>
        <img class='banner' src="images/banner.jpg" alt="Clouds Banner" >
    </header>
    
    <ul>
      <li><a href="daily.jsp">Daily</a></li>
      <li><a class="active" href="location.jsp">Hourly</a></li>
      <li style="float:right"><a href="<%=profilePage%>"><%=profileSet%></a></li>
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
            
            // pulls saved locations from account table using email
            // if nobody is logged in no saved locations get displayed
            Statement slStatement = connection.createStatement();
            ResultSet slresultset = null; 
            if(session.getAttribute("email") != null){
                slresultset = slStatement.executeQuery("select loc1, loc2, loc3 from login where email='" + session.getAttribute("email") + "'"); 
            }
            // populate saved locations bar on top of screen
            while(slresultset != null && slresultset.next()){
            %>
            <div class="dropdown-content">
                <a onclick="changeLoc('<%= slresultset.getString(1) %>')"><%= slresultset.getString(1) %></a>
                <a onclick="changeLoc('<%= slresultset.getString(2) %>')"><%= slresultset.getString(2) %></a>
                <a onclick="changeLoc('<%= slresultset.getString(3) %>')"><%= slresultset.getString(3) %></a>
                <a class="active" href="profile.jsp">EDIT</a>
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
                <img width="100" src="images/weatherthumbnail.jpg" alt="weather thumbnail" >
            </div> 
            <%  
            // set default location to savedlocation1
            ResultSet defaultresultset = slStatement.executeQuery("select loc1 from login where email='" + session.getAttribute("email") + "'");
            
            // initialize variable
            String varZip = "'52246'";
            // check if there is a saved location
            if(defaultresultset.next()){
                // default location
                varZip = defaultresultset.getString(1);
            }
            
            // get current hour (0-23) and add 1 to get readable hour
            int hour = LocalDateTime.now().getHour();
            hour += 1;
            // create string for time ex. "1:00AM"
            String hourAMPM = hour +":00AM";
            // if time is greater than 12 it is in the afternoon
            if(hour > 12){
                hour -= 12;
                hourAMPM = hour +":00PM";
            }
            
            Statement displaystatement = connection.createStatement();
            // times weather for the display area
            String displaycommand = "Select location, temperatureF, temperatureC, humidity, feelslike, wind, pressure from weather where zip="+ varZip +" and time='" + hourAMPM + "'"; 
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
            if(resultset.next()){ %>
            <tr>
                <td id='time1'><%= resultset.getString(1) %></td>
                <td id='temperatureF1'><%= resultset.getString(2) %></td>
                <td id='temperatureC1'><%= resultset.getString(3) %></td>
                <td id='humidity1'><%= resultset.getString(4) %></td>
                <td id='feelslike1'><%= resultset.getString(5) %></td>
                <td id='wind1'><%= resultset.getString(6) %></td>
                <td id='pressure1'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time2'><%= resultset.getString(1) %></td>
                <td id='temperatureF2'><%= resultset.getString(2) %></td>
                <td id='temperatureC2'><%= resultset.getString(3) %></td>
                <td id='humidity2'><%= resultset.getString(4) %></td>
                <td id='feelslike2'><%= resultset.getString(5) %></td>
                <td id='wind2'><%= resultset.getString(6) %></td>
                <td id='pressure2'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time3'><%= resultset.getString(1) %></td>
                <td id='temperatureF3'><%= resultset.getString(2) %></td>
                <td id='temperatureC3'><%= resultset.getString(3) %></td>
                <td id='humidity3'><%= resultset.getString(4) %></td>
                <td id='feelslike3'><%= resultset.getString(5) %></td>
                <td id='wind3'><%= resultset.getString(6) %></td>
                <td id='pressure3'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time4'><%= resultset.getString(1) %></td>
                <td id='temperatureF4'><%= resultset.getString(2) %></td>
                <td id='temperatureC4'><%= resultset.getString(3) %></td>
                <td id='humidity4'><%= resultset.getString(4) %></td>
                <td id='feelslike4'><%= resultset.getString(5) %></td>
                <td id='wind4'><%= resultset.getString(6) %></td>
                <td id='pressure4'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='time5'><%= resultset.getString(1) %></td>
                <td id='temperatureF5'><%= resultset.getString(2) %></td>
                <td id='temperatureC5'><%= resultset.getString(3) %></td>
                <td id='humidity5'><%= resultset.getString(4) %></td>
                <td id='feelslike5'><%= resultset.getString(5) %></td>
                <td id='wind5'><%= resultset.getString(6) %></td>
                <td id='pressure5'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time6'><%= resultset.getString(1) %></td>
                <td id='temperatureF6'><%= resultset.getString(2) %></td>
                <td id='temperatureC6'><%= resultset.getString(3) %></td>
                <td id='humidity6'><%= resultset.getString(4) %></td>
                <td id='feelslike6'><%= resultset.getString(5) %></td>
                <td id='wind6'><%= resultset.getString(6) %></td>
                <td id='pressure6'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time7'><%= resultset.getString(1) %></td>
                <td id='temperatureF7'><%= resultset.getString(2) %></td>
                <td id='temperatureC7'><%= resultset.getString(3) %></td>
                <td id='humidity7'><%= resultset.getString(4) %></td>
                <td id='feelslike7'><%= resultset.getString(5) %></td>
                <td id='wind7'><%= resultset.getString(6) %></td>
                <td id='pressure7'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time8'><%= resultset.getString(1) %></td>
                <td id='temperatureF8'><%= resultset.getString(2) %></td>
                <td id='temperatureC8'><%= resultset.getString(3) %></td>
                <td id='humidity8'><%= resultset.getString(4) %></td>
                <td id='feelslike8'><%= resultset.getString(5) %></td>
                <td id='wind8'><%= resultset.getString(6) %></td>
                <td id='pressure8'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='time9'><%= resultset.getString(1) %></td>
                <td id='temperatureF9'><%= resultset.getString(2) %></td>
                <td id='temperatureC9'><%= resultset.getString(3) %></td>
                <td id='humidity9'><%= resultset.getString(4) %></td>
                <td id='feelslike9'><%= resultset.getString(5) %></td>
                <td id='wind9'><%= resultset.getString(6) %></td>
                <td id='pressure9'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time10'><%= resultset.getString(1) %></td>
                <td id='temperatureF10'><%= resultset.getString(2) %></td>
                <td id='temperatureC10'><%= resultset.getString(3) %></td>
                <td id='humidity10'><%= resultset.getString(4) %></td>
                <td id='feelslike10'><%= resultset.getString(5) %></td>
                <td id='wind10'><%= resultset.getString(6) %></td>
                <td id='pressure10'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time11'><%= resultset.getString(1) %></td>
                <td id='temperatureF11'><%= resultset.getString(2) %></td>
                <td id='temperatureC11'><%= resultset.getString(3) %></td>
                <td id='humidity11'><%= resultset.getString(4) %></td>
                <td id='feelslike11'><%= resultset.getString(5) %></td>
                <td id='wind11'><%= resultset.getString(6) %></td>
                <td id='pressure11'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time12'><%= resultset.getString(1) %></td>
                <td id='temperatureF12'><%= resultset.getString(2) %></td>
                <td id='temperatureC12'><%= resultset.getString(3) %></td>
                <td id='humidity12'><%= resultset.getString(4) %></td>
                <td id='feelslike12'><%= resultset.getString(5) %></td>
                <td id='wind12'><%= resultset.getString(6) %></td>
                <td id='pressure12'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='time13'><%= resultset.getString(1) %></td>
                <td id='temperatureF13'><%= resultset.getString(2) %></td>
                <td id='temperatureC13'><%= resultset.getString(3) %></td>
                <td id='humidity13'><%= resultset.getString(4) %></td>
                <td id='feelslike13'><%= resultset.getString(5) %></td>
                <td id='wind13'><%= resultset.getString(6) %></td>
                <td id='pressure13'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time14'><%= resultset.getString(1) %></td>
                <td id='temperatureF14'><%= resultset.getString(2) %></td>
                <td id='temperatureC14'><%= resultset.getString(3) %></td>
                <td id='humidity14'><%= resultset.getString(4) %></td>
                <td id='feelslike14'><%= resultset.getString(5) %></td>
                <td id='wind14'><%= resultset.getString(6) %></td>
                <td id='pressure14'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time15'><%= resultset.getString(1) %></td>
                <td id='temperatureF15'><%= resultset.getString(2) %></td>
                <td id='temperatureC15'><%= resultset.getString(3) %></td>
                <td id='humidity15'><%= resultset.getString(4) %></td>
                <td id='feelslike15'><%= resultset.getString(5) %></td>
                <td id='wind15'><%= resultset.getString(6) %></td>
                <td id='pressure15'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time16'><%= resultset.getString(1) %></td>
                <td id='temperatureF16'><%= resultset.getString(2) %></td>
                <td id='temperatureC16'><%= resultset.getString(3) %></td>
                <td id='humidity16'><%= resultset.getString(4) %></td>
                <td id='feelslike16'><%= resultset.getString(5) %></td>
                <td id='wind16'><%= resultset.getString(6) %></td>
                <td id='pressure16'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='time17'><%= resultset.getString(1) %></td>
                <td id='temperatureF17'><%= resultset.getString(2) %></td>
                <td id='temperatureC17'><%= resultset.getString(3) %></td>
                <td id='humidity17'><%= resultset.getString(4) %></td>
                <td id='feelslike17'><%= resultset.getString(5) %></td>
                <td id='wind17'><%= resultset.getString(6) %></td>
                <td id='pressure17'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time18'><%= resultset.getString(1) %></td>
                <td id='temperatureF18'><%= resultset.getString(2) %></td>
                <td id='temperatureC18'><%= resultset.getString(3) %></td>
                <td id='humidity18'><%= resultset.getString(4) %></td>
                <td id='feelslike18'><%= resultset.getString(5) %></td>
                <td id='wind18'><%= resultset.getString(6) %></td>
                <td id='pressure18'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time19'><%= resultset.getString(1) %></td>
                <td id='temperatureF19'><%= resultset.getString(2) %></td>
                <td id='temperatureC19'><%= resultset.getString(3) %></td>
                <td id='humidity19'><%= resultset.getString(4) %></td>
                <td id='feelslike19'><%= resultset.getString(5) %></td>
                <td id='wind19'><%= resultset.getString(6) %></td>
                <td id='pressure19'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time20'><%= resultset.getString(1) %></td>
                <td id='temperatureF20'><%= resultset.getString(2) %></td>
                <td id='temperatureC20'><%= resultset.getString(3) %></td>
                <td id='humidity20'><%= resultset.getString(4) %></td>
                <td id='feelslike20'><%= resultset.getString(5) %></td>
                <td id='wind20'><%= resultset.getString(6) %></td>
                <td id='pressure20'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){ %>
            <tr>
                <td id='time21'><%= resultset.getString(1) %></td>
                <td id='temperatureF21'><%= resultset.getString(2) %></td>
                <td id='temperatureC21'><%= resultset.getString(3) %></td>
                <td id='humidity21'><%= resultset.getString(4) %></td>
                <td id='feelslike21'><%= resultset.getString(5) %></td>
                <td id='wind21'><%= resultset.getString(6) %></td>
                <td id='pressure21'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time22'><%= resultset.getString(1) %></td>
                <td id='temperatureF22'><%= resultset.getString(2) %></td>
                <td id='temperatureC22'><%= resultset.getString(3) %></td>
                <td id='humidity22'><%= resultset.getString(4) %></td>
                <td id='feelslike22'><%= resultset.getString(5) %></td>
                <td id='wind22'><%= resultset.getString(6) %></td>
                <td id='pressure22'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time23'><%= resultset.getString(1) %></td>
                <td id='temperatureF23'><%= resultset.getString(2) %></td>
                <td id='temperatureC23'><%= resultset.getString(3) %></td>
                <td id='humidity23'><%= resultset.getString(4) %></td>
                <td id='feelslike23'><%= resultset.getString(5) %></td>
                <td id='wind23'><%= resultset.getString(6) %></td>
                <td id='pressure23'><%= resultset.getString(7) %></td>
            </tr>
            <%}if(resultset.next()){%>
            <tr>
                <td id='time24'><%= resultset.getString(1) %></td>
                <td id='temperatureF24'><%= resultset.getString(2) %></td>
                <td id='temperatureC24'><%= resultset.getString(3) %></td>
                <td id='humidity24'><%= resultset.getString(4) %></td>
                <td id='feelslike24'><%= resultset.getString(5) %></td>
                <td id='wind24'><%= resultset.getString(6) %></td>
                <td id='pressure24'><%= resultset.getString(7) %></td>
            </tr>
            <%}%>
        </table>
        </div>
    </div>
    <script>
        var d = new Date();
        document.getElementById("todayDate").innerHTML = String(d.getMonth()+1)+"-"+String(d.getDate())+"-"+String(d.getFullYear());
    </script>
</body>
</html>
