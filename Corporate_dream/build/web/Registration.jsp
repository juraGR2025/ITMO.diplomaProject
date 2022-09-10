<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String registrationBtn = request.getParameter("registrationBtn");//Получаем значение параметра кнопки input id="registration" name="registrationBtn".
            
                if(registrationBtn.equals("   Insert   ")){
                String FIO = request.getParameter("FioEmp");
                String birth = request.getParameter("birthEmp");
                String employment = request.getParameter("employmentEmp");
                String education = request.getParameter("educationEmp");
                String Nickname = request.getParameter("nicknameEmp");
                String Password = request.getParameter("Password");
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "1111_1");
                    Statement st = conn.createStatement();

                    String sql = "INSERT INTO technology_source.employee_list (emploee_name,date_of_birth,date_of_employment,education,employees_nickname,employee_password) Values ('"+FIO+"','"+birth+"','"+employment+"','"+education+"','"+Nickname+"','"+Password+"')";

                    st.execute(sql);
                    st.close();// Закрываем выражение st.
                    
                    if(st.isClosed()==true){
                       response.sendRedirect("work_table.jsp");
                        System.out.println("Data inserted.");
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
        
        <script charset="utf-8" src="./js/main.js"></script>
    </body>
</html>
