package Account;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;


public class CreateAccServlet extends HttpServlet {

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
                // Request info from html form
                String email=request.getParameter("email");
		String password=request.getParameter("password");
                String fname=request.getParameter("fname");
                String lname=request.getParameter("lname");
                String zip=request.getParameter("zip");
		
		// Connect to mysql and verify username password
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		// loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
 
		PreparedStatement ps = c.prepareStatement("Insert into login (email,password,fname,lname,zip) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, password);
                ps.setString(3, fname);
                ps.setString(4, lname);
                ps.setString(5, zip);
 
		ResultSet rs = ps.executeQuery();
 
		while (rs.next()) {
			response.sendRedirect("index.html");
			return;
		}
		response.sendRedirect("error.html");
		return;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
            
	}
}