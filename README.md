# README

Проект Тест Гуру
Цель проекта - Создать сайт, обеспечивающий следующий функционал:
- создание тестов, управление ими
- аутентификация пользователей
- разграничение прав доступа
- выполнение тестов
- публикация результатов тестов в соцсети
- пользователи, заходя на сайт, проходят различные тесты.

Список сущностей (объектов реального мира) для проекта:

- Класс User (имя_пользователя, логин, пароль, идентификатор теста, результат)
- Класс Test (идентификатор теста, тематика, вопрос, ответ)
- Класс Category (наименование категории)
- Класс Question (Вопрос)
- Класс Answer (Ответ, значение boolean)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

* System dependencies

* Configuration
  Database: sqlite3

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
