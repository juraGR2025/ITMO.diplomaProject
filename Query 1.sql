-- DROP SCHEMA `technology_source`;
CREATE SCHEMA `technology_source` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
-- Создаем базу данных 'источник_технологии'. 
USE technology_source;
CREATE TABLE IF NOT EXISTS Workflow_bricks (-- Если таблица не создана, создаем таблицу.
    id INT AUTO_INCREMENT,-- Создаем столбец для подсчета суммарного количества шагов инструкции.
    id_brick VARCHAR(60),-- Создаем столбец с уникальным (?) идентификатором обозначающим один шаг в инструкции (он же первичный ключ).
    step_instructions VARCHAR(300) NOT NULL,-- Столбец, содержащий описание элементарного шага инструкции.
    labor_costs FLOAT(32),-- Трудозатраты, на выполнение шага инструкции, директивно определенные инструкцией.
    minimum_person INT, -- Минимальное количество персонала, необходимое для выполнения шага инструкции.
	maximum_person INT, -- Максимальное количество персонала, необходимое для выполнения шага инструкции.
    PRIMARY KEY (id, id_brick) -- Составной первичный ключ из столбцов id и id_brick.
);

CREATE TABLE IF NOT EXISTS Expendable_material (-- Если таблица не создана, создаем таблицу для учета расходных материалов.
id_material INT PRIMARY KEY AUTO_INCREMENT,-- Создаем первичный ключ автоинкрементом.
name_material VARCHAR(80) NOT NULL,-- Наименование расходного материала.
units_measurement VARCHAR(20), -- Единицы измерения расходного материала.
stock_availability BOOL, -- Наличие на складе.
quantity_in_stock FLOAT(26) -- Количество на складе.
);

CREATE TABLE IF NOT EXISTS Required_quantity_of_consumables (-- Создается таблица для хранения значений требуемого количества расходных материалов.
id_quantity_of_consumables INT PRIMARY KEY AUTO_INCREMENT,-- Создаем первичный ключ автоинкрементом.
quantity_of_material FLOAT(26),-- Количество расходного материала, требуемого при выполнении шага инструкции.
id_q INT,-- Формируем внешний ключ для ссылок на шаги инструкци, в которых требуются расходные материалы.
id_brick_q VARCHAR(60),-- Формируем внешний ключ для ссылок на шаги инструкци, в которых требуются расходные материалы.
key_material INT, -- Формируем внешний ключ для ссылок на название расходного материала.
FOREIGN KEY (id_q, id_brick_q) REFERENCES Workflow_bricks (id, id_brick),
FOREIGN KEY (key_material) REFERENCES Expendable_material (id_material)
);

CREATE TABLE IF NOT EXISTS employee_list (-- Создается таблица для хранения данных об обслуживающем персонале.
id_employee INT PRIMARY KEY AUTO_INCREMENT,-- Создаем первичный ключ для персонала автоинкрементом.
emploee_name VARCHAR(30) NOT NULL,-- ФИО сотрудника.
date_of_birth DATE,-- Дата рождения сотрудника.
date_of_employment DATE,-- Дата приема сотрудника на работу.
education VARCHAR(30),-- Образование сотрудника.
employees_nickname VARCHAR(50) NOT NULL,-- Ник сотрудника.
employee_password VARCHAR(50),-- Пароль для входа в корпоративную систему управления.
UNIQUE(employees_nickname)
);

CREATE TABLE IF NOT EXISTS staff_competencies (-- Создается таблица для хранения данных о компетенциях.
id_competence INT PRIMARY KEY AUTO_INCREMENT,-- Создаем первичный ключ для компетенций автоинкрементом.
competence_name VARCHAR(30),-- Наименование компетенци сотрудника (id).
content_of_competence VARCHAR(250)-- Содержание (описание) компетенции сотрудника.
);

-- DROP TABLE employee_competencies;
CREATE TABLE IF NOT EXISTS employee_competencies (-- Создается таблица для хранения данных о компетенциях обслуживающего персонала.
id_competence_emp INT PRIMARY KEY AUTO_INCREMENT,-- Создаем первичный ключ для компетенций персонала автоинкрементом.
id_employee INT,-- id сотрудника, обладающего компетенциями.
level_of_competence FLOAT(26),-- Значение уровня развития компетенции сотрудника.
CONSTRAINT competence_check CHECK(level_of_competence BETWEEN 0 AND 1),-- Задаем ограничение для уровня компетенции.
id_competence INT, -- id компетенции в таблице staff_competencies.
FOREIGN KEY (id_employee) REFERENCES employee_list(id_employee) ON DELETE CASCADE,
FOREIGN KEY (id_competence) REFERENCES staff_competencies (id_competence)
ON DELETE CASCADE
);

-- DROP TABLE emergency_situation;
CREATE TABLE IF NOT EXISTS emergency_situation (-- Если таблица не создана, создаем таблицу для хранения сведений о нештатных ситуациях.
    id INT AUTO_INCREMENT,-- Создаем столбец для подсчета суммарного количества нештатных ситуаций.
    emergency_detection_time DATETIME,-- Время обнаружения нештатной ситуации.
	localization_time DATETIME,-- Время завершения локализации нештатной ситуации.
    description_of_emergency_situation VARCHAR(300) NOT NULL,-- Столбец, содержащий описание нештатной ситуации.
    labor_emergency_situation_costs FLOAT(32),-- Трудозатраты на устранение нештатной ситуации.
    stopping_technological_process BOOL, -- Сведения об остановке технологического процесса.
    emploee_name VARCHAR(32) NOT NULL,-- Сведения о сотрудниках, устранявших нештатную ситуацию.
    PRIMARY KEY (id) -- Первичный ключ из столбца id.
);

USE technology_source;
CREATE TABLE IF NOT EXISTS technology_process_design (-- Создается таблица для хранения данных о технологических процессах.
id_design INT PRIMARY KEY AUTO_INCREMENT,-- Создаем первичный ключ для описания строки отношения на множестве элементарных технологических процессов.
identification_label VARCHAR(30), -- Идентификационная метка группы шагов инструкции, составляющих завершенный технологический процесс.
Start_time_of_the_technological_process DATETIME,-- Время начала технологического процесса.
Completion_time_of_the_technological_process DATETIME,-- Время завершения технологического процесса.
id_Wfl_bricks_1 INT,-- Создаем столбец для хранения номера шага инструкции из таблицы Workflow_bricks.
id_brick_1 VARCHAR(30) -- Создаем столбец для хранения уникального (?) идентификатора шага инструкции.
NOT NULL CHECK (id_brick_1 LIKE '%maintenance%' OR '%year%' OR '%month%' OR '%week%' OR '%work%' OR '%emergency%' OR '%development%' OR '%repair%' OR '%disposal%'),
-- Задается ограничение на столбец. Столбец должен содержать префиксы
-- техническое обслуживание, год, месяц, неделя, работа, нештатная ситуация, разработка, ремонт, утилизация;
-- maintenance,             year, month, week,    work,   emergency,        development, repair, disposal;
-- префиксы идентифицируют столбец id_brick_1 как обозначение вида работ на агрегате.
logical_operator_of_the_instruction_execution_sequence INT -- Здесь определяется логика последовательности выполнения операций.
NOT NULL DEFAULT 0 -- Устанавливаем значение по умолчанию - 0.
CHECK (-- Устанавливаем ограничение на столбец: значение в нем должно быть 
-- либо 0, либо 1, либо 2, либо 3, 5, 7, 11, 13, 17.
 logical_operator_of_the_instruction_execution_sequence = 0 OR-- 0 операция ei не должна быть выполнена.
 logical_operator_of_the_instruction_execution_sequence = 1 OR-- 1 операция ei должна быть выполнена (отношение операции к самой себе),
 logical_operator_of_the_instruction_execution_sequence = 2 OR-- 2 операция ei выполняется строго после ej,
 logical_operator_of_the_instruction_execution_sequence = 3 OR-- 3 операция ei выполняется сразу же после ej,
 logical_operator_of_the_instruction_execution_sequence = 5 OR-- 5 операция ei выполняется строго перед ej,
 logical_operator_of_the_instruction_execution_sequence = 7 OR-- 7 операция ei выполняется непосредственно перед ej,
 logical_operator_of_the_instruction_execution_sequence = 11 OR-- 11 операция ei выполняется после или одновременно с ej,
 logical_operator_of_the_instruction_execution_sequence = 13 OR-- 13 операция ei выполняется перед или одновременно с ej,
 logical_operator_of_the_instruction_execution_sequence = 17 -- 17 операция ei выполняется одновременно с ej.
 ),
id_Wfl_bricks_2 INT,-- Создаем столбец для хранения номера 2 шага инструкции из таблицы Workflow_bricks.
id_brick_2 VARCHAR(30)-- Создаем столбец для хранения уникального (?) идентификатора 2 шага инструкции.
NOT NULL CHECK (id_brick_2 LIKE '%maintenance%' OR '%year%' OR '%month%' OR '%week%' OR '%work%' OR '%emergency%' OR '%development%' OR '%repair%' OR '%disposal%')
-- Ограничение: проверка есть-ли id_brick в таблице Workflow_bricks равный id_brick_2.
);


