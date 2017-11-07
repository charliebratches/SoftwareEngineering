package wheelofhunger.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WOH_Login
 */
@WebServlet("/Login")
public class WOH_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/WOH-login.jsp");
	    rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		
		 if (request.getParameter("username") == null)
	     {
	    	  rd = request.getRequestDispatcher("/WOH-login.jsp");
		      rd.forward(request, response);
	     }
		 
		String username = request.getParameter("username");
		String Userpassword = request.getParameter("password");
		int userId = -1;
	    
	    int errorMessage = 0;
	    
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
	        	String selectSQL = "SELECT * FROM users WHERE username = '" + username + "' AND PASSWORD = '" + Userpassword + "';";
	        	PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	        	ResultSet rs = preparedStatement.executeQuery();
	        	
	        	HttpSession session = request.getSession(true);
		        
		        if(rs.next())
		        {
		        	userId = (Integer.parseInt(rs.getString("USERID")));
		        	session.setAttribute("userid", userId);
		        	session.setAttribute("username", username);
		        	request.setAttribute("errorMessage", errorMessage); //error message = 0; success
		        	
		        	rd = request.getRequestDispatcher("WOH-index.jsp");
		        	rd.forward(request, response);
		        }
		        else
		        {
		        	session.setAttribute("userid", null);
		    		session.invalidate();
		        	errorMessage = 1;//error message = 1; username or password incorrect
		        	request.setAttribute("errorMessage", errorMessage);
		        	rd = request.getRequestDispatcher("WOH-login.jsp");
		  	      	rd.forward(request, response);
		        }
	        	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 	      
	     
	      	
	}

}
