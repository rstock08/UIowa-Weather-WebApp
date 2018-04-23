/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to verify user login data with database.
*/

package Account;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
 
/**
 * Servlet implementation class LoginServlet
 */
 
public class LoginServlet extends HttpServlet {
        
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
            
            // Collect parameters from html login form
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String type = null;

            // Try to connect to DB
            try {
            Class.forName("com.mysql.jdbc.Driver");
            // loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
            PreparedStatement ps = c.prepareStatement("Select email, password from login where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            //ps.setString(3,type);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    //session.setAttribute("type", type);
 
                    response.sendRedirect("index.jsp");
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
