<%-- 
    Document   : addingData_page
    Created on : 23.09.2022, 17:36:37
    Author     : Admin
--%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="javax.swing.*"%>
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="./css/cssDream.css"/>
<style type="text/css">
    <%@include file="./css/cssDream.css" %>
</style>
<script charset="utf-8" src="./js/main.js"></script>
        <title>Page for adding data</title>
    </head>
    <body>
        <a href="./index.html"><img id= "go-home" src="./Dom.png"></a>
    <form method="post" name="insertData" action="addingData.jsp">
        <table id="tableData" name="insertData">
            <caption>Опишите новый шаг инструкции</caption>
                  <tr><!-- Заполняем таблицу Workflow_bricks -->
                      <td name="insertData"><label name="insertData">Введите идентификатор шага инструкции:</label></td>
                      <td><input type="text" name="id_brick" value=""/><br></td><!-- Поле ввода id_brick VARCHAR(60). -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу employee_list. -->
                      <td name="insertData"><label name="insertData">Введите описание шага инструкции:</label></td>
                      <td><textarea type="text" name="step_instructions" rows="3" class="textareaStep"value=""></textarea>                          
                          <br></td><!-- Поле ввода step_instructions VARCHAR(300). -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу Workflow_bricks. -->
                      <td name="insertData"><label name="insertData">Введите трудозатраты на выполнение шага инструкции:</label></td>
                      <td><input type="text" name="labor_costs" value=""/><br></td><!-- Поле ввода labor_costs. -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу Workflow_bricks. -->
                      <td name="insertData"><label name="insertData">Минимальное количество персонала, необходимое для выполнения шага инструкции:</label></td>
                      <td><input type="text" name="minimum_person" value=""/><br></td><!-- Поле ввода minimum_person INT. -->
                  </tr><!--Конец строки в таблице.-->
                  <tr><!-- Заполняем таблицу Workflow_bricks -->
                      <td name="insertData"><label name="insertData">Максимальное количество персонала, необходимое для выполнения шага инструкции:</label></td>
                      <td><input type="text" name="maximum_person" value=""/><br></td><!-- Поле ввода maximum_person INT. -->
                  </tr><!--Конец строки в таблице.-->
                  <tr>
                      <td colspan="2"><center><input  id="addData" name="addDataBtn" type="submit" class="btn btn-primary btn-large btn-block" value="Insert"/></center><br></td>
                  </tr>
        </table>
    </form>


        
    </body>
</html>
