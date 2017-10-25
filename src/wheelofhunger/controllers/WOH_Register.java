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
 * Servlet implementation class WOH_Register
 */
@WebServlet("/Register")
public class WOH_Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_Register() {
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
		RequestDispatcher rd;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String secQuestionAnswer1 ="";
		String secQuestionAnswer2 = "";
		String secQuestionAnswer3 = "";
		
	    int secQuestion1 = -1;
	    int secQuestion2 = -1;
	    int secQuestion3 = -1;
	    
	    int errorMessage = 0;
	    
    	try
    	{
    		secQuestion1 = Integer.parseInt(request.getParameter("secQuestion1"));
    		secQuestion2 = Integer.parseInt(request.getParameter("secQuestion2"));
    		secQuestion3 = Integer.parseInt(request.getParameter("secQuestion3"));
    		
    	}
    	catch(Exception e){
    		System.out.println("fields are null");
    	}
	    
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
	      try 
	      {
    	  	/*String selectSQL = "SELECT * FROM restaurants "+ "WHERE username = "+username+";";
	        PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	        ResultSet rs = preparedStatement.executeQuery();*/
	
	        	String insertSQL = "INSERT INTO restaurants(username, password, secQuestion1, secQuestion2, secQuestion3, secQuestionAnswer1, secQuestionAnswer2, secQuestionAnswer3)"
		         		+ "VALUES ('" + username + "', " + password + ", " + secQuestion1 + ", " + secQuestion2 + ", '" + secQuestion3  + ", '" + secQuestionAnswer1 + ", '" + secQuestionAnswer2  +"', '" + secQuestionAnswer3 +"');";
	        	PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
		        int i = preparedStatement.executeUpdate();
		        
		        if(i == 0)
		        {
		        	errorMessage = 1;
		        	request.setAttribute("errorMessage", errorMessage);
		        	rd = request.getRequestDispatcher("WOH-register.jsp");
		        	rd.forward(request, response);
		        }
	        	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 	      
	     
	      rd = request.getRequestDispatcher("WOH-login.jsp");
	      rd.forward(request, response);
	}

}
