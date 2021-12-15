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
- First go to setup_scripts folder and run script grant_permissions.sql
    - This script will create user TEST_USER_1 with password Oxygenmanagementsystem123
    - Random and Crypto package access will be granted to his newly created user
- After running the setup scripts, please run Drop_tables.sql.
    - This script will drop any existing tables used in this project
- Once done with the above script, run the Table_creation.sql to create tables
    - This script will create the necessary tables needed for project with indexes.
