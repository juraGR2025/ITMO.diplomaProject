<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Login Page</title>
        <style type="text/css">
    <%@include file="./css/cssDream.css" %>
        </style>
    </head>
    <body>
        <a href="./index.html"><img id= "go-home" src="./Dom.png"></a>
        <h4><a href="./Register_page.jsp">Зарегистрироваться</a></h4>

<div class="login">
    <form name="loginP" class="login" method="post" action="Authentication.jsp">
    <div class="login-screen">
      <div class="app-title">
        <h1>Login</h1>
      </div>

      <div class="login-form">
        <div class="control-group">
        <input type="text" name="idEmp" class="login-field" value="" placeholder="username" id="login-name"><!-- Поле ввода никнейма сотрудника. -->
        <label class="login-field-icon fui-user" for="login-name"></label>
        </div>

        <div class="control-group">
        <input type="password" name="Password" class="login-field" value="" placeholder="password" id="login-pass"><!-- Поле ввода пароля. -->
        <label class="login-field-icon fui-lock" for="login-pass"></label>
        </div>

        <input  id="authorization" name="submitBtn" type="submit" class="btn btn-primary btn-large btn-block" value="Accept"/>
        <a class="login-link" href="./Register_page.jsp">Lost your password?</a>
      </div>
    </div>
    </form>
  </div>
    </body>
    <script charset="utf-8" src="./js/main.js"></script>
</html>
