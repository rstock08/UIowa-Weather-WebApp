/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to update database with randomized password and then using
 * SendEmail servlet an email with the new password is sent to the user.
*/

package Account;

import Email.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
 
/**
 * Servlet implementation class LoginServlet
 */
 
public class ForgotPassServlet extends HttpServlet {
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Collect parameters from html login form
        String email=request.getParameter("email");
        String password="temporary, make function for random password.";

        // Try to connect to DB
        try {
        Class.forName("com.mysql.jdbc.Driver");
        // loads driver
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
        PreparedStatement ps = c.prepareStatement("insert into login values (?,?)");
        ps.setString(1, email);
        //ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        int i=ps.executeUpdate();  
        if(i>0)  {
        out.print("Password reset email sending...");

        // Call class SendEmail to send email with new password
        new SendEmail(email, password);

        response.sendRedirect("index.html");
        }

        }catch (Exception e2) {
            out.println(e2);  
            //response.sendRedirect("createaccount.html");
            }
        out.close();
    }

}