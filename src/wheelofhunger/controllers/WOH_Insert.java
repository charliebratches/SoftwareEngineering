package wheelofhunger.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Servlet implementation class WOH_Insert
 */
@WebServlet("/Insert")
public class WOH_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
	    int price = -1;
	    int type = -1;
	    int distance = -1;
	    
    	try{
    		price = Integer.parseInt(request.getParameter("price"));
    		type = Integer.parseInt(request.getParameter("type"));
    		distance = Integer.parseInt(request.getParameter("distance"));
    		
    	}catch(Exception e){
    		System.out.println("fields are null");
    	}
	    
    	String cuisines = request.getParameter("cuisines");
		String notes = request.getParameter("notes");
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
	         String insertSQL = "INSERT INTO restaurants(NAME, PRICE, DISTANCE, TYPE, CUISINES, NOTES)"
	         		+ "VALUES ('" + name + "', " + price + ", " + distance + ", " + type + ", '" + cuisines +"', '" + notes +"');";
	         PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
	         preparedStatement.executeUpdate();
	        	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 	      
	      RequestDispatcher rd;
	      rd = request.getRequestDispatcher("DisplayAll");
	      rd.forward(request, response);
	    
	    
	    
	}

}
