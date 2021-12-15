--- 1. View Payment Status ---

CREATE OR REPLACE VIEW VwPaymentStatus
AS
  SELECT o.Order_ID AS numOfOrders,
         o.plant_id,
         Cast(o.booked_date AS TIMESTAMP) AS BookedDate,
         Cast(o.booking_end_date AS TIMESTAMP) AS BookedEndDate,
         ps.status_description AS PaymentStatus

  FROM   Orders o
         JOIN payment_status ps
           ON o.payment_status_code = ps.payment_status_code;
---
--WHERE  Cast(o.booked_date AS TIMESTAMP) = '09-12-21 09:26:50.12' ;
--  select * from VwPaymentStatus Where BookedDate = '09-12-21 09:26:50.12' ;
--select count(numOfOrders) AS Orders_Count, paymentStatus from VwPaymentStatus group by paymentStatus;
---



--- 2. Demand in a county based on number of plants ----

CREATE OR REPLACE VIEW VwDemand
AS
Select o.county AS County_Name,
       p.name AS Plant_Name
       from patient_details o join oxygen_cylinder_plant p
       ON o.county = p.county;
---
--select count(plant_name) AS Number_of_Plants from VwDemand where county_name = 'Suffolk';
---


---- 3. Available cylinders in a plant ---

CREATE OR REPLACE VIEW VWcylinder_details AS
SELECT
	o.cylinder_id,
	o.plant_id,
    p.name AS Plant_Name,
	o.available_status AS availability,
    o.quantity AS numberOfUnits,
	p.created_on AS Created_on
FROM
	oxygen_cylinder_details o
JOIN oxygen_cylinder_plant p
on o.plant_id = p.plant_id;

----
--select plant_Name, sum(numberOfUnits) AS Available_Cylinders from VWcylinder_details WHERE availability = 1 Group by plant_name;
---


---- 4. Number of orders placed in each plant ----

CREATE OR REPLACE VIEW VwOrders_InPlant
AS
SELECT o.plant_id,
       o.order_id AS OrderCount,
       p.name AS plant_name,
       p.email_id AS plant_email,
       p.county AS plant_county
FROM Orders o
JOIN oxygen_cylinder_plant p
ON o.plant_id = p.plant_id;

---
-select count(OrderCount) AS Num_Of_Orders , plant_name from VwOrders_InPlant group by plant_name;
---


----------------
