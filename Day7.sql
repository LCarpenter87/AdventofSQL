WITH levels 
AS (
    SELECT 
        primary_skill, 
        max(years_experience) max_skill, 
        min(years_experience) min_skill
    FROM 
        day7_workshop_elves dwe
    GROUP BY
        primary_skill
) 
SELECT
    ma.elf_id AS experienced_elf_id,
    mi.elf_id AS inexperienced_elf_id,
    l.primary_skill,
    ROW_NUMBER() OVER (PARTITION BY l.primary_skill ORDER BY ma.elf_id, mi.elf_id) AS rank
FROM 
    levels l
INNER JOIN 
    day7_workshop_elves ma
    ON l.primary_skill = ma.primary_skill AND l.max_skill = ma.years_experience 
INNER JOIN 
    day7_workshop_elves mi
    ON l.primary_skill = mi.primary_skill AND l.min_skill = mi.years_experience
ORDER BY 
    rank, primary_skill, ma.elf_id, mi.elf_id
LIMIT 3;
