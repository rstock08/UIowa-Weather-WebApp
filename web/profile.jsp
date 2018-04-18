<%-- 
    Document   : profile
    Created on : Apr 17, 2018, 12:55:39 AM
    Author     : ReedS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
                <li><a href="index.html">Home</a></li>
                <li><a href="#change 1">Change 1</a></li>
                <li><a href="#change 2">Change 2</a></li>
                <li style="float:right"><a class="active" href="login.asp">Login</a></li>
            </ul>
        <table border=0>
            <tr>
                <td>
                    <table border=1>
                        <tr>
                            <td>
                                Account Settings
                                <br>
                                <button type="button" onclick="window.location.href='forgotpassword.asp'" />Change Password</button>
                                <br>
                                <!-- What link is this going to? -->
                                <button type="button" onclick="window.location.href='error.asp'">Change Email</button>
                            </td>
                       <tr>
                    </table>
		</td>
		<td>
                    <table border=1>
                        <tr>
                            <td>
				Add Locations
                                <br>
                                    <form method="post" action="AddLocation">
                                        <input type="text" placeholder="Zipcode" name="zipcode">
                                        <br>
                                        <input type="text" placeholder="State" name="state">
                                        <br>
                                        <input type="text" placeholder="City" name="city">
                                        <br>
                                        <input type="submit" value="Submit">
                                    </form>
                            </td>
			<tr>
                    </table>
		</td>
            </tr>
        </table>
 
    </body>
</html>

