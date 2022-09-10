<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="./css/cssDream.css"/>
        <title>Authentication</title>
    </head>
    <body>
        <%
            String submitBtn = request.getParameter("submitBtn");//Получаем значение параметра кнопки input id="authorization" name="submitBtn".
                        
            if(submitBtn.equals("    Accept    ")){
                String id = request.getParameter("idEmp");
                String Password = request.getParameter("Password");
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "1111_1");
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM employee_list WHERE employees_nickname='"+ id +"' AND employee_password='"+ Password +"'");
                    if(rs.next()){
                        response.sendRedirect("work_table.jsp");
                    }
                    else{
                        response.sendRedirect("Register_page.jsp");
                    }
                }
                catch(Exception e){
                    out.println(e);
                }
            }

            %>

    </body>
    <script charset="utf-8" src="./js/main.js"></script>
</html>
