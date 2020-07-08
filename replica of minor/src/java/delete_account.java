
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

/**
 *
 * @author asus
 */
@WebServlet(urlPatterns = {"/delete_account"})
public class delete_account extends HttpServlet {
@Override
    public void init()
 {    try
    {
        SqlUtil.connectDb();
    }
    catch(Exception ex)
    {
        System.out.println("error in db connection"+ex);
    }
}
    @Override
    public void service(HttpServletRequest req,HttpServletResponse resp) throws IOException
    {
        
         HttpSession session=req.getSession();
            resp.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            resp.setHeader("pragma","no-cache");//http 1.0
            resp.setHeader("expires","0");//proxies
           
            if(session.getAttribute("unm")==null)
            {
               resp.sendRedirect("view.jsp");
            }
       
  /* try
   {
       ResultSet read = SqlUtil.read(sel_all);
   while(read.next())
   {
        usr_nm=read.getString("username");
   }
   }
   catch(Exception ex)
   {
       System.out.println("error in reading data------>"+ex);
   }*/
          String usr_nm=null;
      usr_nm=req.getParameter("hidden");
        String query="delete from student_profile where username="+"'"+usr_nm+"'"+";";
       
       System.out.println(query);
        try
        {
           SqlUtil.delete(query);
            PrintWriter out=resp.getWriter();
              out.println("<script>alert('Deleted Successfully');document.location.href='view.jsp';</script>");

          //out.println("<p style='background:blue; color:white;';>submitted sucessfully<p>"); 
        }
        catch(Exception ex)
        {
            System.out.println("error in query---->"+ex);
        }
                
    }
}