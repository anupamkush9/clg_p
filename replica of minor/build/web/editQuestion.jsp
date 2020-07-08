       <%@page import="util.SqlUtil"%>
<%  
             String q_no=request.getParameter("hidden");
          //     System.out.println("edit question hidden value is "+q_no);
                String question_noo=request.getParameter("ques_no");
                String op_aa=request.getParameter("op_a");
                String op_bb=request.getParameter("op_b");
                String op_cc=request.getParameter("op_c");
                String  op_dd=request.getParameter("op_d");
                String questionn=request.getParameter("question");
                 String c_anss=request.getParameter("correct_ans");
           //     System.out.println("3rd-------"+question_noo+"  "+questionn+" "+op_aa+"****"+op_bb+op_cc+op_dd);       


        String query="update question set Question_no='"+question_noo+"',correct_ans='"+c_anss+"',"
           + "option_a='"+op_aa+"',question='"+questionn+"',option_b='"+op_bb+"',option_c='"+op_cc+"',"
           + "option_d='"+op_dd+"' where Question_no='"+q_no+"'";
       //  System.out.println("update qry---->"+query);
         SqlUtil.connectDb();
         SqlUtil.update(query);
         response.sendRedirect("add_question.jsp");

       %>
