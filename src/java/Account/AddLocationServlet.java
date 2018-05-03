/*
	 * To change this license header, choose License Headers in Project Properties.
	 * To change this template file, choose Tools | Templates
	 * and open the template in the editor.
	 */
	package Account;
	
	import java.io.*;
	import static java.lang.System.out;
	import javax.servlet.http.*;
	import javax.servlet.*;
	import java.sql.*;
        import java.io.IOException;
        import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	/**
	 *
	 * @author Joy

*/
	public class AddLocationServlet extends HttpServlet {

	

	    /**
	     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	     * methods.
	     *
	     * @param request servlet request
	     * @param response servlet response
	     * @throws ServletException if a servlet-specific error occurs
	     * @throws IOException if an I/O error occurs
	     */
            
	    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {
	            /* TODO output your page here. You may use following sample code. */
	            out.println("<!DOCTYPE html>");
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>Servlet AddLocationServlet</title>");            
	            out.println("</head>");
	            out.println("<body>");
	            out.println("<h1>Servlet AddLocationServlet at " + request.getContextPath() + "</h1>");
	            out.println("</body>");
	            out.println("</html>");
	        }
	    }         
	        
	        @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	        try {
                 // Request info from html form
        //user location
                // Connect to sessions to get email
                HttpSession session = request.getSession();
                String email = (String) session.getAttribute("email");
                String zipcode =request.getParameter("zipcode");
	        String loc1=request.getParameter("loc1");
	        String loc2=request.getParameter("loc2");
                String loc3 =request.getParameter("loc3");
        //requirement for which row it’s editing
	        //String email=request.getParameter("email");
	        // Connect to mysql and verify username password
	
	        Class.forName("com.mysql.jdbc.Driver");
	        // loads driver
	        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherdb", "root", ""); // gets a new connection
                //PreparedStatement ps = c.prepareStatement("update login set loc1 = ? where email = ?");
	        //PreparedStatement ps= null;
                int i=0;
                if(loc1==null||loc1.equals(""))
                {
                    //”update login set “ + ? + “ = ? where email = ?”
                    //PreparedStatement ps = c.prepareStatement("update login set loc1 = ? where email = ?");
                PreparedStatement ps = c.prepareStatement("update login set loc1 = ? where email = ?");
	        //ps.setString(1, loc1);
	        ps.setString(1, zipcode);
	        ps.setString(2, email);
                i=ps.executeUpdate();  
	 }
else if (loc2==null||loc2.equals(""))
{
        PreparedStatement ps = c.prepareStatement("update login set loc2 = ? where email = ?");
        //ps.setString(1, loc2);
        ps.setString(1, zipcode);
        ps.setString(2, email);
        i=ps.executeUpdate();  
}
else if (loc3==null||loc3.equals(""))
{
        PreparedStatement ps = c.prepareStatement("update login set loc3 = ? where email = ?");
        //ps.setString(1, loc3);
        ps.setString(1, zipcode);
        ps.setString(2, email);
        
        i=ps.executeUpdate();  
        
}

	        
	        if(i>0)  {
	            out.print("Successfully added");  
	            response.sendRedirect("profile.jsp");
	        }
                else
                {
                    response.sendRedirect("profile.jsp");
                }
	        }catch (Exception e2) {
	            out.println(e2);  
	            response.sendRedirect("profile.jsp");
	            //change this later
	            }
	        out.close(); 
	

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
	     * Returns a short description of the servlet.
	     *
	     * @return a String containing servlet description
	     */
	    @Override
	    public String getServletInfo() {
	        return "Short description";
	    }// </editor-fold>
	

	}

