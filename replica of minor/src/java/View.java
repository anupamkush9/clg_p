/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import util.SqlUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author jitesh
 */
@WebServlet(urlPatterns = {"/View"})
public class View extends HttpServlet {

    public void init()
    {
        
        try{
        SqlUtil.connectDb();
        }catch(Exception ex)
        {
            System.out.println("Problem cnnection");
        }
    }
    
    @Override    
    public void service(HttpServletRequest req,HttpServletResponse response) throws IOException
    {
         //for preventaion from unauthorized user
      /* 
        HttpSession session=req.getSession();
            response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("pragma","no-cache");//http 1.0
            response.setHeader("expires","0");//proxies
           
            if(session.getAttribute("unm")==null)
            {
               response.sendRedirect("login.html");
            }  */
        try{
            String username=null;
      PrintWriter out= response.getWriter();
       String city=null,gender=null,email=null;
           // response.sendRedirect("home.html");
           String query="select * from student_profile";
          
           ResultSet rs1= SqlUtil.read(query);
        
           out.println("<table border='1' rules='rows' cellspacing=9 cellpadding=9>");
          out.println("<th>Username</th>");
          out.println("<th>City</th>");
          out.println("<th>Gender</th>");
         out.println("<th>email</th>");

        // while()
             if(rs1.next())
          {
           username=rs1.getString("username");
           city=rs1.getString("city");
           gender=rs1.getString("gender");
           email=rs1.getString("email"); 
           
           out.println("<tr>");
           out.println("<td>"+username+"</td>");
           out.println("<td>"+city+"</td>");
           out.println("<td>"+gender+"</td>");
           out.println("<td>"+email+"</td>");   
           out.println("</tr>");
          }
          out.println("</table>");         

        }catch(Exception ex)
        {
            System.out.println("Problem in view all "+ex);
        }
    }
}
