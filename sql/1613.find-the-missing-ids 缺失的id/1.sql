# Link: https://leetcode-cn.com/problems/find-the-missing-ids

WITH RECURSIVE `num`(`n`) AS (
    SELECT 1 `a`
    UNION ALL
    SELECT `n` + 1
    FROM `num`
    WHERE `n` < 100
)
SELECT `n` `ids`
FROM `num`
WHERE `n` NOT IN (
    SELECT `customer_id`
    FROM `customers`
)
  AND `n` <= (
    SELECT max(`customer_id`)
    FROM `customers`
)