WITH tag_comparison AS (
    SELECT 
        toy_id,
        ARRAY(SELECT UNNEST(new_tags) EXCEPT SELECT UNNEST(previous_tags)) AS brand_new,
        ARRAY(SELECT UNNEST(previous_tags) INTERSECT SELECT UNNEST(new_tags)) AS unchanged,
        ARRAY(SELECT UNNEST(previous_tags) EXCEPT SELECT UNNEST(new_tags)) AS removed
    FROM 
        day4_toy_production
)
SELECT 
    toy_id,
    cardinality(brand_new) AS brand_new_count,
    cardinality(unchanged) AS unchanged_count,
    cardinality(removed) AS removed_count
FROM 
    tag_comparison
ORDER BY 
	brand_new_count DESC
LIMIT 1;
