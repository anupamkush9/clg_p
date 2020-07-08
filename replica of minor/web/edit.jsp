<%-- 
    Document   : edit
    Created on : Mar 28, 2019, 4:24:43 AM
    Author     : asus
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css" media="all" href="css/edit.css">
        <style>
        
        </style>
    </head>
   
    <body> 
        
     <%! String op_a,op_b,op_c,op_d,question,question_no,c_ans; %>
    <%
        PrintWriter op=response.getWriter();
        String q_no=request.getParameter("hidden");
       // System.out.println("on edit q_no is="+q_no);
        String qry="select * from question where Question_no='"+q_no+"'";
      try
      {      SqlUtil.connectDb();
             ResultSet rs=SqlUtil.read(qry);
          while(rs.next())
          {%>
     <%  
          String question_no=rs.getString(1);
         String op_a=rs.getString(3);
         String op_b=rs.getString(4);
         String op_c=rs.getString(5);
         String op_d=rs.getString(6);
         String question=rs.getString(7);
          String c_ans=rs.getString(2);
       //  System.out.println("p--------"+question_no+"  "+question+" "+op_a+op_b+op_c+op_d);
       
%>
           <div class="container">
               <header class="headerbar top" style="text-decoration: underline;"><h1>Edit  Question</h1> </header>
                <aside class="leftbar">
                <div>
                    <form action="editQuestion.jsp">  
                    <fieldset>
                        <label for="q_no" >Question number</label>
                        <input type="text"  name="ques_no" value="<%=question_no%>" >
                    </fieldset>  

                    <fieldset>
                        <label for="question" >Enter Question</label>
                        <textarea rows="4" id="question"  name="question"><%=question%></textarea>
                    </fieldset>  
                     <fieldset>
                        <label for="op_a" >option_A</label>
                        <input type="text"  name="op_a" value="<%=op_a%>">
                    </fieldset>  
                     <fieldset>
                        <label for="op_b" >option_B</label>
                        <input type="text"  name="op_b" 
                        value="<%=op_b%>">
                    </fieldset>  
                     <fieldset>
                        <label for="op_c">option_C</label>
                        <input type="text"  name="op_c" value="<%=op_c%>">
                    </fieldset> 
                     <fieldset>
                        <label for="op_D" >option_d</label>
                        <input type="text" id="op_d" name="op_d" value="<%=op_d%>">
                    </fieldset>  
                       <fieldset>
                        <label for="ans" >correct_ans</label>
                        <input type="text" id="correct" name="correct_ans" value="<%=c_ans%>" >
                    </fieldset>
                    <fieldset>
                        <input type="submit" class="id" name="btn" value="save">
                    </fieldset>
                    <input type="hidden" name="hidden" value="<%=rs.getString(1)%>">
               </form>  
           </div>
        </aside> 
           <footer class="headerbar bottom"></footer>
        </div>
    
          <%  
   
        } 
   }
        catch(Exception ex)
        {
            System.out.println("error on edit page"+ex);
        }
        %>  
        </body>
</html>   
    

