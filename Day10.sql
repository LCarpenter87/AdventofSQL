-- Crosstab in postgreSQL is not fun

SELECT *
FROM crosstab(
    $$
    SELECT 
        date, 
        drink_name, 
        SUM(quantity)
    FROM day10_drinks
    GROUP BY date, drink_name
    ORDER BY date, drink_name
    $$,
    $$ SELECT DISTINCT drink_name FROM day10_drinks ORDER BY drink_name $$
) AS pivot_table(
    date DATE,
    Baileys INT,
    Eggnog INT,
    "Hot Cocoa" INT,
    "Mulled wine" INT,
    "Peppermint Schnapps" INT,
    "Sherry" INT
) WHERE "Hot Cocoa" = 38 AND "Peppermint Schnapps" = 298 AND Eggnog = 198

;
