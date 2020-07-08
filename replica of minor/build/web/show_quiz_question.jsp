<%-- 
    Document   : show_quiz_question
    Created on : Mar 9, 2019, 7:04:33 PM
    Author     : asus
--%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="all" href="css/show_quiz.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
        <script type="text/JavaScript">
    <!--for disabling the right click  -->  
    document.addEventListener('contextmenu', event => event.preventDefault());           
<!--for disabling the right click -->
function killCopy(e){
return false
}
function reEnable(){
return true
}
document.onselectstart=new Function ("return false")
if (window.sidebar){
document.onmousedown=killCopy
document.onclick=reEnable
}

</SCRIPT>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examination Page</title>
         <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
       <!-- sometime we need to link .js after the body ending tag>-->
       <style>
/*       #quiz_sumit
       {
           width: 200px;
           background-color: greenyellow;
           height: 80px;
           border-radius: 10px;
       }*/
       .td_class
       {
           border-radius: 10px;
           background-color: gold;
       }
       .td_i
       {
           background: gold;
       }
       </style>
      </head>
 <body onload="sendreq(1);call_timer();"> 
     
      <%
            // FOR PREVENTION FROM THE UNAUTHORIZED USER
            String user_nmm;
           response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("pragma","no-cache");//http 1.0
            response.setHeader("expires","0");//proxies
           
           user_nmm=(String)session.getAttribute("unm");
           
            if(user_nmm==null)
            {
               response.sendRedirect("login.html");
            }
       %>
     
    
     <div class="row">
  <div class="col-sm-9">
           
      <div class="container">  
       <h2 class="left" id="left"></h2>
      </div>
  </div>
         
 
         <div class="col-sm-3" style="float:right; width: auto; position: relative; right: 20px;">
     <h2><div style="color: red" style="font-size:15px"  id="quiz-time-left" ></div>
  </h2> 
         
 <div class="pagination" >
     <table >
			<tr>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="1"  value="1" onClick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="2" value="2" onclick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="3" value="3" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="4" value="4" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="5" value="5" onclick="sendreq(this.value)"/></td>
                        </tr>  
                        <tr>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="6" value="6" onClick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="7" value="7" onclick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="8" value="8" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="9" value="9" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="10" value="10" onclick="sendreq(this.value)"/></td>
                        </tr> 
                        <tr>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="11" value="11" onClick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn"  id="12" value="12" onclick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn"  id="13" value="13" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="14" value="14" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn"  id="15" value="15" onclick="sendreq(this.value)"/></td>
                        </tr> 
                        <tr>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="16" value="16" onClick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="17" value="17" onclick="sendreq(this.value)"/></td>
                            <td class="td_class"><input class="td_i" type="button" name="btn" id="18" value="18" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="19" value="19" onclick="sendreq(this.value)"/></td>
                             <td class="td_class"><input class="td_i" type="button" name="btn" id="20" value="20" onclick="sendreq(this.value)"/></td>
                        </tr> 
                  </table>
     </div>
      <hr style="border: 10px solid #003333; border-radius:10px;">
<div class="p-3 mb-2 bg-primary text-white">.blue color visited</div>
<div class="p-3 mb-2 bg-success text-white">.green color for attempted</div>
<div class="p-3 mb-2 bg-warning text-dark">.Gold color for unvisited</div>
<form method="post" name="quiz"  action="result.jsp">
                <button type="submit"  class="btn btn-success btn-lg" id="quiz_sumit" >Submit quiz</button>
  <div id="res"></div>
    </form> 
       </div>
</div>
     </div>         
         
         
<!--       <div id="ins">

           <fieldset style="
          border:5px solid #2429A1;
           width: 200px;
           margin-left: 10px;" > 
              <legend style="font-size: 20px;">instructions</legend>
       <label style="font-size: 20px;">Not VISITED</label>
       <input type="button" style="background-color: violet;"><br>
       
         <label style="font-size: 20px;">VISITED</label>
         <input type="button" style="background-color: yellow;"><br>
         
         <label style="font-size: 20px;">ATTEMPT</label>
         <input type="button" style="background-color: greenyellow;">
          
          </fieldset> 
       </div>-->
         
 

   
       <!-- next and prev button can be ignore-->         
 <!--   <div class="n">
        <input type="button" name="next_btn" class="next" onclick="call_timer()" value="next &raquo">	       
 </div>
 <div class="p">
     <input type="button" name="prec_btn" class="previous" onclick="" value="&laquo previous">
 </div> 
       -->
       
   <script type="text/javascript" src="js/timer.js"></script>    
    </body>
    
   
   
   
<!--   <video id="video" autoplay></video> 
    -->    
   <script type="text/javascript" src="js/timer.js"></script>  
   
 </body>
 <script>
     function preventBack()
     {
         window.history.forward();
     }
     setTimeout("preventBack()",0);
     window.onunload=function (){null};
     function  submition()
     {
       document.getElementsByName("quiz").submit();
     }
     
     // for video and audio capturing        
//   var video=document.getElementById('video');
//   if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia)
//    {
//     navigator.mediaDevices.getUserMedia({video:true,audio:true}).then(function (stream)
//      {
//       // body...
//       video.src=window.URL.createobjectURL(stream);
//     });
//   }
   
     function call_timer()
      {
          setInterval('checkTime()',1000);    
      } 
      
    $(window).blur(function() {
    if(!confirm("warning do not leave the page otherwise your test automatically will get submitted")) {
        if(!document.hasFocus()) {
            //alert("warning do not leave the page otherwise your test automatically will get submitted");
          document.getElementById("quiz_sumit").click();
            }
    }
});   
     
       function save(value,n){
            document.getElementById(n).style.background='green';
               xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=function ()
         {
            if(this.readyState == 4 && this.status == 200)
            {  var text=this.responseText;
              
           } 
       };
  var url="http://localhost:8080/replica%20of%20minor/save_ans.jsp?q_no="+value+"&n="+n;
           xmlhttp.open("GET",url,true);
            xmlhttp.send();
         }
         
 var xmlhttp;
        function sendreq(value)
        {
             document.getElementById(value).style.background='blue';
           
            //console.log("sendreq fun() called");
           // document.getElementById("mydiv").innerHTML="sending data........."+value;
             xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=function ()
        {
           //  alert("ready state has changed");
            if(this.readyState == 4 && this.status == 200)
            {
                var text=this.responseText;
                
                document.getElementById("left").innerHTML=text;
            }
        };
        
            var url="http://localhost:8080/replica%20of%20minor/ques_display.jsp?q_no="+value;
            xmlhttp.open("GET",url,true);
            xmlhttp.send();
          // alert("ajax is sent successfully");
          
        }	       
     </script>

</html>
