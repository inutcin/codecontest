/*
 * This is a combined version of the following workspaces, with automatic layout enabled:
 *
 * - "Big Bank plc - System Landscape" (https://structurizr.com/share/28201/)
 * - "Big Bank plc - Internet Banking System" (https://structurizr.com/share/36141/)
*/
workspace "Alef" "Проведение соревнований по спортивному программированию" {

    model {

        // steakholder 
        student = person "Студент"
        professor = person "Преподаватель"
        manager = person "Менеджер"

        documentStorage = softwareSystem "Document Storage" "Хранилище документов" {
            sheet = container "Электронная таблица" "Google Docs"{
                tags "Web Client"
            }

            google = container "Серверы Google"{
                tags "File Storage"
            } 

            sheet -> google { 
                tags "Межсерверное взаимодействие"
            }
        }
        messageExchange = softwareSystem "Message exchange" "Обмен сообщениями" {

            mailWebClient = container "Почтовый web-клиент" {
                tags "Web Client"
            }
            mailServer = container "Почтовый сервер" {
                tags "File Storage"
            }

            mailWebClient -> mailServer { 
                tags "Межсерверное взаимодействие"
            }
            mailServer -> mailWebClient { 
                tags "Межсерверное взаимодействие"
            }

        }

        testingSystem = softwareSystem "Testing system" "Проверка задач" {
            compiler = container "ПК преподавателя"{
            }
        }

        professor -> compiler "UC-6" {
            tags "Непосредственное использование"
        }

        // ================ Документы ===========
        // Документы менеджера
        manager -> sheet  "UC-1, UC-7, UC-8" {
            tags "Работа с документом в рамках пользовательского сценария"
        }

        // Документы преподавателя
        professor -> sheet "UC-6, UC-2"{
            tags "Работа с документом в рамках пользовательского сценария"
        }

        // Документы студента
        student -> sheet "UC-4, UC-5, UC-8"{
            tags "Работа с документом в рамках пользовательского сценария"
        }

        // ============ Сообщения
        // Сообщения менеджера
        manager -> mailWebClient "UC-1"{
            tags "Отправка и приём сообщений"
        }

        // Сообщения преподавателя
        professor -> mailWebClient "UC-6"{
            tags "Отправка и приём сообщений"
        }

        // Сообщения студента
        student -> mailWebClient "UC-3, UC-5"{
            tags "Отправка и приём сообщений"
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