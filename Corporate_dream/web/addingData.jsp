<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <style type="text/css">
    <%@include file="./css/cssDream.css" %>
        </style>
        <title>Adding Page</title>
    </head>
    <body>
        
        <%
           String addingDataBtn = request.getParameter("addDataBtn");//Получаем значение параметра кнопки input id="registration" name="registrationBtn".
            
                if(addingDataBtn.equals("Insert")){
                String id_brick = request.getParameter("id_brick");
                String step_instructions = request.getParameter("step_instructions");
                String labor_costs = request.getParameter("labor_costs");
                String minimum_person = request.getParameter("minimum_person");
                String maximum_person = request.getParameter("maximum_person");

                try{
                    Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "1111_1");
                    Statement st = conn.createStatement();

                    String sql = "INSERT INTO technology_source.Workflow_bricks (id_brick, step_instructions, labor_costs, minimum_person, maximum_person) Values ('"+id_brick+"','"+step_instructions+"','"+labor_costs+"','"+minimum_person+"','"+maximum_person+"')";

                    st.execute(sql);
                    st.close();// Закрываем выражение st.
                    
                    if(st.isClosed()==true){
                       response.sendRedirect("work_table.jsp");
                        System.out.println("Data inserted.");
                    }
                    else{
                        response.sendRedirect("addingData_page.jsp"); 
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