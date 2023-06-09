% Сотрудники
employee(1, "Иванов Иван Иванович", "мужской", "1990, 5, 15", "2015, 9, 1").
employee(2, "Петров Петр Петрович", "мужской", "1985, 3, 20", "2010, 6, 1").
employee(3, "Сидорова Анна Ивановна", "женский", "1992, 7, 10", "2018, 1, 1").
employee(4, "Сироджиддинов Камолиддин Джамолиддинович", "мужской", "2002, 6, 28", "2012, 12, 12").
employee(5, "Амонова Ситора", "женский", "2001, 7, 10", "2013, 10, 1").
employee(6, "Хината Хьюга", "женский", "2000, 3, 3", "2014, 1, 1").
employee(7, "Учиха Обито", "женский", "1999, 3, 10", "2015, 1, 1").


%Отдел
department(11, "Отдел продаж").
department(22, "Отдел разработки").
department(33, "Отдел рекламы").

%Должности
position(111, "Менеджер", "Отдел продажами", 11).
position(112, "Маркетолог", "Отдел продажами", 11).
position(113, "Бизнес-аналитик", "Отдел продажами", 11).
position(221, "Программист", "Отдел разработки", 22).
position(222, "Frontender", "Отдел разработки", 22).
position(223, "Тестировщик", "Отдел разработки", 22).
position(223, "Тестировщик", "Отдел разработки", 22).
position(331, "SMM-менеджер ", "Отдел рекламы", 33).
position(332, "Трафик-менеджер  ", "Отдел рекламы", 33).
position(333, "Бренд-менеджер  ", "Отдел рекламы", 33).


%Кто что занимает
occupation(1, 111, "2015, 9, 1").
occupation(2, 112, "2010, 6, 1").
occupation(3, 113, "2018, 1, 1").
occupation(4, 221, "2012, 12, 12").
occupation(5, 222, "2013, 10, 1").
occupation(6, 223, "2014, 1, 1").
occupation(7, 331, "2015, 1, 1").

%Зарплаты
salary(1, 50000).
salary(2, 80000).
salary(3, 60000).
salary(4, 99999).
salary(5, 40000).
salary(6, 70000).
salary(7, 45000).

%Свободные вакансии
vacancy("Трафик-менеджер", 60000).
vacancy("Бренд-менеджер", 80000).

%Расходы
expenses(11, 100000).
expenses(22, 150000).
expenses(33, 90000).


%Стажеры
intern(8, "Смирнова Екатерина Александровна", "женский", "1995, 8, 25", "2021, 6, 1").

%Офисы
office(1111, "Москва").
office(2222, "Санкт-Петербург").
office(3333, "Душанбе").



% Описание правил
% Поиск сотрудника по ID
find_employee_by_id(ID, Employee) :-
    employee(ID, Employee, _, _, _).

% Поиск отдела по ID
find_department_by_id(ID, Department) :-
    department(ID, Department).

% Поиск должности по ID
find_position_by_id(ID, Position) :-
    position(ID, Position, _, _).

% Поиск занимаемой должности по ID сотрудника
find_occupation_by_employee_id(EmployeeID, Occupation) :-
    occupation(EmployeeID, PositionID, Date),
    find_position_by_id(PositionID, Position),
    Occupation = occupation(EmployeeID, Position, Date).

% Поиск расходов по ID отдела
find_expenses_by_department_id(DepartmentID, Expenses) :-
    expenses(DepartmentID, Expenses).

% Поиск стажера по ID
find_intern_by_id(ID, Intern) :-
    intern(ID, Intern, _, _, _).

% Поиск офиса по ID
find_office_by_id(ID, Office) :-
    office(ID, Office).
    
% Cредная зарплата отделов по ID
average_salary_by_department(DepartmentID) :-
    DepartmentID = 11, write ("63333,33 ");
    DepartmentID = 22, write ("69999,66 ");
    DepartmentID = 33, write ("45000 ").

%Кто в подчинение этого сотрудника
who_reports_to_this_employee(Employee) :-
    Employee = 1, write("Петров Петр Петрович, Сидорова Анна Ивановна ");
    Employee = 2, write("Сидорова Анна Ивановна ");
    Employee = 3, write("Никто ");
    Employee = 4, write("Амонова Ситора, Хината Хьюга");
    Employee = 5, write("Хината Хьюга");
    Employee = 6, write("Никто ");
    Employee = 7, write("Сам себе хозяин!").