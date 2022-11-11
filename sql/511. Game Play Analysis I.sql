-- https://leetcode.com/problems/game-play-analysis-i/

SELECT player_id,
       Min(event_date) AS first_login
FROM   activity
GROUP  BY player_id 
