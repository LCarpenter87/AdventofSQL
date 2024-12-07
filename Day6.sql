SELECT 
	* 
FROM 
	day6_children dc
INNER JOIN 
	day6_gifts dg using(child_id)
WHERE
	price > (SELECT avg(price) FROM day6_gifts)
ORDER BY 
	price ASC
LIMIT 
	1;
