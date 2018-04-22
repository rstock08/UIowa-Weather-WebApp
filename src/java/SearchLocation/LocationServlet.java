/**
 *
 * @author tristan
 */
package SearchLocation;

//import net.sf.json.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
//import java.util.Map;
import javax.servlet.annotation.WebServlet;
  

@WebServlet(name = "LocationServlet", urlPatterns = {"/LocationServlet/*"})
public class LocationServlet extends HttpServlet {
        
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
            PreparedStatement ps = c.prepareStatement("Select location, time, temperatureF, temperatureC, humidity, feelslike, wind, pressure from weather where zip='" + zip + "'");
            //ps.setString(1, zip);
            ResultSet rs = ps.executeQuery();
            
            String location = "";
            String time = "";
            String temperatureF = "";
            String temperatureC = "";
            String humidity = "";
            String feelslike = "";
            String wind = "";
            String pressure = "";
            
            // save results of query in variables
            while(rs.next()){
                location = rs.getString(1);
                time = rs.getString(2);
                temperatureF = rs.getString(3);
                temperatureC = rs.getString(4);
                humidity = rs.getString(5);
                feelslike = rs.getString(6);
                wind = rs.getString(7);
                pressure = rs.getString(8);
                
            }
            if(location != ""){
                String jcontent = "{\"location\": \"" + location + "\", \"time\": \"" + time + "\", \"temperatureF\": \"" + temperatureF + "\", \"temperatureC\": \"" + temperatureC + "\", \"humidity\": \"" + humidity + "\", \"feelslike\": \"" + feelslike + "\", \"wind\": \"" + wind + "\", \"pressure\": \"" + pressure + "\"}";
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                // Get printwriter object from response to write json object to output stream      
                PrintWriter out = response.getWriter();
                // return json object  
                out.print(jcontent);
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
