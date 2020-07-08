<%-- 
    Document   : delete_question
    Created on : Mar 28, 2019, 3:03:10 AM
    Author     : asus
--%>

<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String s=request.getParameter("hidden");
        System.out.println("value of_hidden is="+s);
      try
      {
       SqlUtil.connectDb();
       String qry="delete from question where Question_no ='"+s+"'";
       //System.out.println("qry is="+qry);
       SqlUtil.delete(qry);
       %>
    
       <%
       //out.println("value is successfully deleted");
       response.sendRedirect("add_question.jsp");
      }catch(Exception ex){
              System.out.println("error in deletion of question"+ex);                      
              }
        
         %>
    </body>
</html>
