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

import wheelofhunger.models.UserModel;

/**
 * Servlet implementation class WOH_ForgotPassword
 */
@WebServlet("/ForgotPasswordGetQuestions")
public class WOH_ForgotPasswordGetSecurityQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_ForgotPasswordGetSecurityQuestions() {
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
	      try {
	         String selectSQL = "SELECT * FROM users "
	         		+ "WHERE username = '"+username+"';";
	         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
	         ResultSet rs = preparedStatement.executeQuery();	        	 
	         UserModel user = new UserModel();
	         if (rs.next()) 
	         {	
		    	 user.setUserId(rs.getInt("USERID"));
		    	 user.setSecQuestion1(rs.getInt("SECQUESTION1"));
		    	 user.setSecQuestion2(rs.getInt("SECQUESTION2"));
		    	 user.setSecQuestion3(rs.getInt("SECQUESTION3"));
		    	 request.setAttribute("errorMessage", errorMessage);
		    	 request.setAttribute("user", user);
		    	 rd = request.getRequestDispatcher("/WOH-forgotPasswordQuestions.jsp");
		         rd.forward(request, response);
	         }
	         else
	         {
	        	 errorMessage = 3;
	        	 request.setAttribute("errorMessage", errorMessage);
	        	 rd = request.getRequestDispatcher("/WOH-forgotPasswordUsername.jsp");
		         rd.forward(request, response);
	         }
	         
	         
	         
	        
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 
	}

}
