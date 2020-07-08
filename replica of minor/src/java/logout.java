/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//import com.sun.xml.internal.fastinfoset.EncodingConstants;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/logout"})
public class logout extends HttpServlet {
    @Override
    public void init()
    {
        
    }
    @Override
    public void service(HttpServletRequest req,HttpServletResponse resp)
    {
          try
          {
               HttpSession session=req.getSession();
                if(session.getAttribute("unm")==null)
                {
                 resp.sendRedirect("login.html");
                }
                else
                { //for preventaion from unauthorized user
                 // PrintWriter out = resp.getWriter();
               //session.setMaxInactiveInterval(0);
               //session.removeAttribute("unm");
               System.out.println("sess---->"+session.getAttribute("unm"));
               session.invalidate();
               
             //  System.out.println("sess- is--->"+session.getAttribute("unm"));
               resp.sendRedirect("login.html");  
                    
               //  HttpSession session=req.getSession(); 
             // <script>document.write("logout success full");</script>
                //resp.setHeader("progmo","no-cache");//http 1.0
                  // resp.setHeader("expires","0");//proxies
              //resp.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            }
         }
          catch(Exception ex){
                      System.out.println("error in lgout"+ex);
                  }
          
    }
   
}
