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
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Collect parameters from html login form
        String email=request.getParameter("email");
        
        String password = "failed to fetch";

        // Try to connect to DB
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", "");
            PreparedStatement ps = c.prepareStatement("SELECT password FROM login WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            password = rs.getString("password");

            int i=ps.executeUpdate(); 

            if(i>0)  {

                // Call class SendEmail to send email with user password password
                //new SendEmail(email, password);

                response.sendRedirect("index.jsp");
            }

        }catch (IOException | ClassNotFoundException | SQLException e) {
            out.println(e);  
            response.sendRedirect("createaccount.jsp");
            }
        out.close();
        
        
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
            getServletContext().getRequestDispatcher("/Result.jsp").forward(
                    request, response);
        }
    }
}