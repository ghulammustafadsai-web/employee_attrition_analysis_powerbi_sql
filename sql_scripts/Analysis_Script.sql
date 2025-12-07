-- ============================================================
-- ANALYSIS SCRIPT
-- HR Attrition KPIs and Exploratory Analysis
-- ============================================================

-- Overall Attrition Ratin Rate

SELECT
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM HR_Attrition;

-- Attrition by JobRole

SELECT 
   JobRole,
   COUNT(*)  AS Total_Employees,
   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
   Round((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS Attrition_Rate
FROM HR_Attrition
GROUP BY JobRole
ORDER BY Attrition_Rate DESC

--Attrition vs OverTime

SELECT 
OverTime,
   COUNT(*) Total_Employee,
   SUM(case when Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
   SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*) Attrition_rate
from HR_Attrition
GROUP BY OverTime
ORDER BY Attrition_rate DESC

-- Salary comparison (left vs stayed)
SELECT
   Attrition,
   AVG(MonthlyIncome)  AS Salary
FROM HR_Attrition
GROUP BY Attrition

-- Attrition by AgeGroup 
SELECT
   IncomeBracket,
   AgeGroup,
   SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) AS Attrition_Rate
FROM HR_Attrition
GROUP BY IncomeBracket,AgeGroup
order by Attrition_Rate desc


-- Attrition rate by travel

SELECT 
   BusinessTravel,
   SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) AS Attrition_Rate
FROM HR_Attrition
GROUP BY BusinessTravel
ORDER BY  Attrition_Rate DESC

-- Attrition Rate by environment Satisfaction
SELECT 
   EnvironmentSatisfaction,
   SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) AS Attrition_Rate
FROM HR_Attrition
GROUP BY EnvironmentSatisfaction
ORDER BY  Attrition_Rate DESC

--Top predictors by simple ranking
-- A quick scoring: higher weight for OverTime, low JobSatisfaction, low EnvironmentSatisfaction, short Tenure
SELECT top 50 EmployeeNumber, Attrition, OverTime, JobSatisfaction, EnvironmentSatisfaction, YearsAtCompany,
(CASE WHEN OverTime='Yes' THEN 3 ELSE 0 END) +
(4 - JobSatisfaction) + (4 - EnvironmentSatisfaction) +
CASE WHEN YearsAtCompany < 2 THEN 2 ELSE 0 END AS RiskScore
FROM hr_attrition
ORDER BY RiskScore DESC


