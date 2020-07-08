/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import util.SqlUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.resource.spi.AdministeredObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    @Override
    public void init()
    {
        try{
        SqlUtil.connectDb();
      }catch(Exception ex)
            {
            System.out.println("Problem in connection "+ex);
            }
    }
    
    @Override
    public void service(HttpServletRequest request,HttpServletResponse response)
    {   PrintWriter out=null;
        String username=request.getParameter("unm");
        String password=request.getParameter("pass");
       try{
        if(username.equals("admin123")&&password.equals("admin123"))
        { // System.out.println("---->"+user_ty);
            HttpSession session=request.getSession();
            session.setAttribute("unm",username);
            session.setAttribute("pass",password);
            response.sendRedirect("admin.jsp");
        }    
        out=response.getWriter();
        String query="select * from student_login where username='"+username+"' and password ='"+password+"'";
        ResultSet rs= SqlUtil.read(query);
        if(rs.next())
        {
            HttpSession session=request.getSession();
            session.setAttribute("unm",username);
            session.setAttribute("pass",password);
            response.sendRedirect("instruction.jsp");
        }
        else
        {
         out.println("<script>alert('Invalid username or password');document.location.href='login.html'</script>"); 
        }
        
        }catch(Exception x)
        {
            System.out.println("Problem reading "+x);
        }
    }
    
    @Override
    public void destroy()
    {
        
    }
}
