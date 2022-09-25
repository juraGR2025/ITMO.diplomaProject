USE technology_source;
INSERT employee_list
VALUES 
(1, 'BigBoss',  '1971-03-20', '2022-09-01', 'higher education', 'BigBoss', '1111'),
(2, 'Петров Петр Иванович',  '1991-03-20', '2022-09-01', 'higher education', 'Piotr', '123');

INSERT staff_competencies
VALUES 
(1, 'ПК-1', 'Знание и понимание устройства, работы и
процессов, происходящих в изделиях ракетно-космической техники.'),
(2, 'ПК-2', 'Знание устройства, порядка функционирования агрегатов и систем
технологического оборудования ракетно-космических комплексов,
технологических операций с их применением, 
работ и размещения оборудования на техническом и стартовом комплексах.'),
(3, 'ПК-3', 'Готовность в соответствии с технической документацией проводить регламентные
работы, находить и устранять технические неисправности изделий ракетно-космического комплекса.'),
(4, 'ПК-4', 'Готовность в соответствии с технической документацией проводить работы по
обследованию зданий и сооружений, а также ремонтно-восстановительные работы на стартовом и техническом
комплексах.'),
(5, 'ПК-5', 'Готовность вести техническую документацию на эксплуатацию и регламентные работы на объектах и
системах ракетно-космического комплекса.'),
(6, 'ПК-6', 'Готовность дать рекомендации и технические предложения по
совершенствованию конструкций узлов, агрегатов и всего изделия в целом.')
;

INSERT workflow_bricks
VALUES 
(1, 'maintenance_year_e1', 'Произвести анализ масла в гидросистеме (технологическая карта №9)', 0.25, 1, 4),
(2, 'maintenance_year_e2', 'Провести очистку воздушных фильтров маслобаков насосных установок (технологическая карта №8)', 0.5, 1, 4),
(3, 'maintenance_year_e3', 'Провести очистку фильтров гидросистемы (технологическая карта №11)', 5, 1, 4),
(4, 'maintenance_year_e4', 'Провести прокачку гидросистемы (технологическая карта №12)', 0.5, 2, 4),
(5, 'maintenance_year_month_week_e5', 'Очистить узлы и детали агрегата от грязи, песка, снега и льда', 0.5, 1, 4),
(6, 'maintenance_year_month_week_e6', 'Проверить целостность чехлов агрегата и,при необходимости, провести их ремонт', 0.5, 1, 3),
(7, 'maintenance_year_month_week_e7', 'Произвести наружный осмотр гидросистемы, проверить отсутствие течи масла в узлах и соединениях  
гидросистемы, убедиться в осутствии наружных дефектов гидросистемы, обнаруженные дефекты устранить', 1, 1, 1),
(8, 'maintenance_year_month_week_e8', 'Проверить состояние габаритных светильников', 0.5, 1, 2),
(9, 'maintenance_year_month_week_e9', 'Проверить надежность крепления электродвигателей и электрических кабелей', 1.5, 1, 4),
(10, 'maintenance_year_month_week_e10', 'Проверить пломбировку узлов согласно "Ведомости опломбировки узлов агрегата", находящейся в формуляре', 1, 1, 1),
(11, 'maintenance_year_month_week_e11', 'Проверить наружным осмотром целостность электропроводки и штепсельных разъемов', 2, 1, 1),
(12, 'maintenance_year_month_e12', 'Проверить внешним осмотром состояние металлоконструкций агрегата на отсутствие трещин, вмятин и погнутостей, 
проверить отсутствие трещин в сварных швах', 2.5, 1, 4)
;

INSERT Expendable_material
VALUES 
(1,
'Ведомости опломбировки узлов агрегата',-- Наименование расходного материала.
'шт.', -- Единицы измерения расходного материала.
true, -- Наличие на складе.
3 -- Количество на складе.
);

INSERT Required_quantity_of_consumables 
VALUES
(
1,
1,-- Количество расходного материала, требуемого при выполнении шага инструкции.
10,-- Ссылка на внешний ключ на id шага инструкци, в которой требуются расходные материалы.
'maintenance_year_month_week_e10',-- Ссылка на внешний ключ на шаги инструкци, в которых требуются расходные материалы.
1 -- Ссылка на внешний ключ на название расходного материала.
);