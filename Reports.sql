-- Count of orders raised at a Plant.

SELECT p.name,'Number of ORDERS raised to a Plant', COUNT(*)
FROM ORDERS o
JOIN OXYGEN_CYLINDER_PLANT p
ON o.plant_id = p.plant_id
GROUP BY p.name;

-- Number of Available and UnAvailable Cylinders at a Plant.

With available_cyl as
(
Select plant_id, sum(quantity) as available_count
From oxygen_cylinder_details
Where available_status=1
group by plant_id
) ,
Not_available_cyl as
(
Select plant_id, sum(quantity) as non_available_count
From oxygen_cylinder_details
Where available_status =0
Group by plant_id
)
Select c.name,
'Number of Available Cylinders', a.available_count,
'Number of UnAvailable Cylinders', b.non_available_count
From available_cyl a

--Number of patients in a county

SELECT county, 'Patient Count CountyWise', COUNT(county)
FROM patient_details
GROUP BY county;

--Status of Orders which are complete and Incomplete

select ps.status_description,'Order Status' count(1)
from orders o
join payment_status ps
on o.payment_status_code = ps.payment_status_code
group by ps.status_description;

--Which county has more orders

select a.county,'Orders In a County', count(1) 
from orders o
join account a
on o.account_id = a.account_id
group by a.county;
