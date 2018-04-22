/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to update database with new user. (Registration servlet).
*/

package Account;

import java.io.*;
import static java.lang.System.out;
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
        String type="user";

        // Connect to mysql and verify username password

        try {
        Class.forName("com.mysql.jdbc.Driver");
        // loads driver
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection

        PreparedStatement ps = c.prepareStatement("insert into login values (?,?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, password);
        ps.setString(3, fname);
        ps.setString(4, lname);
        ps.setString(5, zip);
        ps.setString(6, type);
        
        int i=ps.executeUpdate();  
        if(i>0)  {
        out.print("You are successfully registered...");  
        response.sendRedirect("index.jsp");
        }
        
        }catch (Exception e2) {
            out.println(e2);  
            response.sendRedirect("createaccount.html");
            }
        out.close(); 
    } 
}