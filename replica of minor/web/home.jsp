<%-- 
    Document   : home.jsp
    Created on : Feb 3, 2019, 5:02:06 AM
    Author     : asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body
            {
            background-image: url(image/background.jpg);   
            }
            form
            {
                
            }
            </style>
    </head>
    <body>
        
       
        <%
        /*    // FOR PREVENTION FROM THE UNAUTHORIZED USER
            response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("pragma","no-cache");//http 1.0
            response.setHeader("expires","0");//proxies
           
            if(session.getAttribute("unm")==null)
            {
               response.sendRedirect("login.html");
            }*/
        %>
        
        <div>
            <form action="logout"><input type="submit" value="Logout"> </form><br> 
            <form action="profile"><input type="submit" value="View Profile"> </form><br>
            <form action="delete_account"><input type="submit" value="Delete your Account"> </form><br>
          <!--  <a href="test.html"> appti test</a>   -->
            <br>
          <!--  <a href="add_question.jsp"> add question on test</a>  -->
            <form action="instruction.jsp"><input type="submit" value="attempt quiz"></form><br>
        </div>
    </body>
</html>
