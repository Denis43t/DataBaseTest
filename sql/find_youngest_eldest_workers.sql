-- Знайти наймолодшого і найстаршого працівників
WITH extremes AS (
    SELECT
        'YOUNGEST' AS type,
        name,
        birthday
    FROM
        worker
    WHERE
        birthday = (SELECT MAX(birthday) FROM worker)

    UNION ALL

    SELECT
        'OLDEST' AS type,
        name,
        birthday
    FROM
        worker
    WHERE
        birthday = (SELECT MIN(birthday) FROM worker)
)

-- Вивести результати
SELECT
    type AS "TYPE",
    name AS "NAME",
    birthday AS "BIRTHDAY"
FROM
    extremes;
