package wheelofhunger.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wheelofhunger.util.JSONconverter;

/**
 * Servlet implementation class WOH_GetWheelQuery
 */
@WebServlet("/GetWheelQuery")
public class WOH_GetWheelQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WOH_GetWheelQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		RequestDispatcher rd;
		
		if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || session.getAttribute("restaurantList") == null)
	     {
	    	  rd = request.getRequestDispatcher("/WOH-login.jsp");
		      rd.forward(request, response);
	     }
		
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        out.println(JSONconverter.convert(session.getAttribute("restaurantList")));
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
