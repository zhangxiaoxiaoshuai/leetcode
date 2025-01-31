# Link: https://leetcode-cn.com/problems/warehouse-manager


SELECT `w`.`name`                                                   `warehouse_name`,
       sum(`w`.`units` * `p`.`width` * `p`.`length` * `p`.`height`) `volume`
FROM `warehouse` `w`
         JOIN
     `products`  `p`
     ON `w`.`product_id` = `p`.`product_id`
GROUP BY `w`.`name`;
