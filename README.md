# Simple Spring Data JPA (REST) on MySQL

# Overview
This project creates a Spring Boot executable JAR which connects to a MySQL database and exposes that database via a RESTful interface. It is intended to be used in conjunction with the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project (which sets up a Java+MariaDB instance on AWS in less than 5 minutes), but may be used standalone. See 'To Run Locally', below. It demonstrates the power of [Spring Data JPA](https://spring.io/projects/spring-data-jpa) by creating an entire HATEOAS (REST) interface with 3 java files, and only a few lines of code. The Notes.java entity class is the largest file, but 90% of that was auto-generated from the class fields. The NotesRepository.java class is almost empty.

# Goal
The goal of this project is to create a [Spring Boot](https://spring.io/projects/spring-boot) application, which uses [Spring HATEOAS](https://spring.io/projects/spring-hateoas) and [Spring Data JPA](https://spring.io/projects/spring-data-jpa). This means you get an executable JAR which exposes a REST API automatically.

# Motivation
The motivation is to demonstrate the power of Spring Boot and Spring Data JPA by building the a simple application, and which integrates with the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project.

# Setup
This project is intended to be used in conjunction with the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project, but may be used standalone. The [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project sets up a Java+MariaDB instance on AWS in less than 5 minutes and downloads a build of this application into it. Simply pull the repo and follow the instructions in the README. This step also makes running locally very easy, with a single line configuration change in application.properties. Or follow the instructions at 'To Run Locally' below.

## Using and Testing the Application

Once you have the application running and connecting to the DB, then use the browser or PostMan to use the API.

Make sure that you have the PostMan application installed. Import the NotesRepo.postman_collection.json file. You will need to modify the request URLs to use your AWS server address and not 'localhost:8080'. For example: 'ec2-34-239-101-47.compute-1.amazonaws.com' (the application reponds on port 80, so no ':8080' is needed). You will find requests which demonstrate CRUD operations on the DB via HATEOAS calls: ListAll, Create, Delete, Update and Get First Note.

Also, you can visit the site directly in the browser at : http://<your_instance_address>/. For example: http://ec2-34-239-101-47.compute-1.amazonaws.com.

# To Run Locally
If you want to experiment with Spring Data Rest by changing the files locally, then you can run the API service locally and connect to a remote DB. Once the DB setup is complete, then modify the application.properties file to change 'localhost' to the address of your AWS EC2 instance (or your DB instance address), and run 'mvn spring-boot:run'.

The Easy Way: Download and follow the instructions at the [ec2-l2-java-mariadb](https://github.com/kbaynes/ec2-l2-java-mariadb) project, which will create an EC2 instance and set up the DB as necessary.

The Hard Way: If you have a MySQL instance running somewhere, use the setup.sql file to setup a MariaDB or MySQL DB with the correct DB name, user name and password, table and some starter data.

