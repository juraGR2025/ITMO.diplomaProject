<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="./css/cssDream.css"/>
<style type="text/css">
    <%@include file="./css/cssDream.css" %>
</style>
<title>Insert title here</title>
</head>
<body>
    <form method="post">
<fieldset>
        <legend><h3>Задайте параметры технологического процесса</h3></legend>
         <br />
         <p>Выберите виды работ</p>
            <input class="WorkCheckbox" type="checkbox" name="maintenance_year" value="_year"/>maintenance year
            <input class="WorkCheckbox" type="checkbox" name="maintenance_month" value="_month"/>maintenance month
            <input class="WorkCheckbox" type="checkbox" name="maintenance_week" value="_week"/>maintenance week
            <input class="WorkCheckbox" type="checkbox" name="Work" value="work">work
            <p><input class="tabelBtn" id="use-input" type="submit" value="Apply" ></p><!--onclick="return false;" оставляет на исходной странице-->

</fieldset>
    </form>
<br />
<br />
<form method="post">
<table>
<tr>
<td>ID</td>
<td>ID NAME</td>
<td>Description</td>
<td>Labor costs</td>
<td>Modify</td>
<td>Set the Sequence of Operations</td>
<td>Select a related Operation</td>
<td>Save</td>
</tr>
<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL";
String username="root";
String password="1111_1";
String query="SELECT * FROM Workflow_bricks";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>

<tr>
    <td id="table"><%=rs.getInt("ID") %></td>
    <td><%=rs.getString("id_brick") %></td>
    <td><%=rs.getString("step_instructions") %></td>
    <td><%=rs.getString("labor_costs")%></td>
    <td><a class="login-link" href="./Register_page.jsp">Modify</a></td>
    <td>
        <p><select id="chief-work" name="list1" required>
         <option value="выберите из списка" >Выберите из списка</option>
         <option value="2">операция <%=rs.getString("ID") %> выполняется строго после</option>
         <option value="3">операция <%=rs.getString("ID") %> выполняется сразу же после</option>
         <option value="5">операция <%=rs.getString("ID") %> выполняется строго перед</option>
         <option value="7">операция <%=rs.getString("ID") %> выполняется непосредственно перед</option>
         <option value="11">операция <%=rs.getString("ID") %> выполняется после или одновременно с</option>
         <option value="13">операция <%=rs.getString("ID") %> выполняется перед или одновременно с</option>
         <option value="17">операция <%=rs.getString("ID") %> выполняется одновременно с</option>
         <option value="1">операция <%=rs.getString("ID") %> должна быть выполнена</option>
         <option value="0">операция <%=rs.getString("ID") %> не должна быть выполнена</option>
         </select></p>
        
        
    </td>
    <td><%=rs.getInt("ID")%></td>
    <td><input  id="save" name="saveBtn" type="submit" class="tabelBtn" value="Save"/></td>
    
    
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

</form>
<br />
<p><input class="tabelBtn" id="add-input" type="submit" value="Add" ></p>
</body>
<script charset="utf-8" src="./js/main.js"></script>
</html> 