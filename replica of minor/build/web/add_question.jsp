<%-- 
    Document   : add_question
    Created on : Mar 26, 2019, 12:20:38 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add_question Page</title>
        
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="all" href="css/add_question.css">
               <style>
            label
            {
                font-size: 30px;
            }
            .save
            {
                font-size: 30px;
                border-radius: 50px;
                background-color: yellowgreen;
            }
           td
           {
               font-size: 30px;
           }
        </style>
    </head>
    <body>
         <%
          //for preventaion from unauthorized user
       
           HttpSession sessi=request.getSession();
            response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("pragma","no-cache");//http 1.0
            response.setHeader("expires","0");//proxies
           
            if(sessi.getAttribute("unm")==null)
            {
               response.sendRedirect("login.html");
            }  
      
         %>
         
        <div class="container">
            <header class="headerbar top"><h1 style="font-size: 40px">Question insertion</h1> </header>
            <aside class="leftbar">
                <div>
                    <form action="faculty">  
                    <fieldset>
                        <label for="q_no">Question number</label>
                        <input type="text" id="ques_no" name="ques_no" >
                    </fieldset>  

                    <fieldset>
                        <label for="question" >Enter Question</label>
                        <textarea rows="4" id="question" name="question" ></textarea>
                    </fieldset>  
                     <fieldset>
                        <label for="op_a" >option_A</label>
                        <input type="text" id="op_a" name="op_a">
                    </fieldset>  
                     <fieldset>
                        <label for="op_b" >option_B</label>
                        <input type="text" id="op_b" name="op_b" >
                    </fieldset>  
                     <fieldset>
                        <label for="op_c" >option_C</label>
                        <input type="text" id="op_c" name="op_c" >
                    </fieldset> 
                     <fieldset>
                        <label for="op_D" >option_d</label>
                        <input type="text" id="op_d" name="op_d">
                    </fieldset>  
                       <fieldset>
                        <label for="ans" >correct_ans</label>
                        <input type="text" id="correct" name="correct_ans">
                    </fieldset>
                    <fieldset>
                        <input type="submit" class="save" name="submit" value="save">
                    </fieldset>
               </form>   
            </div>
        </aside> 
            
            <aside class="rightbar">
                <table id="ques_table">
                    <thead>
                        <tr>
                            <th>s_no</th>
                            <th>question</th>
                            <th>option_a</th>
                            <th>option_b</th>
                            <th>option_c</th>
                            <th>option_d</th>
                            <th>correct</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody id="table_rows">
                        <%
                   try
                   {   SqlUtil.connectDb();
                        String qry="select * from question";
                       ResultSet rs= SqlUtil.read(qry);
                       while(rs.next())
                       {
                        %>  
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                           <td><%=rs.getString(5)%></td>
                           <td><%=rs.getString(6)%></td>
                           <td><%=rs.getString(2)%></td>  
                           <td>
                               <form action="edit.jsp">
                               <input type="hidden" name="hidden" value="<%=rs.getString(1)%>">
                               <input type="submit" class="c1"  value="EDIT"><br/> 
                              </form>
                               <form action="delete_question.jsp">
                                   <input type="hidden" name="hidden" value="<%=rs.getString(1)%>">
                                   <input type="submit" class="c1" value="delete">
                               </form></td>
                        </tr>
                        <%
                            }
                       } catch(Exception ex)
                     {
                      System.out.println("error in add_question.jsp"+ex);
                     }
                        %>
                    </tbody>
                </table>
            </aside>
            <footer class="headerbar bottom"></footer>
        </div>
       
    </body>
</html>
