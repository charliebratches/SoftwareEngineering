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

/**
 * Servlet implementation class WOH_Delete
 */
@WebServlet("/Edit")
public class WOH_Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String             url              = "jdbc:mysql://wheelofhunger.ddns.net:3306/WOHDB";
	static String             user             = "remote";
	static String             password         = "1234";
	static Connection         connection       = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_Edit() {
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
		response.setContentType("text/html;charset=UTF-8");
		   
			String name = request.getParameter("name");
		    int price = -1;
		    int type = -1;
	    	try{
	    		price = Integer.parseInt(request.getParameter("price"));
	    		type = Integer.parseInt(request.getParameter("type"));
	    	}catch(Exception e){
	    		System.out.println("fields are null");
	    	}
		    
	    	String cuisines = request.getParameter("cuisines");
			String notes = request.getParameter("notes");
			int id = Integer.parseInt(request.getParameter("id"));
		     
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
		         String selectSQL = "UPDATE restaurants "
		         		+ "SET NAME='" + name + "', PRICE='" + price + "', TYPE='" + type + "', CUISINES='" + cuisines +"', NOTES='" + notes +"' "
         				+ "WHERE id = "+id+";";
		         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
		         preparedStatement.executeUpdate();
		        	         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } 	      
		      RequestDispatcher rd;
		      rd = request.getRequestDispatcher("DisplayAll");
		      rd.forward(request, response);
		
	}

}
