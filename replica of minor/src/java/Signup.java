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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/Signup"})
public class Signup extends HttpServlet {

    @Override
    public void init()
    {
        try{
        //SqlUtil.connectDb();
        SqlUtil.getConnection();
        SqlUtil.createDatabase();
        SqlUtil.createTable();
      /*  String qry="create table if not exists student_login(s_no int auto_increment unique key,username varchar(30),password varchar(30), foreign key (username) references profile (username) on delete cascade on update cascade);";
            System.out.println("Query to login creation"+qry);
      
        String qr="create table if not exists student_profile(s_no int auto_increment unique key,username varchar(30) primary key,email varchar(40),gender varchar(10),city varchar(100));";     
        System.out.println("Query to profile creation"+qr);
        SqlUtil.create(qr);
        SqlUtil.create(qry);  */    
        }
      catch(Exception ex)
      {
          System.out.println("Problem in creation "+ex);
      }
    }
    
    @Override
    public void service(HttpServletRequest request,HttpServletResponse response)
    {
        String username=request.getParameter("unm");
        String password=request.getParameter("pass");
        String mob_no=request.getParameter("mob_no");
        String email=request.getParameter("email");
        String gender=request.getParameter("gender");
        String city=request.getParameter("city");
         String query="select * from profile";
     /*     int i=0;
        try {
            ResultSet rs1= SqlUtil.read(query);
               while(rs1.next())
               {
              i++;     
               }
        } catch (Exception ex) {
            System.out.println("error in signup page"+ex);
        }
     
          
        int s_no=i;*/  
      String qry2="insert into student_profile (username,email,gender,contact_no,city) values('"+username+"','"+email+"','"+gender+"','"+mob_no+"','"+city+"');";
        String qry1="insert into student_login (username,password) values('"+username+"','"+password+"');";
       
       try{
         PrintWriter out=response.getWriter();
        SqlUtil.insert(qry2);
      //     System.out.println("----------->"+qry1+"  "+qry2);
        SqlUtil.insert(qry1);
       out.println("<script>alert('Submitted Successfully');document.location.href='login.html';</script>");
     //   out.println("<p style='background:blue;color:white;'d ;>Submittesuccessfully</p>");
     //      System.out.println("account created sucessfully");
       }catch(Exception ex)
       {
           System.out.println("*************Problem in insertion************** "+ex);
       }
        
    }
        
    @Override
    public void destroy()
    {
        
    }
}
