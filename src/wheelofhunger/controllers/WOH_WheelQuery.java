package wheelofhunger.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wheelofhunger.models.RestaurantModel;
import wheelofhunger.util.JSONconverter;

/**
 * Servlet implementation class WOH_WheelQuery
 */
@WebServlet("/WheelQuery")
public class WOH_WheelQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_WheelQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		List<RestaurantModel> restaurantList = new ArrayList<>();
	    int price = -1;
	    int type = -1;
	    int distance= -1;
    	try{
    		price = Integer.parseInt(request.getParameter("price"));
    		
    		//checks the price value. if it is -1, it sets price to the max value to get all restaurants
    		//	within the max price range
    		if (price == -1){
    			price = 5;
    		}
    		type = Integer.parseInt(request.getParameter("type"));
    		distance = Integer.parseInt(request.getParameter("distance"));
    		
    		//checks the distance value. if it is -1, it sets distance to the max value to get all restaurants
    		//	within the max distance
    		if (distance == -1){
    			distance = 100;
    		}
    	}catch(Exception e){
    		System.out.println("fields are null");
    	}
    	List<String> inputCuisines = Arrays.asList(request.getParameter("cuisines").split(","));		
	     
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
	         String selectSQL = "SELECT * FROM restaurants "
	         		+ "WHERE PRICE <= "+price+" AND TYPE="+type+" AND DISTANCE <="+distance+";";
	         System.out.println(selectSQL);
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         ResultSet rs = preparedStatement.executeQuery();	        	 
	         while (rs.next()) {
		        RestaurantModel restaurant = new RestaurantModel();
	        	restaurant.setName(rs.getString("NAME"));
	        	restaurant.setPrice(rs.getInt("PRICE"));
	        	restaurant.setType(rs.getInt("TYPE"));
	        	restaurant.setDistance(rs.getInt("DISTANCE"));
	        	List<String> cuisinesList = null;	        	
	        	List<String> notesList = null;
	        	try{
	        		cuisinesList = Arrays.asList(rs.getString("CUISINES").split(","));
	        		notesList = Arrays.asList(rs.getString("NOTES").split(";"));
	        	}catch(Exception e){
	        		System.out.println("cuisine or notes are null");
	        	}
	        	restaurant.setCuisines(cuisinesList);
	        	restaurant.setNotes(notesList);
	        	restaurant.setId(rs.getInt("id"));
	        	if(inputCuisines == null){
	        		restaurantList.add(restaurant);
	        	}else{
	        		//asks if compareCuisine returns true.  If it does, this restaurant is added to the list.
	        		if(compareCuisines(restaurant.getCuisines(), inputCuisines)){
	        			System.out.println(restaurant.getName());
	        			restaurantList.add(restaurant);
	        		}
	        	}        		
	         }
	         
	         response.setContentType("application/json");
	         PrintWriter out = response.getWriter();
	         
	         out.println(JSONconverter.convert(restaurantList));
	         out.close();
	         
	        /* RequestDispatcher rd;
	         rd = request.getRequestDispatcher("/WOH-Wheel.html");
	         rd.forward(request, response);*/
	         
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
	
	//This function loops through the list of inputCuisines and compares them to the cuisines of 
	//the restaurant.  If one of the restaurant's cuisines is a match, it returns true, adding it to restaurantList.
	public boolean compareCuisines(List<String> restaurantCuisineList, List<String> inputCuisines){
		for(int i = 0; i < restaurantCuisineList.size(); i++){
			for(int j= 0; j< inputCuisines.size(); j++){
				if(restaurantCuisineList.get(i).equals(inputCuisines.get(j))){
		            return true;
				}
			}
		}
		return false;
	}

}
