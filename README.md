# Simple Spring Data JPA (REST) on MySQL (or H2)

## Overview
This project creates a Spring Boot executable JAR which connects to a MySQL database and exposes that database via a RESTful interface. It is intended to be used in conjunction with the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project (which sets up a Java+MariaDB instance on AWS in less than 5 minutes), but may be used standalone. See 'To Run Locally', below. It demonstrates the power of [Spring Data JPA](https://spring.io/projects/spring-data-jpa) by creating an entire HATEOAS (REST) interface with 3 java files, and only a few lines of code. The Notes.java entity class is the largest file, but 90% of that was auto-generated from the class fields. The NotesRepository.java class is almost empty.

Checkout the 'h2' branch for a local development setup using the H2 in memory database. This is the simplest way to prototype.

## Goal
The goal of this project is to create a [Spring Boot](https://spring.io/projects/spring-boot) application, which uses [Spring HATEOAS](https://spring.io/projects/spring-hateoas) and [Spring Data JPA](https://spring.io/projects/spring-data-jpa). This means you get an executable JAR which exposes a REST API automatically.

## Motivation
The motivation is to demonstrate the power of Spring Boot and Spring Data JPA by building the a simple application, and which integrates with the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project.

## Setup
This project is intended to be used in conjunction with the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project, but may be used standalone. The [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project sets up a Java+MariaDB instance on AWS in less than 5 minutes and downloads a build of this application into it. Simply pull the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) repo and follow the instructions in the README. This [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project also makes running locally very easy, because you can point your local instance of this project to a configured and running MariaDB with a single line configuration change in application.properties (follow the instructions at 'To Run Locally' below).

## Using and Testing the Application

Once you have the application running and connecting to the DB, then use the browser, PostMan, or cURL to use the API.

### Browser
Visit the site directly in the browser at : http://<your_instance_address>/. For example: http://ec2-34-239-101-47.compute-1.amazonaws.com. View the list notes at http://<your_instance_address>/notes, or individual note records as http://<your_instance_address>/notes/1.

### PostMan
Make sure that you have the PostMan application installed, then import the NotesRepo.postman_collection.json file into PostMan, which will have test requests pre-configured. You will need to modify the request URLs to use your AWS server address and not 'localhost:8080'. For example: 'ec2-34-239-101-47.compute-1.amazonaws.com' (the application reponds on port 80, so no ':8080' is needed). You will find requests which demonstrate CRUD operations on the DB via HATEOAS calls: ListAll, Create, Delete, Update and Get First Note.

### cURL
Alternatively, if you don't use PostMan you can use curl:
- curl http://<your_instance_address>/notes
- curl http://<your_instance_address>/notes/1
- curl http://<your_instance_address>/notes -X POST -d '{"note":"This is my new note"}' -H "Content-Type: application/json"
- curl http://<your_instance_address>/notes/1 -X PUT -d '{"note":"I forgot my first post!"}' -H "Content-Type: application/json"
- curl http://<your_instance_address>/notes/1 -X DELETE

## To Run Locally
If you want to experiment with Spring Data Rest by changing the files locally, then you can run the API service locally and connect to a remote DB. Once the DB setup is complete, then modify the application.properties (spring.datasource.url property) file to change 'localhost' to the address of your AWS EC2 instance (or your DB instance address), and run 'mvn spring-boot:run'.

The Easy Way: Download and follow the instructions at the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project, which will create an EC2 instance and set up the DB as necessary. Then change application.properties (spring.datasource.url property) to replace 'localhost' with the address of your instance.

The Hard Way: If you have a MySQL instance running somewhere, use the setup.sql file to setup a MariaDB or MySQL DB with the correct DB name, user name and password, table and some starter data.
