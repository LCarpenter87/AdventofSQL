WITH basetable AS
(
SELECT 
c.name,
wl.wishes ->> 'first_choice' AS primary_wish,
wl.wishes ->> 'second_choice' AS backup_wish,
wl.wishes -> 'colors' ->> 0 AS favourite_color,
json_array_length(wl.wishes -> 'colors') AS colors_count
FROM wish_lists wl
LEFT JOIN children c USING (child_id)
)
SELECT 
bt.*,
CASE WHEN tc.difficulty_to_make = 1 THEN 'Simple Gift'
	 WHEN tc.difficulty_to_make = 2 THEN 'Moderate Gift'
	 ELSE 'Complex Gift'
	 END AS gift_complexity,
CASE tc.category WHEN 'outdoor' THEN 'Outside Workshop'
                 WHEN 'educational' THEN 'Learning Workshop'
                 ELSE'General Workshop' END AS workshop_assignment
FROM basetable bt
LEFT JOIN toy_catalogue tc ON bt.primary_wish = tc.toy_name
ORDER BY NAME
LIMIT 5;
