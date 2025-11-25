SELECT TOP (1000) [player_name]
      ,[team]
      ,[date_of_birth]
      ,[age]
      ,[marital_status]
      ,[number_of_kids]
      ,[nationality]
      ,[country_of_birth]
      ,[position]
      ,[preferred_foot]
      ,[height_cm]
      ,[weight_kg]
      ,[jersey_number]
      ,[injury_status]
      ,[agent]
      ,[matches_played]
      ,[minutes_played]
      ,[goals]
      ,[assists]
      ,[tackles]
      ,[interceptions]
      ,[saves]
      ,[clean_sheets]
      ,[yellow_cards]
      ,[red_cards]
      ,[passing_accuracy]
      ,[shot_accuracy]
      ,[previous_club]
      ,[years_at_club]
      ,[contract_end_year]
      ,[average_salary_zar]
      ,[market_value_zar]
      ,[signing_bonus_zar]
      ,[release_clause_zar]
  FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
  where marital_status = 'Married'

  -----------------How does SELECT* work
  SELECT* FROM[SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]

  ---1. View the first 100 rows of the dataset to understand its structure.
  SELECT top 100 * FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]

---2. Count the total number of players in the dataset.
SELECT count (*) as Total_Players FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]

---3. List all unique teams in the league.
SELECT DISTINCT team FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]

---4. Count how many players are in each team.
SELECT team, COUNT(*) AS PlayerCount
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team

---5. Identify the top 10 players with the most goals.
SELECT TOP 10 player_name, team, goals
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals DESC;

---6. Find the average salary for players in each team.
SELECT team, AVG(average_salary_zar) AS AverageSalary
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team

---7. Retrieve the top 10 players with the highest market value.
SELECT TOP 10 player_name, team, market_value_zar
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC

---8. Calculate the average passing accuracy for each position. 
SELECT position, AVG(passing_accuracy) AS AvgPassingAccuracy
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position

---9. Compare shot accuracy with goals to find correlations.
SELECT player_name, goals, shot_accuracy
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]

---10. Compute total goals and assists for each team.
SELECT team,
       SUM(goals) AS TotalGoals,
       SUM(Assists) AS TotalAssists
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team

---11. Count players by their marital status.
SELECT marital_status, COUNT(*) AS PlayerCount
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY marital_status

---12. Count players by nationality.
SELECT nationality, COUNT(*) AS PlayerCount
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality

---13. Find average market value grouped by nationality.
SELECT nationality, AVG(market_value_zar) AS AvgMarketValue
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality

---14. Determine how many player contracts end in each year.
SELECT contract_end_year,
       COUNT(*) AS PlayersWithContractsEnding
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year

---15. Identify players whose contracts end next year.
SELECT player_name, team, contract_end_year
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = YEAR(GETDATE()) + 1

---16. Summarize the number of players by injury status.
SELECT injury_status, COUNT(*) AS PlayerCount
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status

---17. Calculate goals per match ratio for each player. 
SELECT player_name,
       team,
       goals,
       matches_played,
       CAST(goals AS FLOAT) / NULLIF(matches_played, 0) AS GoalsPerMatch
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]

---18. Count how many players are managed by each agent.
SELECT agent, COUNT(*) AS PlayerCount
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent
ORDER BY PlayerCount DESC

---19. Calculate average height and weight by player position.
SELECT position,
       AVG(height_cm) AS AvgHeight,
       AVG(weight_kg) AS AvgWeight
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position

---20. Identify players with the highest combined goals and assists.
SELECT TOP 10 player_name,
       team,
       (goals + assists) AS TotalContributions
FROM [SoccerAnalysis_Db1].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY TotalContributions DESC;
