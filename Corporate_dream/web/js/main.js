/* global strSQLquery */

function negativeReaction(){
    
    alert("Зарегистрируйтесь в системе!");
    
  }
  
function positiveReaction(){
    
    alert("Welcome user!");
    
  }


// Кнопка формирования строки запроса
var btn = document.getElementById("use_input");

function downloadButton(){
 var checkboxYear = document.findeOperation.maintenance_year;
 var checkboxMonth = document.findeOperation.maintenance_month;
 var checkboxWeek = document.findeOperation.maintenance_week;
 var checkboxWork = document.findeOperation.Work;
 var checkboxAll = document.findeOperation.All;
 
 var strSQLquery = "SELECT * FROM Workflow_bricks;";
  
    if(checkboxYear.checked){
    strSQLquery = "SELECT * FROM Workflow_bricks WHERE id_brick LIKE 'maintenance_year_e%'";
          alert("Вы выбрали годовое ТО!");
    }
    if(checkboxMonth.checked){
        strSQLquery = "SELECT * FROM Workflow_bricks WHERE id_brick LIKE '%month_e%'";
          alert("Вы выбрали ежемесячное ТО!");
    }
    if(checkboxWeek.checked){
        strSQLquery = "SELECT * FROM Workflow_bricks WHERE id_brick LIKE '%week_e%'";
          alert("Вы выбрали еженедельное ТО!");
    }
    if(checkboxWork.checked){
        strSQLquery = "SELECT * FROM Workflow_bricks WHERE id_brick LIKE '%work_e%'";
         alert("Вы выбрали перечень рабочих операций!");
    }
    if(checkboxAll.checked){
        strSQLquery = "SELECT * FROM workflow_bricks";
         alert("Вы выбрали полный перечень операций!");
    }
    
document.getElementById("SQL-query").value = strSQLquery;

}

btn.addEventListener("click",downloadButton);

// Кнопка создания строки строки запроса
var btnSave = document.getElementById("save");

function downloadSelect(){
    
var e = document.getElementById("chief-work");
var SelectedOption = e.value;
   
document.getElementById("SQL-select").value = SelectedOption;

}

btnSave.addEventListener("click", downloadSelect);

function addRowHandlers() {
    var rows = document.getElementById("work-table").rows;
    var id = 0;
    var select = 0;
    var brick_next = 0;

    for (i = 0; i < rows.length; i++) {
        rows[i].onclick = function(){ return function(){

               id = this.cells[0].textContent;
               document.getElementById("ID-Workflow_bricks").value = id;   
        };}(rows[i]);
    }
    
}

window.onload = addRowHandlers();

btnSave.addEventListener("click", addRowHandlers);


