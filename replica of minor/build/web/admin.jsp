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
        
            <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="stylesheet" type="text/css" media="all" href="css/view.css">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
         <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

          <style>
/*              input
              {
                  border-radius: 50px;
                  height: 100px;
                  background-color: violet;
              }
              .c1
              {
                  width: 400px;
                 border-radius: 50px;
                  height: 100px;
                  background-color: violet;
                  font-size: 30px;
                  
              }*/
              .card
    {
      border-radius: 0;
      box-shadow: 5px 5px 15px #e74c3c;
      transition: all 0.3s ease-in;
      -webkit-transition:all 0.3s ease-in;
      -moz-transistion:all 0.3s ease-in;
    }
    .card:hover
    {
      background-color: #e74c3c;
      color: #fff;
      border-radius: 5px;
      border:none;
      box-shadow: 5px 5px 10px #9E9E9E;
    }
    .card:hover h3,#team .card:hover i
    {
      color: #fff;
    }
     </style>
               
      <h1 style="text-align: center;font-size: 60px;color: greenyellow; 
        background-color: orchid">LOGIN AS ADMIN</h1
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
<!--    <h1 style="text-align: center;font-size: 60px;color: greenyellow; 
        background-color: orchid">LOGIN AS ADMIN</h1>
        
     <form action="logout"><input type="submit" style="width: 100px;
           height:40px;font-size: 20px;  float: right;" value="Logout"> </form><br> 
       
           <form action="add_question.jsp"><input type="submit" class="c1" name="view_all_std" value="add question on test link"></form><br>
    
           <form action="view.jsp"><input type="submit" class="c1" value="View All students"> </form><br>
           
      
    <form action="display_all_result.jsp"><input type="submit" class="c1" name="result" value="display_all_result"> </form><br>
           -->
           
      <form action="logout"><input type="submit" style="width: 100px;
           height:40px;font-size: 20px;  float: right;" value="Logout"> </form><br> 
     
      
<div class="container">
    <br><br>
    <div class="card-deck">
      <div class="card" style="width:400px"><div class="thumbnail">
        <a href="add_question.jsp">
            <img src="image/create_quiz.jpg" width="100%" height="300px" alt="..." class="rounded">
        </a>
    </div>
    <div class="card-body">
      <h4 class="card-title">Create Quiz</h4>
      <p class="card-text">This Module provides the facility to create quiz, update quiz, delete question, etc.</p>
      <a href="add_question.jsp" class="btn btn-primary stretched-link">Create Quiz</a>
    </div>
  </div>


    <div class="card" style="width:400px"><div class="thumbnail">
        <a href="view.jsp">
            <img src="image/student.jpg" width="100%" height="300px" alt="..." class="rounded">
        </a>
    </div>
    <div class="card-body">
      <h4 class="card-title">View Student Profile</h4>
      <p class="card-text">This module allow the admin to see all students Profile.</p>
      <a href="view.jsp" class="btn btn-primary stretched-link">See Profile</a>
    </div>
  </div>
    <div class="card" style="width:400px"><div class="thumbnail">
        <a href="selected.jsp">
            <img src="image/selected.png" width="100%" height="300px" alt="..." class="rounded">
        </a>
    </div>
    <div class="card-body">
      <h4 class="card-title">Selected Student</h4>
      <p class="card-text">This module Contains the list of all students who are selected.</p>
      <a href="selected.jsp" class="btn btn-primary stretched-link">View list</a>
    </div>
  </div>


    <div class="card" style="width:400px"><div class="thumbnail">
        <a href="display_all_result.jsp">
            <img src="image/result.jpg" width="100%" height="300px" alt="..." class="rounded">
        </a>
    </div>
    <div class="card-body">
      <h4 class="card-title">Result</h4>
      <p class="card-text">This module Contains the result of all students.</p>
      <a href="display_all_result.jsp" class="btn btn-primary stretched-link">Result</a>
    </div>
  </div>
  </div>
</div>
 
    </body>
</html>
