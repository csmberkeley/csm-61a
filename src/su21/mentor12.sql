CREATE TABLE numbers AS
    SELECT "Papa John's Pizza" AS name, 5108457272 AS number UNION
    SELECT "UCPD", 5106426760 UNION
    SELECT "Foothill Mailroom", 5106429703;

CREATE TABLE fish AS
    SELECT "Salmon" AS species, 500 AS pop, 3.3 AS rate, 4 AS price, 30 AS pieces UNION
    SELECT "Eel", 100, 1.3, 4, 15 UNION
    SELECT "Yellowtail", 700, 2.0, 3, 30 UNION
    SELECT "Tuna", 600, 1.1, 3, 20;

CREATE TABLE competitors AS
    SELECT "Salmon" AS species, 2 AS price UNION
    SELECT "Eel", 3.4 UNION
    SELECT "Yellowtail", 3.2 UNION
    SELECT "Tuna", 2.6;

CREATE TABLE grades AS
    SELECT "10/31" AS day, "Music 70" AS class, 88 AS score UNION
    SELECT "9/20", "Math 1A", 72;

CREATE TABLE outfits AS
    SELECT "11/5" AS day, "Blue" AS color UNION
    SELECT "9/13", "Red" UNION
    SELECT "10/31", "Orange";

CREATE TABLE animals AS
    SELECT "Wilbur" as name, 4.1 as height, 150 as weight, "pig" as species UNION
    SELECT "Tigress", 4.4, 700, "tiger" UNION
    SELECT "Phil", 3.3, 79, "pig" UNION
    SELECT "Dug", 3.5, 40, "dog" UNION
    SELECT "Buddy", 4, 51, "dog" UNION
    SELECT "Marty", 4.9, 300, "zebra" UNION
    SELECT "Richard Parker", 5.2, 918, "tiger";