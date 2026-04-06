-- sales_by_film_category 

SELECT 
	Category, 
	total_sales, 
	RANK() OVER (ORDER BY total_sales  DESC ) AS Sales_Rank 
 FROM sales_by_film_category 
 ORDER BY total_sales DESC

--payment and rental relationship

select * from payment

select * from rental

select amount, inventory_id from rental as r 
inner join payment as p on r.rental_id = p.rental_id
 

-- inventory, film , category

select  fc.film_id,   inventory_id, name, store_id from film_category as fc 
inner join inventory as i on fc.film_id = i.film_id
inner join category as c on fc.category_id = c.category_id
where store_id = 1

-- count of inventory by category

SELECT 
	name , 
	Inventory_count ,  
	DENSE_RANK () OVER (ORDER BY Inventory_Count DESC) AS  InvRank
FROM 
(
	SELECT name , count(inventory_id) as Inventory_Count    FROM film_category AS fc 
	INNER JOIN inventory AS i ON fc.film_id = i.film_id
	INNER JOIN category AS c ON fc.category_id = c.category_id
	GROUP BY name 
	ORDER BY Inventory_Count DESC
) AS A


