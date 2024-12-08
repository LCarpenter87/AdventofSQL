WITH RECURSIVE workshop_hierarchy AS (
    SELECT 
        staff_id,
        manager_id,
        1 AS Level
    FROM 
        day8_staff
    WHERE 
        Manager_ID IS NULL
    UNION ALL
    SELECT 
        s.staff_id,
        s.manager_id,
        Level + 1
    FROM 
        day8_staff s
    INNER JOIN workshop_hierarchy oc
        ON s.manager_id = oc.staff_id
        )
SELECT 
  max(level)
FROM 
  OrgChart;
