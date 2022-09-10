<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="./css/cssDream.css"/>
    </head>
    <body>
        <a href="./index.html"><img id= "go-home" src="./Dom.png"></a>
        <h4><a href="./Register_page.jsp">Зарегистрироваться</a></h4>
    <center>
        <h3>User Login</h3>
          <form name="loginP" method="post" action="Authentication.jsp">
              <table>
                  <tr>
                      <td><label>ID:</label></td>
                      <td><input type="text" name="idEmp" value=""/><br></td><!-- Поле ввода никнейма сотрудника. -->
                  </tr><!--Конец строки в таблице.-->
                  <tr>
                      <td><label>Password:</label></td>
                      <td><input type="text" name="Password" value=""/><br></td><!-- Поле ввода пароля. -->
                  </tr>
                  <tr>

                      <td colspan="2"><center><input id="authorization" name="submitBtn" type="submit" value="    Accept    "/></center><br></td>

                  </tr>
              </table>
          </form>
    </center>
    </body>
    <script charset="utf-8" src="./js/main.js"></script>
</html>
