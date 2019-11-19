package com.dchristodoulou;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.persistence.*;

@WebServlet("/queryregister")
public class QueryServletregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	        String repeat_password = request.getParameter("psw-repeat");
	    
	        // Get a transaction
	        transaction = manager.getTransaction();
	        // Begin the transaction
	        transaction.begin();
	        String stringQuery = "SELECT count(m) FROM Member m where m.email= '"+email+"'";
	        Query query = manager.createQuery(stringQuery);
	        int size = ((Number) query.getSingleResult()).intValue();
	        
	        transaction.commit();
	        
	        if(size> 0) {
	        	out.println("<h3>email used</h3>");
	        	out.println("<p><a href='register.html'>Clik here</a> to return to sing up page</p>");
	        } else {
	        	if (password.equals(repeat_password)) {
			          transaction = manager.getTransaction();
			          transaction.begin();   
			          out.println("<h3>create new account</h3>");
			          out.println("<p><a href='login.html'>Clik here</a> to return to login page</p>");
			          // Create a new Student object
			          Member user= new Member();
			          user.setPassword(password);
			          user.setEmail(email);
		
			          // Save the student object
			          manager.persist(user);
			          transaction.commit();
	        	}
	        	else {
	        		out.println("<p>Pleaase try again passwords not match ...</p>");
	                out.println("<p><a href='register.html'>Clik here</a> to return to sing up page</p>");
	        	}
	        }
	    } catch (Exception ex) {
	    	out.println("<h3>oups</h3>");
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