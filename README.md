# Simple Spring Data JPA (REST) on H2

## Overview
This project creates a Spring Boot executable JAR which connects to an in-memory H2 database and exposes that database via a RESTful interface. It is intended to be run locally for quick prototyping, as the database is re-initialized on application load. It demonstrates the power of [Spring Data JPA](https://spring.io/projects/spring-data-jpa) by creating an entire HATEOAS (REST) interface with 3 java files, and only a few lines of code. The Notes.java entity class is the largest file, but 90% of that was auto-generated from the class fields. The NotesRepository.java class (which provides the entire Notes REST API) is almost empty. Via the API, you can Create, Read, Update and Delete rows in the Notes table.

This version of the project is stored in the 'h2' branch of the [https://github.com/kbaynes/simple-spring-data-jpa-mysql](https://github.com/kbaynes/simple-spring-data-jpa-mysql) repository.

## Goal
The goal of this project is to create a [Spring Boot](https://spring.io/projects/spring-boot) application, which uses [Spring HATEOAS](https://spring.io/projects/spring-hateoas) and [Spring Data JPA](https://spring.io/projects/spring-data-jpa). This means you get an executable JAR which exposes a REST API automatically.

## Motivation
The motivation is to demonstrate the power of Spring Boot and Spring Data JPA to generate REST APIs.

## Setup
This branch of the project is intended to be run locally in development/debug mode, for prototyping.

## Using and Testing the Application

Once you have the application running and connecting to the DB, then use the browser, PostMan, or cURL to use the API. Changes are only saved while the application is running, and the in-memory database is re-initialized on application reload.

### Browser
Visit the API directly in the browser at : [http://localhost:8080/](http://localhost:8080/). View the list notes in the browser at at [http://localhost:8080/notes](http://localhost:8080/notes), or individual note records as [http://localhost:8080/notes/1](http://localhost:8080/notes/1). The H2 console app is available at [http://localhost:8080/h2-console/](http://localhost:8080/h2-console).

### PostMan
Make sure that you have the PostMan application installed, then import the NotesRepo.postman_collection.json file into PostMan, which will have test requests pre-configured.You will find requests which demonstrate CRUD operations on the DB via HATEOAS calls: ListAll, Create, Delete, Update and Get First Note.

### cURL
Alternatively, if you don't use PostMan you can use curl:
- curl http://localhost:8080/notes
- curl http://localhost:8080/notes/1
- curl http://localhost:8080/notes -X POST -d '{"note":"This is my new note"}' -H "Content-Type: application/json"
- curl http://localhost:8080/notes/1 -X PUT -d '{"note":"I forgot my first post!"}' -H "Content-Type: application/json"
- curl http://localhost:8080/notes/1 -X DELETE

## To Run Locally
Use Maven or a debug configuration in your IDE. The API should be available at [http://localhost:8080/](http://localhost:8080/). The H2 database console should be available at [http://localhost:8080/h2-console](http://localhost:8080/h2-console). Set the JDBC URL to 'jdbc:h2:mem:testdb' to access the in-memory database, leaving user id at 'sa' and password empty. From the console you can perform SQL operations directly.

### Debug in VS Code
Run 'mvn compile'
Open the DemoRestMysqlApplication.java file in the editor and click the 'debug' link (provided by VS Code) just above the main method.
