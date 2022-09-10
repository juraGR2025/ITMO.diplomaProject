/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javasrc;

import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author juraGR
 */
public class WorkflowDB {
    private static String url = "jdbc:mysql://localhost:3306/technology_source?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static String username = "root";
    private static String password = "1111_1";
    
    public static ArrayList<Workflow> select() {
         
        ArrayList<Workflow> workflows = new ArrayList<Workflow>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){
                  
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM Workflow_bricks");
                try{
                while(resultSet.next()){

                    String id_brick = resultSet.getString("id_brick");//Создаем столбец с уникальным (?) идентификатором обозначающим один шаг в инструкции (он же первичный ключ).
                    String step_instructions = resultSet.getString("step_instructions");//Столбец, содержащий описание элементарного шага инструкции.
                    String labor_costs = resultSet.getString("labor_costs");//Трудозатраты, на выполнение шага инструкции, директивно определенные инструкцией.
                    String minimum_person = resultSet.getString("minimum_person");//Минимальное количество персонала, необходимое для выполнения шага инструкции.
                    String maximum_person = resultSet.getString("maximum_person");//Максимальное количество персонала, необходимое для выполнения шага инструкции.
                    
                    Workflow workflow = new Workflow(id_brick, step_instructions, labor_costs, minimum_person, maximum_person);
                    workflows.add(workflow);
                }
                resultSet.close();
                }
                catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return workflows;
    }
    public static Workflow selectOne(int id) {
         
        Workflow workflow = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){
                  
                String sql = "SELECT * FROM Workflow_bricks WHERE id=?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){

                        String id_brick = resultSet.getString(1);
                        String step_instructions = resultSet.getString(2);
                        String labor_costs = resultSet.getString(3);
                        workflow = new Workflow(id_brick, step_instructions, labor_costs);
                    }
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return workflow;
    }
    public static int insert(Workflow workflow) {
         
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){
                  
                String sql = "INSERT INTO Workflow_bricks (id_brick, step_instructions, labor_costs, minimum_person, maximum_person) Values (?, ?, ?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, workflow.getIdbrick());
                    preparedStatement.setString(2, workflow.getStep());
                    preparedStatement.setString(3, workflow.getLabor());
                    preparedStatement.setString(4, workflow.getMinimum());
                    preparedStatement.setString(5, workflow.getMaximum());
                      
                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return 0;
    }
     
    public static int update(Workflow workflow) {
         
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){
                  
                String sql = "UPDATE Workflow_bricks SET id_brick = ?, step_instructions = ?, labor_costs = ?, minimum_person = ?, maximum_person = ?  WHERE id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, workflow.getIdbrick());
                    preparedStatement.setString(2, workflow.getStep());
                    preparedStatement.setString(3, workflow.getLabor());
                    preparedStatement.setString(4, workflow.getMinimum());
                    preparedStatement.setString(5, workflow.getMaximum());
                      
                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return 0;
    }
    public static int delete(int id) {
         
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){
                  
                String sql = "DELETE FROM Workflow_bricks WHERE id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                      
                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return 0;
    }
}
