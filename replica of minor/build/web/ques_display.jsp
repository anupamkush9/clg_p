<%-- 
    Document   : ques_display
    Created on : Mar 19, 2019, 12:23:28 PM
    Author     : asus
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="util.SqlUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
     	.c22:hover {
                background-color:   #d9d9d9;
                border-radius: 10px;
                /*box-shadow: 10px 10px 10px #9E9E9E;*/
                box-shadow: 10px 10px 10px greenyellow;
                color: blue;
                
        -moz-box-shadow: 5px 4px 10px #1c87c9;
        -webkit-box-shadow: 5px 4px 10px #1c87c9;
            }
            .c11
            {
               background-color: #E0E0E0; 
            }
            .c22
            {
                border-radius: 10px;
              text-align: left;  
            }
     </style>
    </head>
    <body>
            
        <div id="di"></div>
       
  <%!    String s_no,question,op_a,op_b,op_c,op_d,correct;%> 
          <% 
                 String s=request.getParameter("q_no");
          try
          {
               String qry="select * from Question where Question_no='"+s+"'";
         // System.out.println("------------value by ajax is---------->"+s);
             //  System.out.println("==**qry is**=="+qry);
                 SqlUtil.connectDb();
                   ResultSet rs = SqlUtil.read(qry);
                   
           if (rs.next()) 
          {
           s_no=rs.getString("Question_no");
           question=rs.getString("question");
           op_a=rs.getString("option_a");
           op_b=rs.getString("option_b"); 
           op_c=rs.getString("option_c"); 
           op_d=rs.getString("option_d"); 
           correct=rs.getString("correct_ans"); 
            /*PrintWriter ou=response.getWriter();
            ou.println(question);
            ou.println(op_a);
            ou.println(op_b);
            ou.println(op_c);
            ou.println(op_d);*/
        
          }
              
          }catch(Exception ex)
          {
              System.out.println("exception is="+ex);
          }finally{
              SqlUtil.close();
          }
              
          try
          {
              
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn= DriverManager.getConnection("jdbc:mysql://localhost/quiz","root","root");
           Statement stmt1=conn.createStatement();
           ResultSet rs1=null;  
             String output=null;   
          SqlUtil.connectDb();
          String q="select answer from std_ans where question_no='"+s+"'";
          rs1=stmt1.executeQuery(q);
          if(rs1.next())
          {
           output=rs1.getString("answer");
          }
         // System.out.println("op of string is="+output);
          
          //for filling the radio box
           if(output==null)
          {
             // System.out.println("op is equal to the null");
             %>
              
            <script>
              /*   function ()
                 {
                      document.getElementById(<%=s_no%>).style.background='red';
           
                 }*/
   
             </script>
  
             <h1 style="color: blue;"> <%="Question : "+s_no%> </h1>
             <hr>
             <h1 style="color: blue;"> <%=" "+question%> </h1>
             <hr>
          <table >
              <tr class="c11" style=""> 
                  <td class="c22" width="1100px" >
                      <h3> <input type="radio" onclick="save(this.value,<%=s_no%>)" 
                                  name="choices" value="a" ><%=op_a%>
                        </h3> 
                  </td>                                                   
              </tr>
              
              <tr class="c11" style="">
                  <td  class="c22" width="1100px">
                      <h3>
                        <input type="radio" onclick="save(this.value,<%=s_no%>)"
                         name="choices" value="b"><%=op_b%> 
                       </h3>
                  </td>                   
              </tr>
              <tr class="c11" style="">
                  <td class="c22" width="1100px" >
                      <h3>
                          <input type="radio" onclick="save(this.value,<%=s_no%>)" 
                              name="choices" value="c"><%=op_c%>
                      </h3>                      
                  </td>          
              </tr>
              <tr class="c11" style="">
                  <td class="c22" width="1100px" >
                      <h3 ><input type="radio" onclick="save(this.value,<%=s_no%>)" 
                               name="choices" value="d"><%=op_d%>
                        </h3> 
                  </td>               
             </tr>
          </table>
            
          <%
          }
           
         else if(output.equals("a"))
          {
              System.out.println("op is equal to the a");
           %>
             <h1 style="color: blue;"> <%="Question : "+s_no%> </h1>
             <hr>
             <h1 style="color: blue;"> <%=" "+question%> </h1>
             <hr> <table>
              <tr>
              <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="a" checked="a"> <%=op_a%></h3> 
              </tr>
              <tr>
                  <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="b"> <%=op_b%></h3>  
              </tr>
              <tr>
                   <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="c"> <%=op_c%></h3>          
              </tr>
              <tr>
                    <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="d"> <%=op_d%></h3>
             </tr>
            
          </table>
         
           <%
          }
          
        else   if(output.equals("b"))
          {
              System.out.println("op is equal to the b");
          %>
              <h1 style="color: blue;"> <%="Question : "+s_no%> </h1>
             <hr>
             <h1 style="color: blue;"> <%=" "+question%> </h1>
             <hr>
             <table>
              <tr>
                  <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="a"> <%=op_a%></h3> 
              </tr>
              <tr>
              <h3><input type="radio"  onclick="save(this.value,<%=s_no%>)" name="choices" value="b" checked="b"> <%=op_b%></h3>  
              </tr>
              <tr>
                   <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="c"> <%=op_c%></h3>          
              </tr>
              <tr>
                    <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="d"> <%=op_d%></h3>
             </tr>
          </table>
         
          
          <%
          }
           
         else   if(output.equals("c"))
          {
              System.out.println("op is equal to the c");
           %>
              <h1 style="color: blue;"> <%="Question : "+s_no%> </h1>
             <hr>
             <h1 style="color: blue;"> <%=" "+question%> </h1>
             <hr>
             <table>
              <tr>
                  <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="a"> <%=op_a%></h3> 
              </tr>
              <tr>
                  <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="b"> <%=op_b%></h3>  
              </tr>
              <tr>
              <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="c" checked="c"> <%=op_c%></h3>          
              </tr>
              <tr>
                    <h3><input type="radio" onclick="save(this.value,<%=s_no%>)" name="choices" value="d"> <%=op_d%></h3>
             </tr>
          </table>
         
           <%
          }
            
         else  if(output.equals("d"))
          {
              System.out.println("op is equal to the d");
          %>
              <h1 style="color: blue;"> <%="Question : "+s_no%> </h1>
             <hr>
             <h1 style="color: blue;"> <%=" "+question%> </h1>
             <hr>
             <table>
              <tr>
              <h3><input type="radio" id="a" onclick="save(this.value,<%=s_no%>)" name="choices" value="a"> <%=op_a%></h3> 
              </tr>
              <tr>
                  <h3><input type="radio" id="b" onclick="save(this.value,<%=s_no%>)" name="choices" value="b"> <%=op_b%></h3>  
              </tr>
              <tr>
                   <h3><input type="radio" id="c" onclick="save(this.value,<%=s_no%>)" name="choices" value="c"> <%=op_c%></h3>          
              </tr>
              <tr>
              <h3><input type="radio" id="d" onclick="save(this.value,<%=s_no%>)" name="choices" value="d" checked="d"> <%=op_d%></h3>
             </tr>
            <!-- <tr>
             <input type="button" id="clr" onclick="clear_btn(<%=s_no%>)" name="clear"  style="width: 100px; background-color: greenyellow; border-radius:10px; "  value="clear"> 
             </tr>   -->
            </table>
         
                  <%
          }
         else{
             System.out.println("error on mathching the values ---->");
         }
        
          }catch(Exception ex)
          {
              System.out.println("error on checked the radio button="+ex);
          }
            %> 
<!--            <script>
                var video=document.getElementById('video');
   if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia)
    {
     navigator.mediaDevices.getUserMedia({video:true,audio:true}).then(function (stream)
      {
       // body...
       video.src=window.URL.createobjectURL(stream);
     });
   }
                </script>-->
     
              </body>
</html>
