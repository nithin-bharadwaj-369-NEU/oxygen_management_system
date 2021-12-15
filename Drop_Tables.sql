-- Drop Tables.
create or replace procedure  drop_table(
        table_name IN VARCHAR2)
IS
BEGIN
     EXECUTE IMMEDIATE 'DROP TABLE ' || table_name || ' CASCADE CONSTRAINTS';
end drop_table;
/

BEGIN
        dbms_output.put_line('>>> Dropping Role table using Procedure');
        drop_table('ROLE');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
         dbms_output.put_line('>>> Executuion of procedure is Done to drop role table');

END;
/


BEGIN
        dbms_output.put_line('-----------------------------------------Firing Account table destruction Procedure------------------------------------------------------------------');
        drop_table('ACCOUNT');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing Account role mapping history table destruction Procedure------------------------------------------------------------------');
        drop_table('ACCOUNT_ROLE_MAPPING_HISTORY');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing Account status table destruction Procedure------------------------------------------------------------------');
        drop_table('ACCOUNT_STATUS');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing Authenticaiton config table destruction Procedure------------------------------------------------------------------');
        drop_table('AUTHENTICATION_CONFIG');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing Orders table destruction Procedure------------------------------------------------------------------');
        drop_table('ORDERS');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing OXYGEN_CYLINDER_DETAILS table destruction Procedure------------------------------------------------------------------');
        drop_table('OXYGEN_CYLINDER_DETAILS');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing OXYGEN_CYLINDER_PLANT table destruction Procedure------------------------------------------------------------------');
        drop_table('OXYGEN_CYLINDER_PLANT');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing PASSWORD table destruction Procedure------------------------------------------------------------------');
        drop_table('PASSWORD');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing PATIENT_DETAILS table destruction Procedure------------------------------------------------------------------');
        drop_table('PATIENT_DETAILS');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing PAYMENT_METHOD table destruction Procedure------------------------------------------------------------------');
        drop_table('PAYMENT_METHOD');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing PAYMENT_STATUS table destruction Procedure------------------------------------------------------------------');
        drop_table('PAYMENT_STATUS');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing PERMISSIONS table destruction Procedure------------------------------------------------------------------');
        drop_table('PERMISSIONS');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing RENTAL_PRICE table destruction Procedure------------------------------------------------------------------');
        drop_table('RENTAL_PRICE');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BEGIN
        dbms_output.put_line('-----------------------------------------Firing RENTER_PAYMENT_CHECKOUT table destruction Procedure------------------------------------------------------------------');
        drop_table('RENTER_PAYMENT_CHECKOUT');
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN --"table not found" exception
                RAISE;
            END IF;
            dbms_output.put_line('Table does not exist to drop from database');
            dbms_output.put_line('--------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/
