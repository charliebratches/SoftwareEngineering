package wheelofhunger.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wheelofhunger.models.RestaurantModel;

/**
 * Servlet implementation class WOH_GetById
 */
@WebServlet("/GetById")
public class WOH_GetById extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_GetById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd;
		HttpSession session = request.getSession(true);
		String id = ""; 
		
		if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || request.getParameter("id") == null)
	     {
	    	  rd = request.getRequestDispatcher("/WOH-index.jsp");
		      rd.forward(request, response);
	     }
		
		id = request.getParameter("id");
		
	      try {
	    	  Class.forName("com.mysql.jdbc.Driver");
	      } catch (ClassNotFoundException e) {
	    	  e.printStackTrace();
	      }
    		connection = null;
	      try {
	         connection = DriverManager.getConnection(url, user, password);
	      } catch (SQLException e) {
	    	  System.out.print("Bad URL");
	         e.printStackTrace();
	      }
	      if (connection != null) {
	      } else {
	         System.out.println("Failed to make connection!");
	      }
	      try {
	         String selectSQL = "SELECT * FROM restaurants2 "
	         		+ "WHERE id = "+id+";";
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         ResultSet rs = preparedStatement.executeQuery();	        	 
	         RestaurantModel restaurant = new RestaurantModel();
	         while (rs.next()) {
	        	
		    	 restaurant.setName(rs.getString("NAME"));
		    	 restaurant.setPrice(rs.getInt("PRICE"));
		    	 restaurant.setType(rs.getInt("TYPE"));
		    	 restaurant.setDistance(rs.getInt("DISTANCE"));
		    	 List<String> cuisines = null;	        	
	        	 List<String> notes = null;
	        	 try{
	        		 cuisines = Arrays.asList(rs.getString("CUISINES").split(","));
	        		 notes = Arrays.asList(rs.getString("NOTES").split(";"));
	        	 }catch(Exception e){
	        		 System.out.println("cusine or notes are null");
	        	 }
	        	 restaurant.setCuisines(cuisines);
	        
	        	 restaurant.setNotes(notes);
	        	 restaurant.setId(rs.getInt("id"));
	         }
	         
	         request.setAttribute("restaurant", restaurant);
	         rd = request.getRequestDispatcher("/WOH-editRestaurant.jsp");
	         rd.forward(request, response);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }            		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
