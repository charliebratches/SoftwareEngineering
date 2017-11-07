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
    	RequestDispatcher rd;
		rd = request.getRequestDispatcher("/WOH-index.jsp");
	    rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession(true);
	    RequestDispatcher rd;
		
		if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || request.getParameter("name") == null)
	     {
	    	  rd = request.getRequestDispatcher("/WOH-index.jsp");
		      rd.forward(request, response);
	     }
		   
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
	    	System.out.println("Cuisines: " + cuisines);
			String notes = request.getParameter("notes");
			System.out.println("notes: " + notes);
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
		         String selectSQL = "UPDATE restaurants2 "
		         		+ "SET NAME='" + name + "', PRICE='" + price + "', TYPE='" + type + "', CUISINES='" + cuisines +"', NOTES='" + notes +"', DISTANCE=" + distance+ " "
         				+ "WHERE id = "+id+";";
		         System.out.println("select: " + selectSQL);
		         PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
		         preparedStatement.executeUpdate();
		        	         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } 	      
		      rd = request.getRequestDispatcher("DisplayAll");
		      rd.forward(request, response);
		
	}

}
