/**
 *
 * @author tristan
 */
package SearchLocation;

import net.sf.json.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.util.Map;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "DailyServlet", urlPatterns = {"/DailyServlet/*"})
public class DailyServlet extends HttpServlet {

        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
            
            // Collect parameters
            String zip=request.getParameter("zip");
            
            // Try to connect to DB
            try {
            Class.forName("com.mysql.jdbc.Driver");
            // loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
            PreparedStatement ps = c.prepareStatement("Select location, day, temperatureF, temperatureC, humidity, feelslike, wind, pressure from daily where zip='" + zip + "'");
            ResultSet rs = ps.executeQuery();
            
            String location = "";
            String day = "";
            String temperatureF = "";
            String temperatureC = "";
            String humidity = "";
            String feelslike = "";
            String wind = "";
            String pressure = "";
            
            String day2 = "";
            String temperatureF2 = "";
            String temperatureC2 = "";
            String humidity2 = "";
            String feelslike2 = "";
            String wind2 = "";
            String pressure2 = "";
            
            String day3 = "";
            String temperatureF3 = "";
            String temperatureC3 = "";
            String humidity3 = "";
            String feelslike3 = "";
            String wind3 = "";
            String pressure3 = "";
            
            String day4 = "";
            String temperatureF4 = "";
            String temperatureC4 = "";
            String humidity4 = "";
            String feelslike4 = "";
            String wind4 = "";
            String pressure4 = "";
            
            String day5 = "";
            String temperatureF5 = "";
            String temperatureC5 = "";
            String humidity5 = "";
            String feelslike5 = "";
            String wind5 = "";
            String pressure5 = "";
            
            String day6 = "";
            String temperatureF6 = "";
            String temperatureC6 = "";
            String humidity6 = "";
            String feelslike6 = "";
            String wind6 = "";
            String pressure6 = "";
            
            String day7 = "";
            String temperatureF7 = "";
            String temperatureC7 = "";
            String humidity7 = "";
            String feelslike7 = "";
            String wind7 = "";
            String pressure7 = "";
            
            // save results of query in variables
            if(rs.next()){
                location = rs.getString(1);
                day = rs.getString(2);
                temperatureF = rs.getString(3);
                temperatureC = rs.getString(4);
                humidity = rs.getString(5);
                feelslike = rs.getString(6);
                wind = rs.getString(7);
                pressure = rs.getString(8);
            }
            if(rs.next()){
                day2 = rs.getString(2);
                temperatureF2 = rs.getString(3);
                temperatureC2 = rs.getString(4);
                humidity2 = rs.getString(5);
                feelslike2 = rs.getString(6);
                wind2 = rs.getString(7);
                pressure2 = rs.getString(8);
            }
            if(rs.next()){
                day3 = rs.getString(2);
                temperatureF3 = rs.getString(3);
                temperatureC3 = rs.getString(4);
                humidity3 = rs.getString(5);
                feelslike3 = rs.getString(6);
                wind3 = rs.getString(7);
                pressure3 = rs.getString(8);
            }
            if(rs.next()){
                day4 = rs.getString(2);
                temperatureF4 = rs.getString(3);
                temperatureC4 = rs.getString(4);
                humidity4 = rs.getString(5);
                feelslike4 = rs.getString(6);
                wind4 = rs.getString(7);
                pressure4 = rs.getString(8);              
            }
            if(rs.next()){
                day5 = rs.getString(2);
                temperatureF5 = rs.getString(3);
                temperatureC5 = rs.getString(4);
                humidity5 = rs.getString(5);
                feelslike5 = rs.getString(6);
                wind5 = rs.getString(7);
                pressure5 = rs.getString(8);
            }
            if(rs.next()){
                day6 = rs.getString(2);
                temperatureF6 = rs.getString(3);
                temperatureC6 = rs.getString(4);
                humidity6 = rs.getString(5);
                feelslike6 = rs.getString(6);
                wind6 = rs.getString(7);
                pressure6 = rs.getString(8);
            }
            if(rs.next()){
                day7 = rs.getString(2);
                temperatureF7 = rs.getString(3);
                temperatureC7 = rs.getString(4);
                humidity7 = rs.getString(5);
                feelslike7 = rs.getString(6);
                wind7 = rs.getString(7);
                pressure7 = rs.getString(8);
            }
            
            
            if(location != ""){
                String jdcontent = "{\"location\": \"" + location + "\", \"day\": \"" + day + "\", \"temperatureF\": \"" + temperatureF + "\", \"temperatureC\": \"" + temperatureC + "\", \"humidity\": \"" + humidity + "\", \"feelslike\": \"" + feelslike + "\", \"wind\": \"" + wind + "\", \"pressure\": \"" + pressure + "\", \"day2\": \"" + day2 + "\", \"temperatureF2\": \"" + temperatureF2 + "\", \"temperatureC2\": \"" + temperatureC2 + "\", \"humidity2\": \"" + humidity2 + "\", \"feelslike2\": \"" + feelslike2 + "\", \"wind2\": \"" + wind2 + "\", \"pressure2\": \"" + pressure2 + "\", \"day3\": \"" + day3 + "\", \"temperatureF3\": \"" + temperatureF3 + "\", \"temperatureC3\": \"" + temperatureC3 + "\", \"humidity3\": \"" + humidity3 + "\", \"feelslike3\": \"" + feelslike3 + "\", \"wind3\": \"" + wind3 + "\", \"pressure3\": \"" + pressure3 + "\", \"day4\": \"" + day4 + "\", \"temperatureF4\": \"" + temperatureF4 + "\", \"temperatureC4\": \"" + temperatureC4 + "\", \"humidity4\": \"" + humidity4 + "\", \"feelslike4\": \"" + feelslike4 + "\", \"wind4\": \"" + wind4 + "\", \"pressure4\": \"" + pressure4 + "\", \"day5\": \"" + day5 + "\", \"temperatureF5\": \"" + temperatureF5 + "\", \"temperatureC5\": \"" + temperatureC5 + "\", \"humidity5\": \"" + humidity5 + "\", \"feelslike5\": \"" + feelslike5 + "\", \"wind5\": \"" + wind5 + "\", \"pressure5\": \"" + pressure5 + "\", \"day6\": \"" + day6 + "\", \"temperatureF6\": \"" + temperatureF6 + "\", \"temperatureC6\": \"" + temperatureC6 + "\", \"humidity6\": \"" + humidity6 + "\", \"feelslike6\": \"" + feelslike6 + "\", \"wind6\": \"" + wind6 + "\", \"pressure6\": \"" + pressure6  + "\", \"day7\": \"" + day7 + "\", \"temperatureF7\": \"" + temperatureF7 + "\", \"temperatureC7\": \"" + temperatureC7 + "\", \"humidity7\": \"" + humidity7 + "\", \"feelslike7\": \"" + feelslike7 + "\", \"wind7\": \"" + wind7 + "\", \"pressure7\": \"" + pressure7 + "\"}";
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                // Get printwriter object from response to write json object to output stream      
                PrintWriter out = response.getWriter();
                // return json object  
                out.print(jdcontent);
                out.flush();
            }
            else{
                response.sendRedirect("error.html");
            }
            }catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }
        }
}