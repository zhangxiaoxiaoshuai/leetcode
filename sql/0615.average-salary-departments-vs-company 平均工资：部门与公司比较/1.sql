# Link: https://leetcode-cn.com/problems/average-salary-departments-vs-company

SELECT DISTINCT DATE_FORMAT(`pay_date`, '%Y-%m')                        AS `pay_month`,
                `department_id`,
                IF(`b` = `a`, 'same', IF(`a` < `b`, 'lower', 'higher')) AS `comparison`
FROM (SELECT `department_id`,
             `amount`,
             `pay_date`,
             AVG(`amount`) OVER (PARTITION BY `pay_date`,`department_id`) AS `a`,
             AVG(`amount`) OVER (PARTITION BY `pay_date`)                 AS `b`
      FROM `salary` `st`
               JOIN `employee` `et` ON `st`.`employee_id` = `et`.`employee_id`) `t`
ORDER BY `pay_month` DESC;