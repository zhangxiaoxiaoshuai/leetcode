# Link: https://leetcode-cn.com/problems/the-number-of-employees-which-report-to-each-employee

SELECT `e1`.`reports_to`        `employee_id`,
       `e2`.`name`,
       count(`e1`.`reports_to`) `reports_count`,
       round(avg(`e1`.`age`))   `average_age`
FROM `employees`          `e1`
         JOIN `employees` `e2` ON `e1`.`reports_to` = `e2`.`employee_id`
GROUP BY `e1`.`reports_to`, `e2`.`name`
ORDER BY `e1`.`reports_to`