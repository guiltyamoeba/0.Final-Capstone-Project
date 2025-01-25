create database capstone;
use capstone;
/*view dataset*/
select *from football_data_merged_cleaned_data;
-- 1.find the top 10 players by most goals scored
select player_name_y, SUM(goals) as total_goals from football_data_merged_cleaned_data group by player_name_y order by total_goals desc limit 10;
-- Interpretation: 'Christian Pulisic' is the number 1 player by most goals scored (658).

-- 2.stadium with attendance more then 50000
select game_id_x,stadium,attendance from football_data_merged_cleaned_data where attendance>50000
-- 1079 rows returned.

-- 3.find the number of players in each home_club.
select home_club_name, COUNT(DISTINCT player_id) as player_count from football_data_merged_cleaned_data
where home_club_goals is not null group by home_club_name
order by player_count
desc;
-- Interpretation: here 106 rows returned. Borussia Dortmund home_club have higher player_count that is 11. 

-- 4. find the players who haven't scored any goals
select player_name_y from football_data_merged_cleaned_data group by player_name_y having SUM(goals)=0;
/*Interpretation:4 players haven't scored any goals. */

-- 5.find the number of players in each away_club.
select away_club_name, COUNT(DISTINCT player_id) as player_count from`football_data_merged_cleaned_data`
where away_club_goals is not null group by away_club_name
order by player_count desc;
-- Interpretation: here 103 rows returned. Borussia Dortmund home_club have higher player_count that is 8. 

-- 6.Highest market value in each  season
select season,max(market_value_in_eur) highest_market_value_in_eur from`football_data_merged_cleaned_data`
group by season order by highest_market_value_in_eur desc;
-- Interpretation: 9 rows are returned. 

-- 7.total number of yellow cards given by referee
select referee,sum(yellow_cards) as totalyellowcards from`football_data_merged_cleaned_data`
group by referee having  totalyellowcards > 0 order by totalyellowcards desc;
-- Interpretation: 36 rows are returned. 

-- 8.find the average market_value_in_eur for players in each country_of_birth.
select country_of_birth,avg(market_value_in_eur) from football_data_merged_cleaned_data
group by country_of_birth  order by avg(market_value_in_eur) desc;
-- Interpretation: 5 countries returned.

-- 9.find total number of referees.
select count(distinct player_id) as total_players from football_data_merged_cleaned_data;
-- Interpretation:total number of referees are 24. 