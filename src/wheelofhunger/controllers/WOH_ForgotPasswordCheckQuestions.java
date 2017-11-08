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

import wheelofhunger.models.UserModel;

/**
 * Servlet implementation class WOH_ForgotPassword
 */
@WebServlet("/ForgotPasswordCheckQuestions")
public class WOH_ForgotPasswordCheckQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_ForgotPasswordCheckQuestions() {
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
		
	    String secAnswer1 = "";
	    String secAnswer2 = "";
	    String secAnswer3 = "";
	    int userId = -1;
	    
	    int errorMessage = 0;
	    int forgotPasswordState = 0;
	    
	    //Send User Back To Enter Username Screen If They Have Not Validated Security Questions
	    //Set Error State to 4 indicating that the user tried to skip forgotPassword validation
	    if(session.getAttribute("forgotPasswordState") == null || Integer.parseInt(session.getAttribute("forgotPasswordState").toString()) != 2)
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
    	secAnswer1 = request.getParameter("secQuestionAnswer1");
    	secAnswer2 = request.getParameter("secQuestionAnswer2");
    	secAnswer3 = request.getParameter("secQuestionAnswer3");
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
	    	 //Determine if security questions match the users selected security question
	    	 String selectSQL = "SELECT * FROM users "+ "WHERE USERID = "+userId+ " AND SECANSWER1 = '" +secAnswer1+ "' AND SECANSWER2 = '" +secAnswer2+ "' AND SECANSWER3 = '" +secAnswer3+ "';";
	    	 preparedStatement = connection.prepareStatement(selectSQL);
	    	 ResultSet rs = preparedStatement.executeQuery();
	    	 
	    	 if(rs.next())
	    	 {
	    		 forgotPasswordState = 3;
	    		 session.setAttribute("forgotPasswordState", forgotPasswordState);
	    		 errorMessage = 0;//error message indicates success
	    		 request.setAttribute("errorMessage", errorMessage);
	    		 
	    		 rd = request.getRequestDispatcher("/WOH-forgotPasswordNewPassword.jsp");
	   	      	 rd.forward(request, response);
	    	 }
	    	 else
	    	 {
	    		 errorMessage = 5;//error message indicated incorrect answer to security questions
	    		 request.setAttribute("errorMessage", errorMessage);
	    		 forgotPasswordState = 1;
	    		 session.setAttribute("forgotPasswordState", forgotPasswordState);
	    		 
	    		 rd = request.getRequestDispatcher("/WOH-forgotPasswordUsername.jsp");
	   	     	 rd.forward(request, response); 
	    	 }
	        	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 	      
	}
}
