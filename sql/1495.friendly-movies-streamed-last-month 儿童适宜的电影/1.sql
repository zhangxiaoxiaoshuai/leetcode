# Link: https://leetcode-cn.com/problems/friendly-movies-streamed-last-month

SELECT DISTINCT `title`
FROM `tvprogram`             `t`
         LEFT JOIN `content` `c` ON `t`.`content_id` = `c`.`content_id`
WHERE left(`t`.`program_date`, 7) = '2020-06'
  AND `c`.`kids_content` = 'Y'
  AND `c`.`content_type` = 'Movies';
