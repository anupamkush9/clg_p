/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// 
        var total_sec=60*20;
        var c_min=parseInt(total_sec/60);
        var c_sec=parseInt(total_sec%60);
   
        function checkTime()
        { 
           document.getElementById("quiz-time-left").innerHTML='time left:'+c_min+'min'+c_sec+'sec';
            if(total_sec<=0)
            {
                setTimeout('document.quiz.submit()',1);
            }
            else
            {
             total_sec=total_sec-1;
             c_min=parseInt(total_sec/60);
             c_sec=parseInt(total_sec%60);    
            }
        }
          var set_timeid=setTimeout('checkTime()',1000);  
   