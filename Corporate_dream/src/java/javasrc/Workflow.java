/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javasrc;
import java.io.Serializable;
/**
 *
 * @author juraGR
 */
public class Workflow implements Serializable{
    private static final long serialVersionUID = 1L;

    private String id_brick;//Создаем столбец с уникальным (?) идентификатором обозначающим один шаг в инструкции (он же первичный ключ).
    private String step_instructions;//Столбец, содержащий описание элементарного шага инструкции.
    private String labor_costs;//Трудозатраты, на выполнение шага инструкции, директивно определенные инструкцией.
    private String minimum_person;//Минимальное количество персонала, необходимое для выполнения шага инструкции.
    private String maximum_person;//Максимальное количество персонала, необходимое для выполнения шага инструкции.

  
     
    public Workflow(){ }
    public Workflow(String id_brick, String step_instructions, String labor_costs){
         
        this.id_brick = id_brick;
        this.step_instructions = step_instructions;
        this.labor_costs = labor_costs;
    }
    public Workflow(String id_brick, String step_instructions, String labor_costs, String minimum_person, String maximum_person){
         
        this.id_brick = id_brick;
        this.step_instructions = step_instructions;
        this.labor_costs = labor_costs;
        this.minimum_person = minimum_person;
        this.maximum_person = maximum_person;
    }
     
    public String getIdbrick() {
        return id_brick;
    }
     
    public String getStep() {
        return step_instructions;
    }
    
    public String getLabor() {
        return labor_costs;
    }
    
    public String getMinimum() {
        return minimum_person;
    }
 
    public String getMaximum() {
        return maximum_person;
    }
    
    public void setIdbrick(String id_brick) {
        this.id_brick = id_brick;
    }
    
    public void setStep(String step_instructions) {
        this.step_instructions = step_instructions;
    }
    
    public void setLabor(String labor_costs) {
        this.labor_costs = labor_costs;
    }
 
    public void setMinimum(String minimum_person) {
        this.minimum_person = minimum_person;
    }
    
    public void setMaximum(String maximum_person) {
        this.maximum_person = maximum_person;
    }
}
