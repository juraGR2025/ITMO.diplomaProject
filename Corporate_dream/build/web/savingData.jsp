<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <style type="text/css">
    <%@include file="./css/cssDream.css" %>
        </style>
        <title>Saving Page</title>
    </head>
    <body>
       <%
           String saveDataBtn = request.getParameter("saveBtn");//Получаем значение параметра кнопки input id="save" name="saveBtn" type="submit" class="tabelBtn" value="Save".
            
                if(saveDataBtn.equals("Save")){
                   
                    String str1 = request.getParameter("ID-Workflow");
                    String str2 = request.getParameter("SQLselect");/*//Параметр из <select name="optionLogick" id="chief-work" name="list1" required>*/
                    String str3 = request.getParameter("related Operation");/*//Параметр из <input type="text" name="rs.getInt("ID")_related Operation" />*/
     
                String identification_label = "beginn:" + str1 + "-" + str2 + "-" + "end:" + str3;
      
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "1111_1");
                    Statement st = conn.createStatement();

                    String sql = "INSERT INTO technology_source.technology_process_code (identification_code_label) Values ('"+identification_label+"')";

                    st.execute(sql);
                    st.close();// Закрываем выражение st.
                    
                    if(st.isClosed()==true){
                       response.sendRedirect("work_table.jsp");
                        System.out.println("Data inserted.");
                    }
                    else{
                        response.sendRedirect("work_table.jsp"); 
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
