/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import util.SqlUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author asus
 */
@WebServlet(urlPatterns = {"/profile"})
public class profile extends HttpServlet {
@Override
   public void init()
   {
      try {
            SqlUtil.connectDb();
       
        } catch (Exception ex) {
            System.out.println("problem in data base contivity");
        }  
   }
   @Override
   public void service(HttpServletRequest req,HttpServletResponse resp) throws IOException
   {  
        //for preventaion from unauthorized user
       /*
            resp.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            resp.setHeader("pragma","no-cache");//http 1.0
            resp.setHeader("expires","0");//proxies
           
            if(session.getAttribute("unm")==null)
            {
               resp.sendRedirect("login.html");
            }
       */
       System.out.println("we reached on cookies page");         
    try {
      HttpSession session=req.getSession();  
     String user_nm=(String)session.getAttribute("unm");
     String qry="select * from student_profile where username='"+user_nm+"'";
      //  System.out.println(qry);
    PrintWriter out=resp.getWriter();    
 
        ResultSet re = SqlUtil.read(qry);
          System.out.println("query executed succesfully page");
        if(re.next())
        {
                System.out.println("query executed re.next() succesfully page"); 
          //   out.println("<script>alert('we reach on the cookies page');</script>");
            String name=re.getString("username");
              String email=re.getString("email");
                String gender=re.getString("gender");
                  String city=re.getString("city");
                 
                  
                  System.out.println("final----------------------->");
                  out.println(" NAME:"+name);
                    out.println(" EMAIL:"+email);
                      out.println(" GENDER:"+gender);
                        out.println(" CITY:"+city);
        }
        else
        {
            System.out.println("else of rs.next() not executed ");
        }
    } catch (Exception ex) {
        System.out.println("exception in profile--------------------->"+ex);
    }
     
   }
}
