
-- ============================================================
-- DATA LOADING SCRIPT
-- Creates database, table, and loads CSV data
-- Project: Employee Attrition Analysis
-- ============================================================

CREATE DATABASE HR_Attrition

--Loading Data set csv File into data base by creating Table

CREATE  TABLE HR_Attrition
(
   
   Age INT ,
   Attrition VARCHAR(10),
   BusinessTravel	VARCHAR(60),
   DailyRate  INT,	
   Department VARCHAR(70),
   DistanceFromHome INT,
   Education INT,
   EducationField	VARCHAR(50),
   EmployeeCount INT,
   EmployeeNumber	INT,
   EnvironmentSatisfaction  INT,
   Gender VARCHAR(11),
   HourlyRate INT,
   JobInvolvement INT,
   JobLevel INT,
   JobRole VARCHAR(68),
   JobSatisfaction	INT,
   MaritalStatus VARCHAR(39),
   MonthlyIncome  INT,
   MonthlyRate INT,
   NumCompaniesWorked  INT,
   Over18	VARCHAR(6),
   OverTime	VARCHAR(11),
   PercentSalaryHike INT,
   PerformanceRating INT,
   RelationshipSatisfaction INT,
   StandardHours INT,
   StockOptionLevel	INT,
   TotalWorkingYears INT, 
   TrainingTimesLastYear INT,
   WorkLifeBalance	 INT,
   YearsAtCompany	INT,
   YearsInCurrentRole	INT,
   YearsSinceLastPromotion	 INT,
   YearsWithCurrManager INT
)

-- Inserting Data Into Created Table

BULK INSERT  HR_Attrition
FROM 'D:\HR_Attrition\HR-Employee-Attrition.csv'
WITH(FIRSTROW =2,FIELDTERMINATOR=',',ROWTERMINATOR='\n')

