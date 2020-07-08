<%-- 
    Document   : save_ans
    Created on : Mar 27, 2019, 2:36:04 PM
    Author     : asus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="util.SqlUtil"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.*"%>
<%@page import="util.SqlUtil.*"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      /*      int i,check=0;
            try{
                     SqlUtil.connectDb();

             //  Class.forName("com.mysql.jdbc.Driver");
                
            //  Connection conn= (Connection)DriverManager.getConnection("jdbc:mysql://localhost/quiz","root","root");
              //  if(check<1)
           //         String str="insert into std_ans(question_no) values(?);";
                    
//                for(i=1;i<=20;i++)
              //  PreparedStatement pr=SqlUtil.conn.prepareStatement(str);                
           //     SqlUtil.insert(str);
               // pr.setInt(1,22);
                
//                System.out.println("-----"+i+"------"+str);
//                pr.executeUpdate(str);
              //  pr.executeUpdate(str);
               // check++;   
            }catch(Exception ex)
            {
               System.out.println("error in putting default value"+ex);
            }*/
        String choice=request.getParameter("q_no");
       String q_no=request.getParameter("n");
      //  System.out.println("question_no="+q_no+" choice is"+choice);
        
        try
        {
         String query="update std_ans set question_no='"+q_no+"',"
              + "answer='"+choice+"' where question_no='"+q_no+"'";
         SqlUtil.update(query);
         %>
     
       <%  }
        catch(Exception ex)
        {
            System.out.println("error in save ans "+ex);
        }
        
        %>
    </body>
</html>
