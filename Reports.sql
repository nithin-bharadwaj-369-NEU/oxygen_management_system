-- Count of orders raised at a Plant.

SELECT p.name,'ORDERS_COUNT', COUNT(*)
FROM ORDERS o
JOIN OXYGEN_CYLINDER_PLANT p
ON o.plant_id = p.plant_id
GROUP BY p.name;

-- Number of Available Cylinders at a Plant.

SELECT p.name,'Number of Available Cylinders', SUM(d.QUANTITY) AS AVAIL_CYLINDERS
FROM OXYGEN_CYLINDER_DETAILS d
JOIN OXYGEN_CYLINDER_PLANT p
ON d.plant_id = p.plant_id
WHERE AVAILABLE_STATUS = 1
GROUP BY p.name;

---Number of patients in a county 

SELECT county, 'countywise patinet count',COUNT(county)
FROM patient_details GROUP BY county;

--Which county has more orders

select a.county,count(1) from orders o join account a 
on o.account_id = a.account_id
group by a.county;

--Status of Orders which are complete and Incomplete

select ps.status_description,count(1) from orders o join payment_status ps
on o.payment_status_code = ps.payment_status_code
group by ps.status_description;
