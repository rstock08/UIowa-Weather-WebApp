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

        // Try to connect to DB
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", "");
        PreparedStatement ps = c.prepareStatement("SELECT password FROM login WHERE email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        String password = rs.getString("password");
        
        int i=ps.executeUpdate(); 
        
        String subj = "Forgot Password";
        String msg = password;
        
        SendEmail.send(email, subj, msg);
        
        if(i>0)  {

            // Call class SendEmail to send email with user password password
            //new SendEmail(email, password);

            response.sendRedirect("index.jsp");
        }

        }catch (Exception e) {
            out.println(e);  
            response.sendRedirect("createaccount.jsp");
            }
        out.close();
    }

}