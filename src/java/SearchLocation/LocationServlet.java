/**
 *
 * @author tristan
 */
package SearchLocation;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
 

@WebServlet(name = "GetLocation", urlPatterns = {"/GetLocation"})
public class LocationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // collect parameters from html that searches location
        String location = request.getParameter("location");
        String temperature = request.getParameter("temperature");
        String humidity = request.getParameter("humidity");
        String feelslike = request.getParameter("feelslike");
        String wind = request.getParameter("wind");
        String pressure = request.getParameter("pressure");
        
        // try to connect to db
        try {
        Class.forName("com.mysql.jdbc.Driver");
            
        // loads driver
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
        PreparedStatement ps = c.prepareStatement("Select location, temperature, humidity, feelslike, wind, pressure from weather where location=?");
        ps.setString(1, location);
        ps.setString(2, temperature);
        ps.setString(3, humidity);
        ps.setString(4, feelslike);
        ps.setString(5, wind);
        ps.setString(6, pressure);
        ResultSet rs = ps.executeQuery();
            
        while (rs.next()) {
            response.sendRedirect("location.html");
            return;
        }
        response.sendRedirect("error.html");
        return;
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}