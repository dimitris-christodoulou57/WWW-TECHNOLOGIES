import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/queryregister")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class QueryServletregister extends HttpServlet {

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

         ResultSet rset = stmt.executeQuery(sqlStr);  // Send the query to the server


         if(rset.next()) {
              out.println("<p>Email used by other user</p>");
              out.println("<p><a href='register.html'>Clik here</a> to return to sing up page</p>");
        }
        else{
            if(!request.getParameter("psw").equals(request.getParameter("psw-repeat"))){
                out.println("<p>Pleaase try again passwords not match ...</p>");
                out.println("<p><a href='register.html'>Clik here</a> to return to sing up page</p>");
            }
            sqlStr = "insert into information values(" + "'" +
            request.getParameter("email") + "','" + request.getParameter("psw") + "')";

            stmt.executeUpdate(sqlStr);
            out.println("<p><a href='login.html'>Clik here</a> to return to login page</p>");
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
