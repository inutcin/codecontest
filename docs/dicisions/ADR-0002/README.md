Декомпозиция выбранной архитектуры на функциональные компоненты
=========
|          |                                                                   |
|----------|-------------------------------------------------------------------|
|Status:   | proposed 
|Deciders: | dev, devops                                                       |
|Date:     | 04.07.2023                                                        |

# 1. Кейс

Необходимо декомпозировать выбранную в рамках [ADR-0001](../ADR-0001/README.md) архитектуру на функцональные компоненты

# 2. Модели предметной области 

## 2.1. Модель "Сущность-Связь"  

![](wsd/ER.png)

## 2.2. Модель состояний

### 2.2.1. Для студента
![](wsd/States%20of%20a%20student.png)

### 2.2.2. Для преподавателя
![](wsd/States%20of%20a%20professor.png)

### 2.2.3. Для менеджера
![](wsd/States%20of%20a%20manager.png)

# 3. Функциональная декомпозиция

## 3.1 По взаимодействию с пользователями

- Аутентификация и авторизация
- Сервисы менеджера
- Сервисы преподавателя
- Сервисы студента

### 3.1.1. Аутентификация и авторизация

ER-сущности:
![](wsd/ER%20Auth.png)


| Метод   | URL                         | Назначение                           |
|---------|-----------------------------|--------------------------------------| 
| POST    |/api/v1/auth/front/login     | Вход                                 |
| POST    |/api/v1/auth/front/logout    | Выход                                |
| GET     |/api/v1/auth/front/profile   | Профиль пользователя                 |
| GET     |/api/v1/auth/back/user       | Что за пользователь по по сессии     |
| GET     |/api/v1/auth/back/permissions| Права пользователя                   |


### 3.1.2. Сервисы менеджера

ER-сущности:
![](wsd/ER%20Manager.png)

| Метод   | URL                                | Назначение                    |
|---------|------------------------------------|-------------------------------| 
| GET     |/api/v1/manager/front/users         | Список пользователей          |
| GET     |/api/v1/manager/front/trainings     | Список курсов                 |
| GET     |/api/v1/manager/front/requests      | Списо заявок                  |
| POST    |/api/v1/manager/front/grant         | Назначить права пользователю  |
| POST    |/api/v1/manager/front/revoke        | Забрать права пользователя    |
| POST    |/api/v1/manager/front/traning/add   | Добавить курс                 |
| POST    |/api/v1/manager/front/traning/save  | Сохранить курс                |
| POST    |/api/v1/manager/front/request/accept| Принять заявку                |
| POST    |/api/v1/manager/front/request/reject| Отклонить заявку              |
| GET     |/api/v1/manager/front/training/sheet| Отчет об успеваемости         |

### 3.1.3. Сервисы преподавателя

ER-сущности:
![](wsd/ER%20professor.png)

| Метод   | URL                                    | Назначение                |
|---------|----------------------------------------|---------------------------| 
| GET     |/api/v1/professor/front/trainings       | Список курсов             |
| POST    |/api/v1/professor/front/traning/request | Запрос на ведение курса   |
| GET     |/api/v1/professor/front/tasks           | Список задач курса        |
| GET     |/api/v1/professor/front/task/get        | Просмотр задачи курса     |
| POST    |/api/v1/professor/front/task/add        | Добавление задачи курса   |
| POST    |/api/v1/professor/front/task/save       | Сохранение задачи курса   |
| GET     |/api/v1/professor/front/tests           | Список тестов задачи      |
| GET     |/api/v1/professor/front/test/get        | Просмотр теста задачи     |
| POST    |/api/v1/professor/front/test/add        | Добавление теста задачи   |
| POST    |/api/v1/professor/front/test/save       | Сохранение теста задачи   |
 
### 3.1.4. Сервисы студента

ER-сущности:
![](wsd/ER%20student.png)

| Метод   | URL                                    | Назначение                |
|---------|----------------------------------------|---------------------------| 
| GET     |/api/v1/student/front/trainings         | Список курсов             |
| POST    |/api/v1/student/front/traning/request   | Запрос учебы на курсе     |
| GET     |/api/v1/student/front/tasks             | Список задач курса        |
| GET     |/api/v1/student/front/task/get          | Просмотр задачи курса     |
| GET     |/api/v1/student/front/decisions         | Список решений задачи     |
| POST    |/api/v1/student/front/decision/add      | Добавление решения        |
| GET     |/api/v1/student/front/decision/check    | Проверка решения          |
| GET     |/api/v1/student/front/certs             | Список сертификатов       |
| GET     |/api/v1/student/front/cert/get          | Просмотр сертификата      |
 

## 3.2. По сущностям системы

- Пользователь
- Учебный курс
- Договор со студентом о прохождении курса
- Договор с преподавателем о ведении курса
- Задача учебного курса
- Тест для задачи учебного курса
- Решение задачи
- Проверка решения
- Отчет об успеваемости
- Сертификат

### 3.2.1. Пользователь
ER-сущности:
- user
- permission
- role

### 3.2.2. Учебный курс  
ER-сущности:
- training

### 3.2.3. Договор со студентом о прохождении курса
ER-сущности:
- student

### 3.2.4. Договор с преподавателем о прохождении курса
ER-сущности:
- professor

### 3.2.5. Задача учебного курса 
ER-сущности:
- task

### 3.2.6. Тест для задачи учебного курса 
ER-сущности:
- test

### 3.2.7. Решение задачи 
ER-сущности:
- desision
- language

### 3.2.8 Проверка решения
- desition
- lenguage
- test
- decition_test 
- reason 

### 3.2.8 Отчет об успеваемости  
ER-сущности:
- student
- training
- task
- decition

### 3.2.9. Сертификат
ER-сущности:
- training
- task
- decision
