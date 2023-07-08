Декомпозиция выбранной архитектуры на функциональные компоненты
=========
|          |                                                                   |
|----------|-------------------------------------------------------------------|
|Status:   | proposed 
|Deciders: | dev, devops                                                       |
|Date:     | 04.07.2023                                                        |

# Кейс

Необходимо декомпозировать выбранную в рамках [ADR-0001](../ADR-0001/README.md) архитектуру на функцональные компоненты

# Модели предметной области 

## Модель "Сущность-Связь"  

![](wsd/ER.png)

## Модель состояний

### Для студента
![](wsd/States%20of%20a%20student.png)

### Для преподавателя
![](wsd/States%20of%20a%20professor.png)

### Для менеджера
![](wsd/States%20of%20a%20manager.png)

# Функциональная декомпозиция

## По взаимодействию с пользователями

### Аутентификация и авторизация

![](wsd/ER%20Auth.png)


| Метод   | URL                         | Назначение                           |
|---------|-----------------------------|--------------------------------------| 
| POST    |/api/v1/auth/front/login     | Вход                                 |
| POST    |/api/v1/auth/front/logout    | Выход                                |
| GET     |/api/v1/auth/front/profile   | Профиль пользователя                 |
| GET     |/api/v1/auth/back/user       | Что за пользователь по по сессии     |
|         |                             |                                      |


### Сервисы менеджера

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

### Сервисы преподавателя

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
 
### Сервисы студента

![](wsd/ER%20student.png)

| Метод   | URL                                    | Назначение                |
|---------|----------------------------------------|---------------------------| 
| GET     |/api/v1/student/front/trainings         | Список курсов             |
| POST    |/api/v1/student/front/traning/request   | Запрос учебы на курсе     |
| GET     |/api/v1/student/front/tasks             | Список задач курса        |
| GET     |/api/v1/student/front/task/get          | Просмотр задачи курса     |
| POST    |/api/v1/student/decision/add            | Добавление задачи курса   |
| GET     |/api/v1/student/decision/check          | Сохранение задачи курса   |
| GET     |/api/v1/student/certs                   | Список тестов задачи      |
| GET     |/api/v1/student/cert/get                | Просмотр теста задачи     |
 

## По сущностям системы
