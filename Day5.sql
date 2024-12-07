-- Using a CTE base type to not have to repeat the long lag() 3 times. 
WITH base_table AS
(
SELECT 
	production_date,
	toys_produced, 
	LAG (toys_produced) OVER (ORDER BY production_date) AS previous_day
FROM 
	day5_toy_production dtp 
)
SELECT 
	production_date,
	toys_produced, 
	previous_day, 
	toys_produced - previous_day AS production_change,
	(toys_produced - previous_day)/toys_produced::decimal * 100 AS percent_change	
FROM
	base_table
ORDER BY 
	percent_change DESC NULLS LAST
LIMIT 1;
