SELECT chair FROM lift WHERE couple > single;


SELECT chair, single - 2 * couple AS difference
FROM lift
WHERE single >= 4;


CREATE TABLE early_chairs AS
    SELECT chair, couple FROM lift WHERE chair < 4;


SELECT chair, single + 2 * couple AS people
FROM lift
WHERE couple >= 3
ORDER BY people DESC, chair ASC
LIMIT 2;


SELECT * FROM lift
ORDER BY single DESC, chair ASC
LIMIT 3;




