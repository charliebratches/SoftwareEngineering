package wheelofhunger.controllers;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wheelofhunger.models.RestaurantModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/DisplayAll")
public class WOH_DisplayAll extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
	
	public WOH_DisplayAll(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      response.setContentType("text/html;charset=UTF-8");
	      List<RestaurantModel> restaurantList = new ArrayList<>();
	      HttpSession session = request.getSession(true);
	      RequestDispatcher rd;
	      
	      if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))
	      {
	    	  rd = request.getRequestDispatcher("/WOH-login.jsp");
		      rd.forward(request, response);
	      }
	     
	      try {
	    	  Class.forName("com.mysql.jdbc.Driver");
	      } catch (ClassNotFoundException e) {
	    	  System.out.println("class not found");
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
	    	 int userId = Integer.parseInt(session.getAttribute("userid").toString());
	         String selectSQL = "SELECT * FROM restaurants2 WHERE USERID = " +userId
	         		+ " ORDER BY NAME;";
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         ResultSet rs = preparedStatement.executeQuery();
	         while (rs.next()) {
	        	 System.out.println("working");
		        RestaurantModel restaurant = new RestaurantModel();
	        	restaurant.setName(rs.getString("NAME"));
	        	restaurant.setPrice(Integer.parseInt(rs.getString("PRICE")));
	        	restaurant.setType(Integer.parseInt(rs.getString("TYPE")));
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
	            restaurantList.add(restaurant);
	         }
	         
	         //Setting the value of contactList, pointing the request dispatcher towards 
	         // ContactList.jsp and sending the data to that page
	         request.setAttribute("restaurantList", restaurantList);
	         
	         rd = request.getRequestDispatcher("/WOH-restaurantList.jsp");
	         rd.forward(request, response);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }            		
	}
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	      doGet(request, response);
	   }
}
