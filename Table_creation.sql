
--------------------------------------------------------------------- OXYGEN CYLINDER PLANT TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure oxygen_cylinder_plant_table_creation
IS
    table_name varchar2(1000);
BEGIN
    table_name:= 'CREATE TABLE OXYGEN_CYLINDER_PLANT(
                                      plant_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                        name VARCHAR2(500),
                                        address VARCHAR2(1000),
                                        phone_number NUMERIC(10,0),
                                        county VARCHAR2(500),
                                        email_id VARCHAR2(500),
                                        created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        PRIMARY KEY (plant_id))' ;
     EXECUTE IMMEDIATE table_name;
end oxygen_cylinder_plant_table_creation;

/
DECLARE
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing OXygen Cylinder Plant Table Creation Procedure------------------------------------------------------------------');
        t_name:='OXYGEN_CYLINDER_PLANT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table OXygen Cylinder Plant exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    oxygen_cylinder_plant_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_PLANT is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    oxygen_cylinder_plant_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_PLANT is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
            when others then
                    dbms_output.put_line('Something went wrong in OXYGEN_CYLINDER_PLANT table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END;
/

--------------------------------------------------------------------- OXYGEN CYLINDER DETAILS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure oxygen_cylinder_details_table_creation
IS
    table_name varchar2(5000);
BEGIN
    table_name:= 'CREATE TABLE OXYGEN_CYLINDER_DETAILS (
                              cylinder_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              plant_id NUMERIC(20,0),
                              quantity NUMERIC,
                              available_status NUMERIC(1,0),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT OXYGEN_CYLINDER_DETAILS_PK PRIMARY KEY (CYLINDER_ID),
                              CONSTRAINT OXYGEN_CYLINDER_DETAILS_FK_PLANT_ID FOREIGN KEY(PLANT_ID)
                                    REFERENCES OXYGEN_CYLINDER_PLANT(PLANT_ID))' ;
     EXECUTE IMMEDIATE table_name;
end oxygen_cylinder_details_table_creation;

/
DECLARE
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing OXygen Cylinder Details Table Creation Procedure------------------------------------------------------------------');
        t_name:='OXYGEN_CYLINDER_DETAILS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table OXygen Cylinder Details exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create oxygen_cylinder_details_table');
                    oxygen_cylinder_details_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_DETAILS is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    oxygen_cylinder_details_table_creation;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_DETAILS is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in OXYGEN_CYLINDER_DETAILS table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END;
/

--------------------------------------------------------------------- PAYMENT STATUS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure payment_status_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE PAYMENT_STATUS (
                                  payment_status_code INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                  status_description VARCHAR2(1500),
                                  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (payment_status_code))' ;     
     EXECUTE IMMEDIATE table_name;
end payment_status_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Payment status table Creation Procedure------------------------------------------------------------------');
        t_name:='PAYMENT_STATUS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table payment status exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create payment status table');
                    payment_status_table_creation;
                    dbms_output.put_line('Table payment status is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    payment_status_table_creation;
                    dbms_output.put_line('Table Payment statys table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in Payment status table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

--------------------------------------------------------------------- PATIENT DETAILS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure patient_details_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE patient_details (
                              covid_report_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              name VARCHAR2(100),
                              address VARCHAR2(1000),
                              covid_status NUMERIC(1,0),
                              county VARCHAR2(500),
                              PRIMARY KEY (covid_report_id))' ;     
     EXECUTE IMMEDIATE table_name;
end patient_details_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Patient details table Creation Procedure------------------------------------------------------------------');
        t_name:='PATIENT_DETAILS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Patient details table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create patient details table');
                    patient_details_table_creation;
                    dbms_output.put_line('Table patient details is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    patient_details_table_creation;
                    dbms_output.put_line('Table patient details is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in Patient table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/



--------------------------------------------------------------------- RENTAL PRICE TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure rental_price_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE rental_price (
                              price_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              price NUMERIC,
                              PRIMARY KEY (price_id))' ;     
     EXECUTE IMMEDIATE table_name;
end rental_price_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Patient details table Creation Procedure------------------------------------------------------------------');
        t_name:='RENTAL_PRICE';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Rental Price table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create rental price table');
                    rental_price_table_creation ;
                    dbms_output.put_line('Rental price table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    rental_price_table_creation;
                    dbms_output.put_line('Table rental price is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating rental price table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

-------------------------------------------------------------------- PASSWORD TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure password_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE password (
                                  password_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                  password_hash VARCHAR2(500),
                                  password_salted VARCHAR2(500),
                                  password_question VARCHAR2(500),
                                  passsword_answer_hash VARCHAR2(500),
                                  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (password_id))' ;     
     EXECUTE IMMEDIATE table_name;
end password_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing PASSWORD table Creation Procedure------------------------------------------------------------------');
        t_name:='PASSWORD';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Password table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create Password table');
                    password_table_creation ;
                    dbms_output.put_line('Password table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    password_table_creation;
                    dbms_output.put_line('Table Password is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Password table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

-------------------------------------------------------------------- ACCOUNT STATUS TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure account_status_table_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE account_status (
                              status_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              status_description VARCHAR2(500),
                                created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (status_id))' ;     
     EXECUTE IMMEDIATE table_name;
end account_status_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing ACCOUTN STATUS table Creation Procedure------------------------------------------------------------------');
        t_name:='ACCOUNT_STATUS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Account status table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create Account status table');
                    account_status_table_creation ;
                    dbms_output.put_line('Account status table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    account_status_table_creation;
                    dbms_output.put_line('Table Account status is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating account status table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

--------------------------------------------------------------------- CREATING ROLE TABLE ----------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

create or replace procedure role_table_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE ROLE (
                              role_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              role_description VARCHAR2(500),
                              display_name VARCHAR2(50),
                             created_by_id NUMBER(16,0),
                             created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (role_id))' ;
     EXECUTE IMMEDIATE table_name;
end role_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Role Table Creation Procedure------------------------------------------------------------------');
        t_name:='ROLE';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table Role exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    DBMS_OUTPUT.PUT_LINE('Inside block to create role table');
                    role_table_creation;
                    dbms_output.put_line('Table ROLE is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    role_table_creation;
                    dbms_output.put_line('Table ROLE is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in role table creation');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END;    
/

-------------------------------------------------------------------- Permissions method TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure permissions_method_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE permissions (
                              permission_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              role_id NUMBER(16,0),
                              type VARCHAR2(10),
                              description VARCHAR2(1000),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT PERMISSIONS_FK_ROLE_ID FOREIGN KEY(ROLE_ID)
                                    REFERENCES ROLE(ROLE_ID),
                              PRIMARY KEY (permission_id))' ;     
     EXECUTE IMMEDIATE table_name;
end permissions_method_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Permissions table Creation Procedure------------------------------------------------------------------');
        t_name:='PERMISSIONS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Permissions table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Permissions table');
                    permissions_method_creation ;
                    dbms_output.put_line('Permissions table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    permissions_method_creation;
                    dbms_output.put_line('Table Permissions method is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Permissions table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

-------------------------------------------------------------------- Payment method TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure payment_method_creation 
IS 
    table_name varchar2(1000);
BEGIN 
    table_name:= 'CREATE TABLE payment_method (
                              payment_method_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              description VARCHAR2(500),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (payment_method_id)
                            )' ;     
     EXECUTE IMMEDIATE table_name;
end payment_method_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Payment Method table Creation Procedure------------------------------------------------------------------');
        t_name:='PAYMENT_METHOD';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Payment method table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling method to create Payment method table');
                    payment_method_creation ;
                    dbms_output.put_line('Payment method table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    payment_method_creation;
                    dbms_output.put_line('Table Payment method is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Payment method table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


-------------------------------------------------------------------- Renter Payment Checkout Table ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure renter_payment_checkout_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE renter_payment_checkout (
                              transaction_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL ,
                              payment_method_id NUMERIC(2,0),
                              account_id NUMBER(20,0),
                              details VARCHAR2(500),
                              payment_made NUMERIC(4,2),
                              payment_due NUMERIC(4,2),
                              PRIMARY KEY (transaction_id),
                              CONSTRAINT FK_renter_payment_checkout FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id))' ;     
     EXECUTE IMMEDIATE table_name;
end renter_payment_checkout_creation;
/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Renter Payment Checkout Creation Procedure------------------------------------------------------------------');
        t_name:='RENTER_PAYMENT_CHECKOUT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Renter Payment Checkout table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Renter Payment Checkout table');
                    renter_payment_checkout_creation ;
                    dbms_output.put_line('Renter Payment Checkout table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    renter_payment_checkout_creation;
                    dbms_output.put_line('Table Renter Payment Checkout table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Renter Payment Checkout table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/


-------------------------------------------------------------------- Account TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure account_table_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE Account (
                              account_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              display_name VARCHAR2(50),
                              email_id VARCHAR2(500),
                              phone_number NUMBER(10,0),
                              address VARCHAR2(500),
                              county VARCHAR2(100),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              role_id NUMBER(2,0),
                              modified_by_id NUMBER(16,0),
                              modified_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              account_status_id NUMBER(2,0),
                              password_id NUMBER(20,0),
                              PRIMARY KEY (account_id),
                              CONSTRAINT FK_Account_status_id FOREIGN KEY (account_status_id) REFERENCES account_status(status_id),
                              CONSTRAINT FK_Account_password_id FOREIGN KEY (password_id) REFERENCES PASSWORD(password_id),
                              CONSTRAINT FK_Account_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;     
     EXECUTE IMMEDIATE table_name;
end account_table_creation;

/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Permissions table Creation Procedure------------------------------------------------------------------');
        t_name:='ACCOUNT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Permissions table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Account table');
                    account_table_creation ;
                    dbms_output.put_line('Account table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    account_table_creation;
                    dbms_output.put_line('Table Account is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Account table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

-------------------------------------------------------------------- Account Role Mapping History TABLE ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure account_role_mapping_history_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE account_role_mapping_history (
                              mapping_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              account_id NUMBER(20, 0),
                              role_id NUMBER(2,0),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              created_by_id NUMBER(16,0),
                              PRIMARY KEY (mapping_id),
                              CONSTRAINT FK_account_role_mapping_history_account_id FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
                              CONSTRAINT FK_account_role_mapping_history_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;     
     EXECUTE IMMEDIATE table_name;
end account_role_mapping_history_creation;
/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Account Role Mapping Procedure------------------------------------------------------------------');
        t_name:='ACCOUNT_ROLE_MAPPING_HISTORY';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Account Role Mapping table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Account Role Mapping table');
                    account_role_mapping_history_creation ;
                    dbms_output.put_line('Account Role Mapping table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    account_role_mapping_history_creation;
                    dbms_output.put_line('Table Account Role Mapping is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Account Role Mapping table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/

-------------------------------------------------------------------- Authentication Config Table ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure authentication_config_creation 
IS 
    table_name varchar2(4000);
BEGIN 
    table_name:= 'CREATE TABLE authentication_config (
                          session_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                          login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          IP VARCHAR2(500),
                          timezone VARCHAR2(500),
                          is_logout NUMERIC(1,0),
                          logout_time TIMESTAMP,
                          account_id NUMERIC(20,0),
                          PRIMARY KEY (session_id),
                          CONSTRAINT FK_authentication_config FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id))' ;     
     EXECUTE IMMEDIATE table_name;
end authentication_config_creation;
/
DECLARE 
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Permissions table Creation Procedure------------------------------------------------------------------');
        t_name:='AUTHENTICATION_CONFIG';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Authenticaion Config table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Authentication mapping table');
                    authentication_config_creation ;
                    dbms_output.put_line('Authentication mapping table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    authentication_config_creation;
                    dbms_output.put_line('Table Authentication config is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');
                    
                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Authentication config table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END; 
/



-------------------------------------------------------------------- Orders Table ----------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

create or replace procedure orders_table_creation
IS
    table_name varchar2(4000);
BEGIN
    table_name:= 'CREATE TABLE orders (
                              order_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              account_id NUMERIC(20,0),
                              rental_price_id NUMERIC(16,0),
                              transaction_id NUMERIC(30,0),
                              payment_status_code NUMERIC(1,0),
                              cylinder_id NUMERIC(25,0),
                              plant_id NUMERIC(20,0),
                              covid_report_id NUMERIC(8,0),
                              booked_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              booking_end_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (order_id),
                              CONSTRAINT FK_orders_account_id FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
                              CONSTRAINT FK_orders_cylinder_id FOREIGN KEY (cylinder_id) REFERENCES oxygen_cylinder_details(cylinder_id),
                              CONSTRAINT FK_orders_transcation_id FOREIGN KEY (transaction_id) REFERENCES renter_payment_checkout(transaction_id),
                              CONSTRAINT FK_orders_plant_id FOREIGN KEY (plant_id) REFERENCES oxygen_cylinder_plant(plant_id),
                              CONSTRAINT FK_orders_payment_status_code FOREIGN KEY (payment_status_code) REFERENCES payment_status(payment_status_code),
                              CONSTRAINT FK_orders_covid_report_id FOREIGN KEY (covid_report_id) REFERENCES patient_details(covid_report_id),
                              CONSTRAINT FK_orders_rental_price_id FOREIGN KEY (rental_price_id) REFERENCES rental_price(price_id))' ;
     EXECUTE IMMEDIATE table_name;
end orders_table_creation;
/
DECLARE
        t_name varchar2(100);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('-----------------------------------------Firing Orders Table Creation Procedure------------------------------------------------------------------');
        t_name:='ORDERS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Orders table exists');
                dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------');
        ELSE
                BEGIN
                    dbms_output.put_line('Calling proc to create Orders table');
                    orders_table_creation ;
                    dbms_output.put_line('Orders table is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    orders_table_creation;
                    dbms_output.put_line('Table Orders is created ');
                    dbms_output.put_line('---------------------------------------------------------------------------------------------------------------------------------------------------------');

                END;
            when others then
                    dbms_output.put_line(SQLERRM);
                    dbms_output.put_line('Something went wrong in creating Orders table');
                    dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');

END;
/





-------------------------------------------------------------- INDEX Scripts -----------------------------------------------------------------------------------------

------------------------------------------------ Rental Price Table Index ----------------------------------------------------------

SET SERVEROUTPUT ON;
declare
    already_exists exception;
    pragma exception_init( already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX price_index_idx ON rental_price(price_id, created_on)';
    dbms_output.put_line('Index created on price table successfully');
EXCEPTION
    when already_exists then
        dbms_output.put_line('Index price_index_idx is already present');
END;
/


------------------------------------------------ Oxygen Cylinder Table Index ----------------------------------------------------------

SET SERVEROUTPUT ON;
declare
    already_exists exception;
    pragma exception_init( already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX plant_cylinder_mapping_idx ON OXYGEN_CYLINDER_DETAILS(cylinder_id, plant_id)';
    dbms_output.put_line('Index created on Oxygen cylinder details table successfully');
EXCEPTION
    when already_exists then
        dbms_output.put_line('Index plant_cylinder_mapping_idx is already present');
END;
/
-------------------------------------------------------------------------- Account  Table Index ------------------------------------------------------------------------------------

------------------------------------------------ Account-id and County Index ----------------------------------------------------------

SET SERVEROUTPUT ON;
declare
    already_exists exception;
    pragma exception_init( already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX account_county_idx ON ACCOUNT(account_id, county)';
    dbms_output.put_line('Index created on Account-id and County columns of Account table successfully');
EXCEPTION
    when already_exists then
        dbms_output.put_line('Index account_county_idx is already present');
END;
/

------------------------------------------------ Account-id and Role-id Index ----------------------------------------------------------

SET SERVEROUTPUT ON;
declare
    already_exists exception;
    pragma exception_init( already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX account_role_idx ON ACCOUNT(account_id, role_id)';
    dbms_output.put_line('Index created on Account-id and Role-id columns of Account table successfully');
EXCEPTION
    when already_exists then
        dbms_output.put_line('Index account_role_idx is already present');
END;
/

----------------------------------------------------------------- Orders Table indexes -------------------------------------------------------------------------------------------

------------------------------------------------Order-id and booked_date -------------------------------------------------------- 

SET SERVEROUTPUT ON;
declare
    already_exists exception;
    pragma exception_init( already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX order_booked_date_idx ON ORDERS(order_id, booked_date)';
    dbms_output.put_line('Index created on Order-id and Booked Date columns of Orders table successfully');
EXCEPTION
    when already_exists then
        dbms_output.put_line('Index order_booked_date_idx is already present');
END;
/


------------------------------------------------Order-id and booked_date -------------------------------------------------------- 

SET SERVEROUTPUT ON;
declare
    already_exists exception;
    pragma exception_init( already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX order_booked_date_idx ON ORDERS(order_id, booked_date)';
    dbms_output.put_line('Index created on Order-id and Booked Date columns of Orders table successfully');
EXCEPTION
    when already_exists then
        dbms_output.put_line('Index order_booked_date_idx is already present');
END;
/