/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import util.SqlUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
@WebServlet(urlPatterns = {"/faculty"})
public class faculty extends HttpServlet 
{

    @Override
    public void init()
    {
        try {
            SqlUtil.connectDb();   
            System.out.println("init is called");
        } catch (Exception ex) {
            System.out.println("errror in connection of database"+ex);  
        }
    }
    
    @Override
    public void service(HttpServletRequest req,HttpServletResponse res)
    {
        int no=0;
     String q_no=req.getParameter("ques_no");
     String question=req.getParameter("question");
     String op_a=req.getParameter("op_a");
     String op_b=req.getParameter("op_b");
     String op_c=req.getParameter("op_c");
     String op_d=req.getParameter("op_d");
     String correct=req.getParameter("correct_ans");
       // System.out.println("-->"+q_no+""+question+"<---");
     
    if(req.getParameter("submit")!=null)
    {
          String qry="insert into Question (question_no,question,option_a,option_b,option_c,option_d,correct_ans) values('"+q_no+"','"+question+"','"+op_a+"','"+op_b+"','"+op_c+"','"+op_d+"','"+correct+"');";
          System.out.println(qry);
          
            
        try {
            no= SqlUtil.insert(qry);
          // PrintWriter out=res.getWriter();
          // out.print("value inserted successfully");
           // out.println("<script>alert('Submitted question Successfully');</script>");
            res.sendRedirect("add_question.jsp");
             } 
         catch (Exception ex)
         {
              System.out.println("error in insertion"+ex);   
              System.out.println("error in insertion"+ex.getMessage());   
         }
    }
   }
}
