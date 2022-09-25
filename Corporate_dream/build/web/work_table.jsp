<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="javax.swing.*"%>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="./css/cssDream.css"/>
<style type="text/css">
    <%@include file="./css/cssDream.css" %>
</style>
<title>Desktop</title>
<script charset="utf-8" src="./js/main.js"></script>
</head>
<body>
    <a href="./index.html"><img id= "go-home" src="./Dom.png"></a>
    <form method="post" name="findeOperation">
<fieldset>
        <legend><h3>Задайте параметры технологического процесса</h3></legend>
         <br />
         <p>Выберите виды работ</p>
         <div>
            <input class="WorkCheckbox" type="checkbox" name="maintenance_year" value="_year"/>maintenance year
            <input class="WorkCheckbox" type="checkbox" name="maintenance_month" value="_month"/>maintenance month
            <input class="WorkCheckbox" type="checkbox" name="maintenance_week" value="_week"/>maintenance week
            <input class="WorkCheckbox" type="checkbox" name="Work" value="work"/>work
            <input class="WorkCheckbox" type="checkbox" name="All" value="all"/>all
         </div>
            <p>
           
                <input class="tabelBtn" type="submit" name="formBtn" id="use_input" value="Apply"/>
                <input id="SQL-query" name="SQLquery" type="hidden" >
            
            </p>

</fieldset>
    </form>
<br />
<br />

<form action="./savingData.jsp" name ="jspHidden" method="post">
<table id="work-table">
<tr>
<th>ID</th>
<th>ID NAME</th>
<th>Description</th>
<th>Labor costs</th>
<th>Modify</th>
<th>Set the Sequence of Operations</th>
<th>Enter the ID of the related Operation</th>
<th>Save</th>
</tr>

<%
    String strSQLquery = request.getParameter("SQLquery");//
    
try
{

Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL";
String username="root";
String password="1111_1";
String query=strSQLquery; //"SELECT * FROM Workflow_bricks WHERE id_brick LIKE '%work_e%'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
int count = 0;
while(rs.next())
{ 
%>

<tr id="rowTable">
    <td name="id" id="tableID">
        <%=rs.getInt("ID") %>
        <input id="ID-Workflow_bricks" name="ID-Workflow" type="hidden" >
    </td>
    <td name="id_brick"><%=rs.getString("id_brick") %></td>
    <td name="step_instructions"><%=rs.getString("step_instructions") %></td>
    <td name="labor_costs"><%=rs.getString("labor_costs")%></td>
    <td><a class="login-link" href="./Register_page.jsp">Modify</a></td>
    <td><p name="select-option">
        <select name="optionLogick" id="chief-work" name="list1" required>
         <option  value="выберите из списка" >Выберите из списка</option>
         <option name="option2" value="2">операция <%=rs.getString("ID") %> выполняется строго после</option>
         <option name="option3" value="3">операция <%=rs.getString("ID") %> выполняется сразу же после</option>
         <option name="option5" value="5">операция <%=rs.getString("ID") %> выполняется строго перед</option>
         <option name="option7" value="7">операция <%=rs.getString("ID") %> выполняется непосредственно перед</option>
         <option name="option11" value="11">операция <%=rs.getString("ID") %> выполняется после или одновременно с</option>
         <option name="option13" value="13">операция <%=rs.getString("ID") %> выполняется перед или одновременно с</option>
         <option name="option17" value="17">операция <%=rs.getString("ID") %> выполняется одновременно с</option>
         <option name="option1" value="1">операция <%=rs.getString("ID") %> должна быть выполнена</option>
         <option name="option0" value="0">операция <%=rs.getString("ID") %> не должна быть выполнена</option>
         </select>
         <input id="SQL-select" name="SQLselect" type="hidden" >
     </p>
    </td>
    
    <td name="id_brick_next">
        
        <input id="id_next_brick" type="text" name="related Operation" /><!<!--  -->
        
    </td>
    <td>

        <input action="./savingData.jsp"  id="save" name="saveBtn" type="submit" class="tabelBtn" value="Save"/>
    
    </td>
    
</tr> 
    <%
        }
    %>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
        }
catch(Exception e)
{
    e.printStackTrace();
    }

%>
<br />
</form>
<br />

<form action="./addingData_page.jsp" name="addingButton" target="_blank">
    <p><input class="tabelBtn" name="saveData" id="add-input" type="submit" value="Add" ></p>
</form>

</body>

<script charset="utf-8" src="./js/main.js"></script>
</html> 