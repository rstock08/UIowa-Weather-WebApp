/*
 * Author: Reed Stock
 * Date: 4/11/2018
 * Description: Servlet used to update database with new user. (Registration servlet).
*/

package Account;

import Email.SendEmail;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;


public class UpdatePassServlet extends HttpServlet {
    
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Request info from html form
        String password=request.getParameter("password");
        
        // Connect to sessions to get email
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
 
        // Connect to mysql and verify username password
        try {
        Class.forName("com.mysql.jdbc.Driver");
        // loads driver
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection

        PreparedStatement ps = c.prepareStatement("UPDATE login SET password=? WHERE email=?");
        ps.setString(1, password);
        ps.setString(2, email);

        int i=ps.executeUpdate();
        if(i>0)  {
            out.print("You are successfully registered...");  
            //response.sendRedirect("index.jsp");
        
            // Email credentials upon success
            // Outbound messages
            String subject = "Password Updated";
            String content = "You new password is: " + password + ".";

            // Result message displayed on emailresult.jsp page
            String resultMessage = "";

            // Attempting to send email
            try {
                SendEmail.sendEmail(host, port, user, pass, email, subject,
                        content);
                resultMessage = "The update was successfully";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } finally {
                request.setAttribute("Message", resultMessage);
                getServletContext().getRequestDispatcher("/emailresult.jsp").forward(
                        request, response);
            }
        
        
        }
        
        }catch (Exception e2) {
            out.println(e2);  
            response.sendRedirect("profile.jsp");
            }
        out.close(); 
    } 
}