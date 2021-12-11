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
