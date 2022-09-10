<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="./css/cssDream.css"/>
        <title>Registration form</title>
    </head>
    <body onload="negativeReaction()">
        <a href="./index.html"><img id= "go-home" src="./Dom.png"></a>
        <center>
        <h3>User registration</h3>
        <h4>Заполните регистрационную форму:</h4>
          <form name="employeeRegistration" method="post" action="Registration.jsp">
              <table>
                  <tr><!-- Заполняем таблицу employee_list. -->
                      <td><label>Фамилия, имя, отчество:</label></td>
                      <td><input type="text" name="FioEmp" value=""/><br></td><!-- Поле ввода emploee_name VARCHAR(30). -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу employee_list. -->
                      <td><label>Дата рождения:</label></td>
                      <td><input type="text" name="birthEmp" value="гггг-мм-дд"/><br></td><!-- Поле ввода edate_of_birth DATE. -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу employee_list. -->
                      <td><label>Дата приема на работу:</label></td>
                      <td><input type="text" name="employmentEmp" value="гггг-мм-дд"/><br></td><!-- Поле ввода date_of_employment DATE. -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу employee_list. -->
                      <td><label>Образование:</label></td>
                      <td><input type="text" name="educationEmp" value=""/><br></td><!-- Поле ввода education VARCHAR(30). -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу employee_list. -->
                      <td><label>Nickname:</label></td>
                      <td><input type="text" name="nicknameEmp" value=""/><br></td><!-- Поле ввода employees_nickname VARCHAR(50). -->
                  </tr><!--Конец строки в таблице.-->
                  <tr>
                      <td><label>Password:</label></td><!-- Заполняем таблицу employee_list. -->
                      <td><input type="text" name="Password" value=""/><br></td><!-- Поле ввода пароля. employee_password VARCHAR(50) -->
                  </tr>
                  <tr>

                      <td colspan="2"><center><input id="registration" name="registrationBtn" type="submit" value="   Insert   "/></center><br></td>
                  </tr>
              </table>
          </form>
    </center>

    </body>
    <script charset="utf-8" src="./js/main.js"></script>
</html>
