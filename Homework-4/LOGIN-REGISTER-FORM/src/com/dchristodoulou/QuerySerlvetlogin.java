package com.dchristodoulou;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.persistence.*;
import javax.servlet.annotation.*;


@WebServlet("/querylogin")
public class QuerySerlvetlogin extends HttpServlet {
	private static final EntityManagerFactory ENTITY_MANAGER_FACTORY = Persistence.createEntityManagerFactory("MemberDB");

	  protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	  
		  response.setContentType("text/html");
	      // Get a output writer to write the response message into the network socket
	      PrintWriter out = response.getWriter();

	      // Print an HTML page as the output of the query
	      out.println("<html>");
	      out.println("<head><title>Query Response</title></head>");
	      out.println("<body>");
		  
	    EntityManager manager = ENTITY_MANAGER_FACTORY.createEntityManager();
	    EntityTransaction transaction = null;

	    try {
	        String email = request.getParameter("email");
	        String password = request.getParameter("psw");  
	        // Get a transaction
	        transaction = manager.getTransaction();
	        // Begin the transaction
	        transaction.begin();
	        
	        String stringQuery = "SELECT count(m) FROM Member m where m.email= '"+email+"' and m.password= '"+password+"'";
	        Query query = manager.createQuery(stringQuery);
	        int size = ((Number) query.getSingleResult()).intValue();
	        
	        transaction.commit();
	        
	        if(size> 0) {
	        	out.println("<h3>THANK YOY<h3>");
	        	out.println("<p><a href='index.html'>Clik here</a> to return to home page</p>");
	        }
	        else {
	        	out.println("<h3>wrong password or user doesn't exist<h3>");
	        	out.println("<p><a href='login.html'>Clik here</a> to return to login page</p>");
	        }
	    } catch (Exception ex) {
	    	out.println("<h3>YOY<h3>");
	        // If there are any exceptions, roll back the changes
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        // Print the Exception
	        ex.printStackTrace();
	    } finally {
	        // Close the EntityManager
	        manager.close();
	    }
	    out.println("</body></html>");
	    out.close();
	  }
	}