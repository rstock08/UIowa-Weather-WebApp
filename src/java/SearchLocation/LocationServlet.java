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
            ResultSet rs = ps.executeQuery();
            
            String location = "";
            String time = "";
            String temperatureF = "";
            String temperatureC = "";
            String humidity = "";
            String feelslike = "";
            String wind = "";
            String pressure = "";
            
            String time2 = "";
            String temperatureF2 = "";
            String temperatureC2 = "";
            String humidity2 = "";
            String feelslike2 = "";
            String wind2 = "";
            String pressure2 = "";
            
            String time3 = "";
            String temperatureF3 = "";
            String temperatureC3 = "";
            String humidity3 = "";
            String feelslike3 = "";
            String wind3 = "";
            String pressure3 = "";
            
            String time4 = "";
            String temperatureF4 = "";
            String temperatureC4 = "";
            String humidity4 = "";
            String feelslike4 = "";
            String wind4 = "";
            String pressure4 = "";
            
            String time5 = "";
            String temperatureF5 = "";
            String temperatureC5 = "";
            String humidity5 = "";
            String feelslike5 = "";
            String wind5 = "";
            String pressure5 = "";
            
            String time6 = "";
            String temperatureF6 = "";
            String temperatureC6 = "";
            String humidity6 = "";
            String feelslike6 = "";
            String wind6 = "";
            String pressure6 = "";
            
            String time7 = "";
            String temperatureF7 = "";
            String temperatureC7 = "";
            String humidity7 = "";
            String feelslike7 = "";
            String wind7 = "";
            String pressure7 = "";
            
            String time8 = "";
            String temperatureF8 = "";
            String temperatureC8 = "";
            String humidity8 = "";
            String feelslike8 = "";
            String wind8 = "";
            String pressure8 = "";
            
            String time9 = "";
            String temperatureF9 = "";
            String temperatureC9 = "";
            String humidity9 = "";
            String feelslike9 = "";
            String wind9 = "";
            String pressure9 = "";
            
            String time10 = "";
            String temperatureF10 = "";
            String temperatureC10 = "";
            String humidity10 = "";
            String feelslike10 = "";
            String wind10 = "";
            String pressure10 = "";
            
            String time11 = "";
            String temperatureF11 = "";
            String temperatureC11 = "";
            String humidity11 = "";
            String feelslike11 = "";
            String wind11 = "";
            String pressure11 = "";
            
            String time12 = "";
            String temperatureF12 = "";
            String temperatureC12 = "";
            String humidity12 = "";
            String feelslike12 = "";
            String wind12 = "";
            String pressure12 = "";
            
            String time13 = "";
            String temperatureF13 = "";
            String temperatureC13 = "";
            String humidity13 = "";
            String feelslike13 = "";
            String wind13 = "";
            String pressure13 = "";
            
            String time14 = "";
            String temperatureF14 = "";
            String temperatureC14 = "";
            String humidity14 = "";
            String feelslike14 = "";
            String wind14 = "";
            String pressure14 = "";
            
            String time15 = "";
            String temperatureF15 = "";
            String temperatureC15 = "";
            String humidity15 = "";
            String feelslike15 = "";
            String wind15 = "";
            String pressure15 = "";
            
            String time16 = "";
            String temperatureF16 = "";
            String temperatureC16 = "";
            String humidity16 = "";
            String feelslike16 = "";
            String wind16 = "";
            String pressure16 = "";
            
            String time17 = "";
            String temperatureF17 = "";
            String temperatureC17 = "";
            String humidity17 = "";
            String feelslike17 = "";
            String wind17 = "";
            String pressure17 = "";
            
            String time18 = "";
            String temperatureF18 = "";
            String temperatureC18 = "";
            String humidity18 = "";
            String feelslike18 = "";
            String wind18 = "";
            String pressure18 = "";
            
            String time19 = "";
            String temperatureF19 = "";
            String temperatureC19 = "";
            String humidity19 = "";
            String feelslike19 = "";
            String wind19 = "";
            String pressure19 = "";
            
            String time20 = "";
            String temperatureF20 = "";
            String temperatureC20 = "";
            String humidity20 = "";
            String feelslike20 = "";
            String wind20 = "";
            String pressure20 = "";
            
            String time21 = "";
            String temperatureF21 = "";
            String temperatureC21 = "";
            String humidity21 = "";
            String feelslike21 = "";
            String wind21 = "";
            String pressure21 = "";
            
            String time22 = "";
            String temperatureF22 = "";
            String temperatureC22 = "";
            String humidity22 = "";
            String feelslike22 = "";
            String wind22 = "";
            String pressure22 = "";
            
            String time23 = "";
            String temperatureF23 = "";
            String temperatureC23 = "";
            String humidity23 = "";
            String feelslike23 = "";
            String wind23 = "";
            String pressure23 = "";
            
            String time24 = "";
            String temperatureF24 = "";
            String temperatureC24 = "";
            String humidity24 = "";
            String feelslike24 = "";
            String wind24 = "";
            String pressure24 = "";

            // save results of query in variables
            if(rs.next()){
                location = rs.getString(1);
                time = rs.getString(2);
                temperatureF = rs.getString(3);
                temperatureC = rs.getString(4);
                humidity = rs.getString(5);
                feelslike = rs.getString(6);
                wind = rs.getString(7);
                pressure = rs.getString(8);
            }
            if(rs.next()){
                time2 = rs.getString(2);
                temperatureF2 = rs.getString(3);
                temperatureC2 = rs.getString(4);
                humidity2 = rs.getString(5);
                feelslike2 = rs.getString(6);
                wind2 = rs.getString(7);
                pressure2 = rs.getString(8);
            }
            if(rs.next()){
                time3 = rs.getString(2);
                temperatureF3 = rs.getString(3);
                temperatureC3 = rs.getString(4);
                humidity3 = rs.getString(5);
                feelslike3 = rs.getString(6);
                wind3 = rs.getString(7);
                pressure3 = rs.getString(8);
            }
            if(rs.next()){
                time4 = rs.getString(2);
                temperatureF4 = rs.getString(3);
                temperatureC4 = rs.getString(4);
                humidity4 = rs.getString(5);
                feelslike4 = rs.getString(6);
                wind4 = rs.getString(7);
                pressure4 = rs.getString(8);
            }
            if(rs.next()){
                time5 = rs.getString(2);
                temperatureF5 = rs.getString(3);
                temperatureC5 = rs.getString(4);
                humidity5 = rs.getString(5);
                feelslike5 = rs.getString(6);
                wind5 = rs.getString(7);
                pressure5 = rs.getString(8);
            }
            if(rs.next()){
                time6 = rs.getString(2);
                temperatureF6 = rs.getString(3);
                temperatureC6 = rs.getString(4);
                humidity6 = rs.getString(5);
                feelslike6 = rs.getString(6);
                wind6 = rs.getString(7);
                pressure6 = rs.getString(8);
            }
            if(rs.next()){
                time7 = rs.getString(2);
                temperatureF7 = rs.getString(3);
                temperatureC7 = rs.getString(4);
                humidity7 = rs.getString(5);
                feelslike7 = rs.getString(6);
                wind7 = rs.getString(7);
                pressure7 = rs.getString(8);
            }
            if(rs.next()){
                time8 = rs.getString(2);
                temperatureF8 = rs.getString(3);
                temperatureC8 = rs.getString(4);
                humidity8 = rs.getString(5);
                feelslike8 = rs.getString(6);
                wind8 = rs.getString(7);
                pressure8 = rs.getString(8);
            }
            if(rs.next()){
                time9 = rs.getString(2);
                temperatureF9 = rs.getString(3);
                temperatureC9 = rs.getString(4);
                humidity9 = rs.getString(5);
                feelslike9 = rs.getString(6);
                wind9 = rs.getString(7);
                pressure9 = rs.getString(8);
            }
            if(rs.next()){
                time10 = rs.getString(2);
                temperatureF10 = rs.getString(3);
                temperatureC10 = rs.getString(4);
                humidity10 = rs.getString(5);
                feelslike10 = rs.getString(6);
                wind10 = rs.getString(7);
                pressure10 = rs.getString(8);
            }
            if(rs.next()){
                time11 = rs.getString(2);
                temperatureF11 = rs.getString(3);
                temperatureC11 = rs.getString(4);
                humidity11 = rs.getString(5);
                feelslike11 = rs.getString(6);
                wind11 = rs.getString(7);
                pressure11 = rs.getString(8);
            }
            if(rs.next()){
                time12 = rs.getString(2);
                temperatureF12 = rs.getString(3);
                temperatureC12 = rs.getString(4);
                humidity12 = rs.getString(5);
                feelslike12 = rs.getString(6);
                wind12 = rs.getString(7);
                pressure12 = rs.getString(8);
            }
            if(rs.next()){
                time13 = rs.getString(2);
                temperatureF13 = rs.getString(3);
                temperatureC13 = rs.getString(4);
                humidity13 = rs.getString(5);
                feelslike13 = rs.getString(6);
                wind13 = rs.getString(7);
                pressure13 = rs.getString(8);
            }
            if(rs.next()){
                time14 = rs.getString(2);
                temperatureF14 = rs.getString(3);
                temperatureC14 = rs.getString(4);
                humidity14 = rs.getString(5);
                feelslike14 = rs.getString(6);
                wind14 = rs.getString(7);
                pressure14 = rs.getString(8);
            }
            if(rs.next()){
                time15 = rs.getString(2);
                temperatureF15 = rs.getString(3);
                temperatureC15 = rs.getString(4);
                humidity15 = rs.getString(5);
                feelslike15 = rs.getString(6);
                wind15 = rs.getString(7);
                pressure15 = rs.getString(8);
            }
            if(rs.next()){
                time16 = rs.getString(2);
                temperatureF16 = rs.getString(3);
                temperatureC16 = rs.getString(4);
                humidity16 = rs.getString(5);
                feelslike16 = rs.getString(6);
                wind16 = rs.getString(7);
                pressure16 = rs.getString(8);
            }if(rs.next()){
                time17 = rs.getString(2);
                temperatureF17 = rs.getString(3);
                temperatureC17 = rs.getString(4);
                humidity17 = rs.getString(5);
                feelslike17 = rs.getString(6);
                wind17 = rs.getString(7);
                pressure17 = rs.getString(8);
            }
            if(rs.next()){
                time18 = rs.getString(2);
                temperatureF18 = rs.getString(3);
                temperatureC18 = rs.getString(4);
                humidity18 = rs.getString(5);
                feelslike18 = rs.getString(6);
                wind18 = rs.getString(7);
                pressure18 = rs.getString(8);
            }
            if(rs.next()){
                time19 = rs.getString(2);
                temperatureF19 = rs.getString(3);
                temperatureC19 = rs.getString(4);
                humidity19 = rs.getString(5);
                feelslike19 = rs.getString(6);
                wind19 = rs.getString(7);
                pressure19 = rs.getString(8);
            }
            if(rs.next()){
                time20 = rs.getString(2);
                temperatureF20 = rs.getString(3);
                temperatureC20 = rs.getString(4);
                humidity20 = rs.getString(5);
                feelslike20 = rs.getString(6);
                wind20 = rs.getString(7);
                pressure20 = rs.getString(8);
            }
            if(rs.next()){
                time21 = rs.getString(2);
                temperatureF21 = rs.getString(3);
                temperatureC21 = rs.getString(4);
                humidity21 = rs.getString(5);
                feelslike21 = rs.getString(6);
                wind21 = rs.getString(7);
                pressure21 = rs.getString(8);
            }
            if(rs.next()){
                time22 = rs.getString(2);
                temperatureF22 = rs.getString(3);
                temperatureC22 = rs.getString(4);
                humidity22 = rs.getString(5);
                feelslike22 = rs.getString(6);
                wind22 = rs.getString(7);
                pressure22 = rs.getString(8);
            }
            if(rs.next()){
                time23 = rs.getString(2);
                temperatureF23 = rs.getString(3);
                temperatureC23 = rs.getString(4);
                humidity23 = rs.getString(5);
                feelslike23 = rs.getString(6);
                wind23 = rs.getString(7);
                pressure23 = rs.getString(8);
            }
            if(rs.next()){
                time24 = rs.getString(2);
                temperatureF24 = rs.getString(3);
                temperatureC24 = rs.getString(4);
                humidity24 = rs.getString(5);
                feelslike24 = rs.getString(6);
                wind24 = rs.getString(7);
                pressure24 = rs.getString(8);
            }
            
            if(location != ""){
                String jcontent = "{\"location\": \"" + location + "\", \"time\": \"" + time + "\", \"temperatureF\": \"" + temperatureF + "\", \"temperatureC\": \"" + temperatureC + "\", \"humidity\": \"" + humidity + "\", \"feelslike\": \"" + feelslike + "\", \"wind\": \"" + wind + "\", \"pressure\": \"" + pressure + "\", \"time2\": \"" + time2 + "\", \"temperatureF2\": \"" + temperatureF2 + "\", \"temperatureC2\": \"" + temperatureC2 + "\", \"humidity2\": \"" + humidity2 + "\", \"feelslike2\": \"" + feelslike2 + "\", \"wind2\": \"" + wind2 + "\", \"pressure2\": \"" + pressure2 + "\", \"time3\": \"" + time3 + "\", \"temperatureF3\": \"" + temperatureF3 + "\", \"temperatureC3\": \"" + temperatureC3 + "\", \"humidity3\": \"" + humidity3 + "\", \"feelslike3\": \"" + feelslike3 + "\", \"wind3\": \"" + wind3 + "\", \"pressure3\": \"" + pressure3 + "\", \"time4\": \"" + time4 + "\", \"temperatureF4\": \"" + temperatureF4 + "\", \"temperatureC4\": \"" + temperatureC4 + "\", \"humidity4\": \"" + humidity4 + "\", \"feelslike4\": \"" + feelslike4 + "\", \"wind4\": \"" + wind4 + "\", \"pressure4\": \"" + pressure4 + "\", \"time5\": \"" + time5 + "\", \"temperatureF5\": \"" + temperatureF5 + "\", \"temperatureC5\": \"" + temperatureC5 + "\", \"humidity5\": \"" + humidity5 + "\", \"feelslike5\": \"" + feelslike5 + "\", \"wind5\": \"" + wind5 + "\", \"pressure5\": \"" + pressure5 + "\", \"time6\": \"" + time6 + "\", \"temperatureF6\": \"" + temperatureF6 + "\", \"temperatureC6\": \"" + temperatureC6 + "\", \"humidity6\": \"" + humidity6 + "\", \"feelslike6\": \"" + feelslike6 + "\", \"wind6\": \"" + wind6 + "\", \"pressure6\": \"" + pressure6 + "\", \"time7\": \"" + time7 + "\", \"temperatureF7\": \"" + temperatureF7 + "\", \"temperatureC7\": \"" + temperatureC7 + "\", \"humidity7\": \"" + humidity7 + "\", \"feelslike7\": \"" + feelslike7 + "\", \"wind7\": \"" + wind7 + "\", \"pressure7\": \"" + pressure7 + "\", \"time8\": \"" + time8 + "\", \"temperatureF8\": \"" + temperatureF8 + "\", \"temperatureC8\": \"" + temperatureC8 + "\", \"humidity8\": \"" + humidity8 + "\", \"feelslike8\": \"" + feelslike8 + "\", \"wind8\": \"" + wind8 + "\", \"pressure8\": \"" + pressure8 + "\", \"time9\": \"" + time9 + "\", \"temperatureF9\": \"" + temperatureF9 + "\", \"temperatureC9\": \"" + temperatureC9 + "\", \"humidity9\": \"" + humidity9 + "\", \"feelslike9\": \"" + feelslike9 + "\", \"wind9\": \"" + wind9 + "\", \"pressure9\": \"" + pressure9 + "\", \"time10\": \"" + time10 + "\", \"temperatureF10\": \"" + temperatureF10 + "\", \"temperatureC10\": \"" + temperatureC10 + "\", \"humidity10\": \"" + humidity10 + "\", \"feelslike10\": \"" + feelslike10 + "\", \"wind10\": \"" + wind10 + "\", \"pressure10\": \"" + pressure10 + "\", \"time11\": \"" + time11 + "\", \"temperatureF11\": \"" + temperatureF11 + "\", \"temperatureC11\": \"" + temperatureC11 + "\", \"humidity11\": \"" + humidity11 + "\", \"feelslike11\": \"" + feelslike11 + "\", \"wind11\": \"" + wind11 + "\", \"pressure11\": \"" + pressure11 + "\", \"time12\": \"" + time12 + "\", \"temperatureF12\": \"" + temperatureF12 + "\", \"temperatureC12\": \"" + temperatureC12 + "\", \"humidity12\": \"" + humidity12 + "\", \"feelslike12\": \"" + feelslike12 + "\", \"wind12\": \"" + wind12 + "\", \"pressure12\": \"" + pressure12 + "\", \"time13\": \"" + time13 + "\", \"temperatureF13\": \"" + temperatureF13 + "\", \"temperatureC13\": \"" + temperatureC13 + "\", \"humidity13\": \"" + humidity13 + "\", \"feelslike13\": \"" + feelslike13 + "\", \"wind13\": \"" + wind13 + "\", \"pressure13\": \"" + pressure13 + "\", \"time14\": \"" + time14 + "\", \"temperatureF14\": \"" + temperatureF14 + "\", \"temperatureC14\": \"" + temperatureC14 + "\", \"humidity14\": \"" + humidity14 + "\", \"feelslike14\": \"" + feelslike14 + "\", \"wind14\": \"" + wind14 + "\", \"pressure14\": \"" + pressure14 + "\", \"time15\": \"" + time15 + "\", \"temperatureF15\": \"" + temperatureF15 + "\", \"temperatureC15\": \"" + temperatureC15 + "\", \"humidity15\": \"" + humidity15 + "\", \"feelslike15\": \"" + feelslike15 + "\", \"wind15\": \"" + wind15 + "\", \"pressure15\": \"" + pressure15 + "\", \"time16\": \"" + time16 + "\", \"temperatureF16\": \"" + temperatureF16 + "\", \"temperatureC16\": \"" + temperatureC16 + "\", \"humidity16\": \"" + humidity16 + "\", \"feelslike16\": \"" + feelslike16 + "\", \"wind16\": \"" + wind16 + "\", \"pressure16\": \"" + pressure16 + "\", \"time17\": \"" + time17 + "\", \"temperatureF17\": \"" + temperatureF17 + "\", \"temperatureC17\": \"" + temperatureC17 + "\", \"humidity17\": \"" + humidity17 + "\", \"feelslike17\": \"" + feelslike17 + "\", \"wind17\": \"" + wind17 + "\", \"pressure17\": \"" + pressure17 + "\", \"time18\": \"" + time18 + "\", \"temperatureF18\": \"" + temperatureF18 + "\", \"temperatureC18\": \"" + temperatureC18 + "\", \"humidity18\": \"" + humidity18 + "\", \"feelslike18\": \"" + feelslike18 + "\", \"wind18\": \"" + wind18 + "\", \"pressure18\": \"" + pressure18 + "\", \"time19\": \"" + time19 + "\", \"temperatureF19\": \"" + temperatureF19 + "\", \"temperatureC19\": \"" + temperatureC19 + "\", \"humidity19\": \"" + humidity19 + "\", \"feelslike19\": \"" + feelslike19 + "\", \"wind19\": \"" + wind19 + "\", \"pressure19\": \"" + pressure19 + "\", \"time20\": \"" + time20 + "\", \"temperatureF20\": \"" + temperatureF20 + "\", \"temperatureC20\": \"" + temperatureC20 + "\", \"humidity20\": \"" + humidity20 + "\", \"feelslike20\": \"" + feelslike20 + "\", \"wind20\": \"" + wind20 + "\", \"pressure20\": \"" + pressure20 + "\", \"time21\": \"" + time21 + "\", \"temperatureF21\": \"" + temperatureF21 + "\", \"temperatureC21\": \"" + temperatureC21 + "\", \"humidity21\": \"" + humidity21 + "\", \"feelslike21\": \"" + feelslike21 + "\", \"wind21\": \"" + wind21 + "\", \"pressure21\": \"" + pressure21 + "\", \"time22\": \"" + time22 + "\", \"temperatureF22\": \"" + temperatureF22 + "\", \"temperatureC22\": \"" + temperatureC22 + "\", \"humidity22\": \"" + humidity22 + "\", \"feelslike22\": \"" + feelslike22 + "\", \"wind22\": \"" + wind22 + "\", \"pressure22\": \"" + pressure22 + "\", \"time23\": \"" + time23 + "\", \"temperatureF23\": \"" + temperatureF23 + "\", \"temperatureC23\": \"" + temperatureC23 + "\", \"humidity23\": \"" + humidity23 + "\", \"feelslike23\": \"" + feelslike23 + "\", \"wind23\": \"" + wind23 + "\", \"pressure23\": \"" + pressure23 + "\", \"time24\": \"" + time24 + "\", \"temperatureF24\": \"" + temperatureF24 + "\", \"temperatureC24\": \"" + temperatureC24 + "\", \"humidity24\": \"" + humidity24 + "\", \"feelslike24\": \"" + feelslike24 + "\", \"wind24\": \"" + wind24 + "\", \"pressure24\": \"" + pressure24 + "\"}";
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