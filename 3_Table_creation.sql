SET SERVEROUTPUT ON;

DECLARE
        t_name varchar2(100);
        table_query VARCHAR2(2000);
        row_cnt NUMBER;
    BEGIN
        dbms_output.put_line('>>> Firing OXygen Cylinder Plant Table Creation Procedure');
        
        t_name:='OXYGEN_CYLINDER_PLANT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        -- dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table OXygen Cylinder Plant exists');
                
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE OXYGEN_CYLINDER_PLANT(
                                    plant_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                    name VARCHAR2(500),
                                    address VARCHAR2(1000),
                                    phone_number NUMERIC(10,0),
                                    county VARCHAR2(500),
                                    email_id VARCHAR2(500),
                                    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                    PRIMARY KEY (plant_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table OXYGEN_CYLINDER_PLANT is created ');
                
            END;
        END IF;
        EXCEPTION
            when no_data_found then
                BEGIN
                    table_query:= 'CREATE TABLE OXYGEN_CYLINDER_PLANT(
                                    plant_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                    name VARCHAR2(500),
                                    address VARCHAR2(1000),
                                    phone_number NUMERIC(10,0),
                                    county VARCHAR2(500),
                                    email_id VARCHAR2(500),
                                    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                    PRIMARY KEY (plant_id))' ;
                    EXECUTE IMMEDIATE table_query;
                    dbms_output.put_line('Table OXYGEN_CYLINDER_PLANT is created ');

                END;
            when others then
                    dbms_output.put_line('Something went wrong in OXYGEN_CYLINDER_PLANT table creation');

END;
/

-- OXYGEN CYLINDER DETAILS TABLE 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing OXygen Cylinder Details Table Creation Procedure');
        t_name:='OXYGEN_CYLINDER_DETAILS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table OXygen Cylinder Details exists');
            
        ELSE
            BEGIN      
                 table_query:= ' CREATE TABLE OXYGEN_CYLINDER_DETAILS (
                                      cylinder_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                      plant_id NUMERIC(20,0),
                                      quantity NUMERIC,
                                      available_status NUMERIC(1,0),
                                      created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      CONSTRAINT OXYGEN_CYLINDER_DETAILS_PK PRIMARY KEY (CYLINDER_ID),
                                      CONSTRAINT OXYGEN_CYLINDER_DETAILS_FK_PLANT_ID FOREIGN KEY(PLANT_ID)
                                      REFERENCES OXYGEN_CYLINDER_PLANT(PLANT_ID))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> TABLE OXYGEN_CYLINDER_PLANT is created');
            END;
        END IF;
        EXCEPTION 
            when no_data_found then
             BEGIN
                     table_query:=   'CREATE TABLE OXYGEN_CYLINDER_DETAILS (
                                      cylinder_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                      plant_id NUMERIC(20,0),
                                      quantity NUMERIC,
                                      available_status NUMERIC(1,0),
                                      created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      CONSTRAINT OXYGEN_CYLINDER_DETAILS_PK PRIMARY KEY (CYLINDER_ID),
                                      CONSTRAINT OXYGEN_CYLINDER_DETAILS_FK_PLANT_ID FOREIGN KEY(PLANT_ID)
                                      REFERENCES OXYGEN_CYLINDER_PLANT(PLANT_ID))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> TABLE OXYGEN_CYLINDER_PLANT is created');
            END;
        when others then
               dbms_output.put_line('>>> Something went wrong in OXYGEN_CYLINDER_PLANT table creation');
END;
/



---- PAYMENT STATUS TABLE 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing PAYMENT STATUS TABLE Procedure');
        t_name:='PAYMENT_STATUS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table PAYMENT STATUS exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE PAYMENT_STATUS (
                                  payment_status_code INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                  status_description VARCHAR2(1500),
                                  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (payment_status_code))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table payment status is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE PAYMENT_STATUS (
                                  payment_status_code INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                  status_description VARCHAR2(1500),
                                  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (payment_status_code))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table payment status is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in Payment status table creation');
END;
/




--- PATIENT DETAILS TABLE 
SET SERVEROUTPUT ON;

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing PATIENT DETAILS TABLE Procedure');
        t_name:='PATIENT_DETAILS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table PATIENT DETAILS exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE patient_details (
                              covid_report_id NUMERIC(8,0),
                              name VARCHAR2(100),
                              address VARCHAR2(1000),
                              covid_status NUMERIC(1,0),
                              county VARCHAR2(500),
                              PRIMARY KEY (covid_report_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PATIENT DETAILS is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE patient_details (
                              covid_report_id NUMERIC(8,0),
                              name VARCHAR2(100),
                              address VARCHAR2(1000),
                              covid_status NUMERIC(1,0),
                              county VARCHAR2(500),
                              PRIMARY KEY (covid_report_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PATIENT DETAILS is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in PATIENT DETAILS table creation');
END;
/





--- RENTAL PRICE TABLE 
SET SERVEROUTPUT ON;

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing PATIENT DETAILS TABLE Procedure');
        t_name:='RENTAL_PRICE';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table RENTAL_PRICE exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE rental_price (
                              price_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              price NUMERIC,
                              PRIMARY KEY (price_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PATIENT DETAILS is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE rental_price (
                              price_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              price NUMERIC,
                              PRIMARY KEY (price_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table RENTAL PRICE is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in Rental Price table creation');
END;
/




-- PASSWORD TABLE 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('Firing PASSWORD TABLE Procedure');
        t_name:='PASSWORD';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table PASSWORD exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE password (
                                  password_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                  password_hash RAW(2000),
                                  password_salted VARCHAR2(500),
                                  password_question VARCHAR2(500),
                                  passsword_answer_hash RAW(2000),
                                  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (password_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PASSWORD is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE password (
                                  password_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                                  password_hash RAW(2000),
                                  password_salted VARCHAR2(500),
                                  password_question VARCHAR2(500),
                                  passsword_answer_hash RAW(2000),
                                  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (password_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PASSWORD is created');
        END;
               
            when others then
                    dbms_output.put_line('Something went wrong in PASSWORD table creation');
END;
/


-- ACCOUNT STATUS TABLE 
 
DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('Firing ACCOUNT STATUS Procedure');
        t_name:='ACCOUNT_STATUS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table ACCOUNT STATUS exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE account_status (
                              status_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              status_description VARCHAR2(500),
                                created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (status_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ACCOUNT STATUS is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE account_status (
                              status_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              status_description VARCHAR2(500),
                                created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (status_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ACCOUNT STATUS is created');
        END;
               
            when others then
                    dbms_output.put_line('Something went wrong in ACCOUNT STATUS table creation');
END;
/



DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing ROLE Procedure');
        t_name:='ROLE';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table ROLE exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE ROLE (
                              role_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              role_description VARCHAR2(500),
                              display_name VARCHAR2(50),
                             created_by_id NUMBER(16,0),
                             created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (role_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ROLE is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE ROLE (
                              role_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              role_description VARCHAR2(500),
                              display_name VARCHAR2(50),
                             created_by_id NUMBER(16,0),
                             created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (role_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ROLE is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in ROLE table creation');
END;
/


--- Permissions method TABLE


DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing PERMISSIONS Procedure');
        t_name:='PERMISSIONS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table PERMISSIONS exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE permissions (
                              permission_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              role_id NUMBER(16,0),
                              type VARCHAR2(10),
                              description VARCHAR2(1000),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT PERMISSIONS_FK_ROLE_ID FOREIGN KEY(ROLE_ID)
                                    REFERENCES ROLE(ROLE_ID),
                              PRIMARY KEY (permission_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PERMISSIONS is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE permissions (
                              permission_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              role_id NUMBER(16,0),
                              type VARCHAR2(10),
                              description VARCHAR2(1000),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                CONSTRAINT PERMISSIONS_FK_ROLE_ID FOREIGN KEY(ROLE_ID)
                                    REFERENCES ROLE(ROLE_ID),
                              PRIMARY KEY (permission_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PERMISSIONS is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in PERMISSIONS table creation');
END;
/




-- Payment method TABLE 
SET SERVEROUTPUT ON;

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing PAYMENT METHOD Procedure');
        t_name:='PAYMENT_METHOD';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table PAYMENT METHOD exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE payment_method (
                              payment_method_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              description VARCHAR2(500),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (payment_method_id)
                              )';
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PAYMENT METHOD is created');
            END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE payment_method (
                              payment_method_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              description VARCHAR2(500),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (payment_method_id)
                              )';
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table PAYMENT METHOD is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in PAYMENT METHOD table creation');
END;
/




-- Renter Payment Checkout Table 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('Firing RENTER PAYMENT CHECKOUT Procedure');
        t_name:='RENTER_PAYMENT_CHECKOUT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table RENTER PAYMENT CHECKOUT exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE renter_payment_checkout (
                              transaction_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL ,
                              payment_method_id NUMERIC(2,0),
                              account_id NUMBER(20,0),
                              details VARCHAR2(500),
                              payment_made NUMERIC(4,2),
                              payment_due NUMERIC(4,2),
                              PRIMARY KEY (transaction_id),
                              CONSTRAINT FK_renter_payment_checkout FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table RENTER PAYMENT CHECKOUT is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE renter_payment_checkout (
                              transaction_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL ,
                              payment_method_id NUMERIC(2,0),
                              account_id NUMBER(20,0),
                              details VARCHAR2(500),
                              payment_made NUMERIC(4,2),
                              payment_due NUMERIC(4,2),
                              PRIMARY KEY (transaction_id),
                              CONSTRAINT FK_renter_payment_checkout FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table RENTER PAYMENT CHECKOUT is created');
        END;
               
            when others then
                    dbms_output.put_line('Something went wrong in RENTER PAYMENT CHECKOUT table creation');
END;
/


-- Account TABLE 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing ACCOUNT Procedure');
        t_name:='ACCOUNT';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table ACCOUNT exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE Account (
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
                              plant_id INT ,
                              PRIMARY KEY (account_id),
                              CONSTRAINT FK_Account_status_id FOREIGN KEY (account_status_id) REFERENCES account_status(status_id),
                              CONSTRAINT FK_Account_plant_id FOREIGN KEY (plant_id) REFERENCES OXYGEN_CYLINDER_PLANT(plant_id),
                              CONSTRAINT FK_Account_password_id FOREIGN KEY (password_id) REFERENCES PASSWORD(password_id),
                              CONSTRAINT FK_Account_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;
                EXECUTE IMMEDIATE table_query;
                                dbms_output.put_line('>>> Table ACCOUNT is created');
            END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE Account (
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
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ACCOUNT is created');
        END;
               
            when others then
                    dbms_output.put_line('Something went wrong in ACCOUNT table creation');
END;
/


-- Account Role Mapping History TABLE 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('Firing ACCOUNT ROLE MAPPING HISTORY Procedure');
        t_name:='ACCOUNT_ROLE_MAPPING_HISTORY';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table  ACCOUNT ROLE MAPPING HISTORY exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE account_role_mapping_history (
                              mapping_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              account_id NUMBER(20, 0),
                              role_id NUMBER(2,0),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              created_by_id NUMBER(16,0),
                              PRIMARY KEY (mapping_id),
                              CONSTRAINT FK_account_role_mapping_history_account_id FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
                              CONSTRAINT FK_account_role_mapping_history_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ACCOUNT ROLE MAPPING HISTORY is created');

            END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE account_role_mapping_history (
                              mapping_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                              account_id NUMBER(20, 0),
                              role_id NUMBER(2,0),
                              created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              created_by_id NUMBER(16,0),
                              PRIMARY KEY (mapping_id),
                              CONSTRAINT FK_account_role_mapping_history_account_id FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
                              CONSTRAINT FK_account_role_mapping_history_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ACCOUNT ROLE MAPPING HISTORY is created');
        END;
               
            when others then
                    dbms_output.put_line('Something went wrong in ACCOUNT_ROLE_MAPPING_HISTORY table creation');
END;
/




-- Authentication Config Table 

DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing AUTHENTICATION CONFIG Procedure');
        t_name:='AUTHENTICATION_CONFIG';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('Table AUTHENTICATION CONFIG exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE authentication_config (
                          session_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                          login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          ip_address VARCHAR2(500),
                          time_zone_data VARCHAR2(500),
                          is_logout NUMERIC(1,0),
                          logout_time TIMESTAMP,
                          account_id NUMERIC(20,0),
                          PRIMARY KEY (session_id),
                          CONSTRAINT FK_authentication_config FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table AUTHENTICATION CONFIG is created');
        END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE authentication_config (
                          session_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
                          login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          ip_address VARCHAR2(500),
                          time_zone_data VARCHAR2(500),
                          is_logout NUMERIC(1,0),
                          logout_time TIMESTAMP,
                          account_id NUMERIC(20,0),
                          PRIMARY KEY (session_id),
                          CONSTRAINT FK_authentication_config FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id))' ;
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table AUTHENTICATION CONFIG is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in AUTHENTICATION CONFIG table creation');
END;
/


DECLARE
         t_name varchar2(100);
         table_query VARCHAR2(2000);
         row_cnt NUMBER;
     BEGIN
        dbms_output.put_line('>>> Firing ORDERS Procedure');
        t_name:='ORDERS';
        select count(*) into row_cnt from user_tables where table_name = t_name;
        --dbms_output.put_line(row_cnt);
        IF(row_cnt > 0) THEN
                dbms_output.put_line('>>> Table ORDERS exists');
        ELSE
            BEGIN
                table_query:= 'CREATE TABLE orders (
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
                        EXECUTE IMMEDIATE table_query;
                     dbms_output.put_line('>>> Table ORDERS is created');

            END;
    END IF;
    EXCEPTION
      when no_data_found then

    BEGIN
        table_query:= 'CREATE TABLE orders (
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
                EXECUTE IMMEDIATE table_query;
                dbms_output.put_line('>>> Table ORDERS is created');
        END;
               
            when others then
                    dbms_output.put_line('>>> Something went wrong in ORDERS table creation');
END;
/



--- INDEX Scripts --

--- Rental Price Table Index 

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

-- Oxygen Cylinder Table Index 

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

------ Account  Table Index  Account-id and County Index 

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

-- Account-id and Role-id Index 

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

--- Orders Table indexes 

--Order-id and booked_date 

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
