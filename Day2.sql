SELECT string_agg(chr(value), '') AS decoded_message
FROM letters_b
WHERE (value >= 65 AND value <= 90)   
   OR (value >= 97 AND value <= 122)
   OR value in (32, 44, 33);      
