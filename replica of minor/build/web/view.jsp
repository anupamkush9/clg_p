<%-- 
    Document   : admin
    Created on : Apr 1, 2019, 7:26:00 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" media="all" href="css/view.css">
      
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
    <h1 style="text-align: center;font-size: 60px;color: greenyellow; 
        background-color: orchid">LOGIN AS ADMIN</h1>
   <form action="logout"><input type="submit" style="width: 100px;
           height:40px;font-size: 20px;  float: right;" value="Logout"> </form><br> 
             
    
             <header class="headerbar top"><h1 style="font-size: 40px;text-decoration: underline">View all students Information</h1> </header>
    
            <aside class="rightbar">
                <table id="ques_table">
                    <thead>
                        <tr>
                            <th>s_no</th>
                            <th>username</th>
                            <th>Email</th>
                            <th>gender</th>
                            <th>contact_no</th>
                            <th>City</th>
                            <th>delete account</th>
                        </tr>
                    </thead>
                    <tbody id="table_rows">
                        <%
                   try
                   {   SqlUtil.connectDb();
                        String qry="select * from student_profile";
                       ResultSet rs= SqlUtil.read(qry);
                       while(rs.next())
                       {
                        %>  
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                           <td><%=rs.getString(5)%></td>
                           <td><%=rs.getString(6)%></td>
                        <td>
                            <form action="delete_account" >
                                   <input type="hidden" name="hidden" value="<%=rs.getString(2)%>">
                                   <input type="submit" style="text-align: center; "class="c1" value="delete">
                               </form>
                        </td>
                        </tr>
                        <%
                            }
                       } catch(Exception ex)
                     {
                      System.out.println("error in admin.jsp page is="+ex);
                     }
                        %>
                    </tbody>
                </table>
            </aside>
            <footer class="headerbar bottom"></footer>
        </div>
       
    </body>
</html>
