-- Trigger to Insert Cylinder ---

CREATE OR REPLACE TRIGGER insert_cylinder_trigger
AFTER INSERT ON OXYGEN_CYLINDER_DETAILS
REFERENCING OLD as old_values NEW AS new_values
FOR EACH ROW
    ENABLE
DECLARE
--        account_id INT;
        V_DATE VARCHAR2(20);
BEGIN
    SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') into V_DATE from dual;

    IF INSERTING THEN
           dbms_output.put_line(SQL%ROWCOUNT || 'Row has been inserted on ' || V_DATE);
           dbms_output.put_line('Inserted Values : ' || :new_values.cylinder_id );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error('-20030', SQLERRM);
END;
 /

-- Trigger to Delete Cylinder ---

 CREATE OR REPLACE TRIGGER delete_cylinder_trigger
AFTER DELETE ON OXYGEN_CYLINDER_DETAILS
REFERENCING OLD as old_values NEW AS new_values
FOR EACH ROW
    ENABLE
DECLARE
--        account_id INT;
        V_DATE VARCHAR2(20);
BEGIN
    SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') into V_DATE from dual;

    IF DELETING THEN
           dbms_output.put_line(SQL%ROWCOUNT || 'Row has been inserted on ' || V_DATE);
           dbms_output.put_line('Deleted Values : ' || :old_values.cylinder_id );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error('-20030', SQLERRM);
END;
 /

-- Trigger to Update Cylinder ---

 CREATE OR REPLACE TRIGGER update_cylinder_trigger
AFTER UPDATE ON OXYGEN_CYLINDER_DETAILS
REFERENCING OLD as old_values NEW AS new_values
FOR EACH ROW
    ENABLE
DECLARE
--        account_id INT;
        V_DATE VARCHAR2(20);
BEGIN
    SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') into V_DATE from dual;

    IF UPDATING THEN
           dbms_output.put_line(SQL%ROWCOUNT || 'Row has been updated on ' || V_DATE);
            dbms_output.put_line('Previous Values : ' || :old_values.cylinder_id );
           dbms_output.put_line('New Values : ' || :new_values.cylinder_id );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error('-20030', SQLERRM);
END;
 /
