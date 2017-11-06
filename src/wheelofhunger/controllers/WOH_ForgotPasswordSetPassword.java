package wheelofhunger.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WOH_ForgotPassword
 */
@WebServlet("/ForgotPasswordSetPassword")
public class WOH_ForgotPasswordSetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_ForgotPasswordSetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/WOH-forgotPasswordUsername.jsp");
	    rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession(true);
		PreparedStatement preparedStatement;
		RequestDispatcher rd;
		
	    int userId = -1;
	    String newPassword = "";
	    int errorMessage = 0;
	    int forgotPasswordState = 0;
	    
	    //Send User Back To Enter Username Screen If They Have Not Validated Security Questions
	    //Set Error State to 4 indicating that the user tried to skip forgotPassword validation
	    if(session.getAttribute("forgotPasswordState") == null || Integer.parseInt(session.getAttribute("forgotPasswordState").toString()) != 3)
	    {
	    	forgotPasswordState = 1;//State where user needs to enter username
   		 	session.setAttribute("forgotPasswordState", forgotPasswordState);
   		 	errorMessage = 4;//error message indicates user tried to skip forgotPassword validation
   		 	request.setAttribute("errorMessage", errorMessage);
	    	
	    	rd = request.getRequestDispatcher("/WOH-forgotPasswordUsername.jsp");
  	     	rd.forward(request, response);
	    }
	    
	    try{
	    userId = Integer.parseInt(session.getAttribute("tempUserId").toString());
	    newPassword = request.getParameter("password");
	    }
	    catch(Exception e)
	    {
	    	System.out.println("Error Parsing Variables From Request");
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
	      try {
	    	 //Set New Password Once All Security Checks Have Been Completed
	    	 String alterSQL = "UPDATE users SET PASSWORD='" + newPassword+ "' WHERE USERID= " +userId+ ";";
	    	 preparedStatement = connection.prepareStatement(alterSQL);
	    	 int updateStatus = preparedStatement.executeUpdate();
	    	 
	    	 if(updateStatus == 0)
	    	 {
	    		 errorMessage = 6;//error message indicating failure to set new password
	    		 request.setAttribute("errorMessage", errorMessage);
	    		 forgotPasswordState = 1;
	    		 session.setAttribute("forgotPasswordState", forgotPasswordState);
	    		 rd = request.getRequestDispatcher("/WOH-forgotPasswordUsername.jsp");
	   	     	 rd.forward(request, response); 
	    	 }
	    	 else
	    	 {
	    		 forgotPasswordState = 1;
	    		 session.setAttribute("forgotPasswordState", forgotPasswordState);
	    		 errorMessage = 8;//error message indicates success
	    		 request.setAttribute("errorMessage", errorMessage);
	    		 rd = request.getRequestDispatcher("/WOH-login.jsp");
	   	      	 rd.forward(request, response);
	    	 }
	        	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 	      
	}
}
