workspace "Alef" "Обучение спортивному программированию" {

    model {

        // steakholder 
        student = person "Студент"{
            tags "Web Client"
        }
        professor = person "Преподаватель"{
            tags "Web Client"
        }

        manager = person "Менеджер"{
            tags "Web Client"
        }

        contestSystem = softwareSystem "Contest system" "Площадка по обучению спортивного программирования" {

            balancer = container "balancer"{
            }

            webResouces = container "Resources web-server (CDN)" "Web-сервер статики для фронтенда"{
            }

            applicationService = container "Application service" "REST API методы фронтенда"{
                cReport = component "Report" "API отчетов"
                cCert = component "Cert" "API сертификатов"
                cUser = component "User" "API пользователей"
                cTraining = component "Training" "Api учебных курсов"
                cTask = component "Task" "Api задач"
                cDecision = component "Decision" "Api решений"
                cTest = component "Test" "Api тестов"
                cProfessor = component "Professor" "Api преподавателей"
                cStudent = component "Student" "Api студентов" 
            }

            authService = container "Auth service" "Сервис авторизации и аутентификации" {
                cAuth = component "Auth" "Компонент аутентификации и авторизации"
            }

            processingService = container "Сервис проверки решений" "Контейнер проверки решений" {
                cDecisionTest = component "Decision test" "Компонент проверки решений"
            }

            messageService = container "Messsage service" "Сервис рассылки сообщений" {
                cSender = component "Sender" "Компонент рассылки сообщений"
            }

            documentsService = container "Document service" "Сервис обработки документов" {
                cReportGenerator = component "Report generator" "Компонент генерации отчетов"
                cCertGenerator = component "Cert Generator" "Компонент генерации сертификатов"
            }

            dbDocuments = container "Documents" "База данных документов" {
                tags "Database"
            }

            dbContest = container "Contest" "База данных задач, решений и тестов" {
                tags "Database"
            }

            dbContract = container "Contract" "База данных договоров" {
                tags "Database"
            }

            queueBroker = container "Queue broker" "Брокер очередей" {
                tags "Queue"
            }

            dbUsers = container "Users" "База данных пользователей" {
                tags "Database"
            }

            messageBroker = container "Message broker" "Брокер сообщений" {
                tags "Queue"
            }

            balancer -> webResouces "http"

            balancer -> cReport "http"
            balancer -> cCert "http"
            balancer -> cStudent "http"
            balancer -> cProfessor "http"
            balancer -> cTest "http"
            balancer -> cDecision "http"
            balancer -> cTask "http"
            balancer -> cTraining "http"
            balancer -> cUser "http"

            cTraining -> dbContest "DB Connect" 
            cTask -> dbContest "DB Connect"
            cDecision -> dbContest "DB Connect"
            cTest -> dbContest "DB Connect"

            cStudent -> dbContract "DB Connect"
            cProfessor -> dbContract "DB Connect"

            cUser -> cAuth "http"
            cDecision -> cAuth "http"
            cAuth -> dbUsers "DB Connect"

            cCert -> dbDocuments "DB Connect"
            cReport -> dbDocuments "DB Connect"

            cDecision -> queueBroker "AMQP"

            queueBroker -> cDecisionTest "AMQP"
            cDecisionTest -> messageBroker "kafka"

            messageBroker -> cSender "kafka"
            messageBroker -> cReportGenerator "kafka"
            messageBroker -> cCertGenerator "kafka"

            cDecisionTest -> cDecision "http"

            cReportGenerator -> dbDocuments "DB connect"
            cCertGenerator -> dbDocuments "DB connect"

        }

        manager -> balancer "https"{

        }
        professor -> balancer "https"{

        }
        student -> balancer "https"{

        }
            

        c1 = deploymentEnvironment "Instance"{
            deploymentNode "Web" "Балансер и CDN" "" "" "2"{
                myBalancer = containerInstance balancer 
                containerInstance webResouces
            }

            deploymentNode "Api" "API пользователей" "" "" "2"{
                containerInstance applicationService
                containerInstance authService
            }

            deploymentNode "DB" "Сервер баз данных" "" "" "1"{
                containerInstance dbDocuments
                containerInstance dbContest
                containerInstance dbContract
                containerInstance dbUsers    
            } 

            deploymentNode "Processing" "Сервер фоновых заданий" "" "" "2"{
                containerInstance processingService
                containerInstance documentsService
                containerInstance messageService
            }

            deploymentNode "Queue broker" "Брокеры очередей и сообщений" "" "" "1" {
                containerInstance queueBroker
                containerInstance messageBroker
            }

        }     


    }

    views {

        /*
        systemLandscape {
            include *
            autoLayout
        }
        */

        styles {
            element "Person"{
                shape person
            }

            element "File Storage"{
                shape folder
            }
            element "Database"{
                shape Cylinder
            }
            element "Web Client"{
                shape WebBrowser
            }
            element "Desktop Client"{
                shape Window 
            }
            element "Queue"{
                shape Pipe 
            }
            element "Component"{
                shape Component
            }


            relationship "Межсерверное взаимодействие"{
                dashed false
            }

            relationship "Непосредственное использование"{
                dashed false
            }

            relationship "Работа с документом в рамках пользовательского сценария" {
                dashed true
            }
        }

        theme default
    }
}