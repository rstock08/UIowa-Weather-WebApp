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
    
    private String host;
    private String port;
    private String user;
    private String pass;
 
    @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Collect parameters from html login form
        String email=request.getParameter("email");
        
        String password = email;
        
        // Try to connect to DB
        try {
        Class.forName("com.mysql.jdbc.Driver");
        // loads driver
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
        PreparedStatement ps = c.prepareStatement("SELECT password FROM login WHERE email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
                password = rs.getString("password");
                //response.sendRedirect("emailresult.jsp");
                
                
                // Outbound messages
                String subject = "Password Fetch";
                String content = "Your Weather App password is: " + password;

                // Result message displayed on emailresult.jsp page
                String resultMessage = "";


                // Attempting to send email
                try {
                    SendEmail.sendEmail(host, port, user, pass, email, subject,
                            content);
                    resultMessage = "The e-mail was sent successfully";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    resultMessage = "There were an error: " + ex.getMessage();
                } finally {
                    request.setAttribute("Message", resultMessage);
                    getServletContext().getRequestDispatcher("/emailresult.jsp").forward(
                            request, response);
                }
                
                
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