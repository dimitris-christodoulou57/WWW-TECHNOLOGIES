import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/querylogin")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class QueryServletlogin extends HttpServlet {

   // The doGet() runs once per HTTP GET request to this servlet.
   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
      // Set the MIME type for the response message
      response.setContentType("text/html");
      // Get a output writer to write the response message into the network socket
      PrintWriter out = response.getWriter();

      // Print an HTML page as the output of the query
      out.println("<html>");
      out.println("<head><title>Query Response</title></head>");
      out.println("<body>");

      try (
         // Step 1: Allocate a database 'Connection' object
         Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/memberinfo?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
               "myuser", "user");   // For MySQL
               // The format is: "jdbc:mysql://hostname:port/databaseName", "username", "password"

         // Step 2: Allocate a 'Statement' object in the Connection
         Statement stmt = conn.createStatement();
      ) {
         // Step 3: Execute a SQL SELECT query
         String sqlStr = "select * from information where email = "
               + "'" + request.getParameter("email") + "'";   // Single-quote SQL string;

         out.println("<h3>Thank you for your query.</h3>");
         ResultSet rset = stmt.executeQuery(sqlStr);  // Send the query to the server

         if(rset.next()) {
             if (request.getParameter("psw").equals(rset.getString("password"))){
               out.println("<p> log in succesful</p>");
             }
             else {
              // Print a paragraph <p>...</p> for each record
              out.println("<p> log in fail</p>");
            }
          }
          else {
            out.println("<p> wrong</p>");
          }
      } catch(Exception ex) {
         out.println("<p>Error: " + ex.getMessage() + "</p>");
         out.println("<p>Check Tomcat console for details.</p>");
         ex.printStackTrace();
      }  // Step 5: Close conn and stmt - Done automatically by try-with-resources (JDK 7)

      out.println("</body></html>");
      out.close();
   }
}
