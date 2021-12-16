# Oxygen Management System

## Problem Statement:
As 2nd wave of covid-19 is ravaging the lives of people in USA, the occurrence of clinical oxygen
shortage acted as catalyst to the deaths across Florida, Texas and other populated states. The
purpose of the database is to store, maintain and process data amidst the pandemic. The main
aim is to provide a platform where people can connect to the nearest oxygen suppliers for oxygen
cylinders in emergency

 
##  Purpose of the Repo
This repo has schema and the necessary code to populate data for working of oxygen management system as part of DAMG-6210 course

#### Project implemented under guidence of Professor: Naveen Kuragayala and TA : Sanjit Sateesh


## PROJECT MEMBERS:
- Namratha Gonuguntla
- Nithin Bharadwaj
- Rajesh Kaireddy
- Sai Kumar Ganga

## Steps to setup the project

#### <ins>Step 1</ins> 
- First go to setup_scripts folder and run script 1_grant_permissions.sql
    - This script will create user TEST_USER_1 with password Oxygenmanagementsystem123
    - Random and Crypto package access will be granted to his newly created user

#### <ins>Step 2</ins> 
- After running the setup scripts, please run 2_Drop_tables.sql.
    - This script will drop any existing tables used in this project
#### <ins>Step 3</ins>         
- Once done with the above script, run the 3_Table_creation.sql to create tables
    - This script will create the necessary tables needed for project with indexes.
#### <ins>Step 4</ins>     
- After running the tables scripts, run the 4_insert.sql file to create stored procedures and packages needed for insertion 

#### <ins>Step 5</ins>      
- After inserting the records into the tables, run the 5_insert_data.sql
    - This script will populate data into the tables 
#### <ins>Step 6</ins>
- Once done with the above script, run the 6_views.sql file  
    - This script generates the views to create user reports and charts for visualization
#### <ins>Step 7</ins> 
- Following up with the above script, runt the 7_triggers.sql file
    - This script will create triggers
#### <ins>Step 8</ins> 
- After running the trigger scripts, run the 8_testcases.sql file 
    - This script is used to validate the error handling of the data when invalid data is given as input.
#### <ins>Step 9</ins> 
- After running the trigger scripts, run the 10_demo.sql file 
    - This script is used to showcase the functionality of the system
    