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

<table>
<tr>
<td>ID</td>
<td>NAME</td>
<td>SKILL</td>
<td>ACTION</td>
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
</body>
<script charset="utf-8" src="./js/main.js"></script>
</html> 