WITH base_table AS (
SELECT 
	reindeer_id, 
	reindeer_name, 
	exercise_name, 
	round(avg(speed_record)::decimal, 2) AS highest_average_score,
	RANK() OVER (PARTITION BY reindeer_id ORDER BY round(avg(speed_record)::decimal, 2) desc)
FROM 
	day9_reindeers dr 
INNER JOIN 
	day9_training_sessions dts USING (reindeer_id)
WHERE 
	reindeer_id != 9
GROUP BY 
	reindeer_id, exercise_name
) 
SELECT 
	reindeer_id, 
	reindeer_name, 
	highest_average_score 
FROM 
	base_table 
WHERE 
	RANK = 1 
ORDER BY 
	highest_average_score desc
