-- ============================================================
-- DATA PREPROCESSING SCRIPT
-- Cleaning, inspecting, and preparing HR Attrition dataset
-- ============================================================

SELECT * FROM HR_Attrition


-================================================================
--Droping 5 unimportant columns 

--Reasons of Droping These 

--1.over18 :-  over18 has all values as Y which is not helpfull for analysis
--2. Monthlyrate :-  Monthlyrate is not showing any usefill information for analysis
--3.PerformanceRating :- PerformanceRating only contains tow values 3 and 4 which are not insightfull
--4.StandardHours :-Standard Hourse has constant value of 80 which is not usefull for analysis
--5. Employcount :- Employcount has constant value of 1 across whole the data set
--==================================================================

ALTER TABLE HR_Attrition
DROP COLUMN over18,Monthlyrate,PerformanceRating,StandardHours,Employcount;

/*Total Number of rows in data set
select
   count(*) 
from HR_Attrition

declare @SQL NVARCHAR(Max)='';
select @SQL=STRING_AGG(
  'SELECT ''' + COLUMN_NAME + ''' AS ColumnName,
   count(*) as nullcount
   from ' + QUOTENAME(TABLE_SCHEMA) + 'HR_Attrition
   where ' + QUOTENAME(COLUMN_NAME) + 'IS NULL',
  ' UNION ALL'
)
within group (order by COLUMN_NAME)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='HR_Attrition';
-- Excute the dynamic SQL
EXEC sp_executesql @SQLss
*/


--Creating Index on Employnumber to make the quarries faster 

create index EmployeID 
on HR_Attrition (Employeenumber)

--checking Duplicate Records

SELECT 
   Employeenumber,
   count(*)
FROM HR_Attrition
GROUP BY Employeenumber
having count(*) >1

--Feature Enginerring 

--Add derived columns: AgeGroup, TenureGroup, IncomeBracket

ALTER TABLE HR_Attrition
 ADD  AgeGroup NVARCHAR(20)

 -- Adding AgeGroup column and Filling values in AgeGroup

UPDATE HR_Attrition
SET AgeGroup = CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+' END;

ALTER TABLE HR_Attrition
 ADD  TenureGroup NVARCHAR(20)

 --filing values in TenureGroup
UPDATE HR_Attrition
SET TenureGroup = CASE
WHEN YearsAtCompany = 0 THEN '0'
WHEN YearsAtCompany BETWEEN 1 AND 3 THEN '1-3'
WHEN YearsAtCompany BETWEEN 4 AND 7 THEN '4-7'
ELSE '8+' END;


ALTER TABLE HR_Attrition
 ADD  IncomeBracket NVARCHAR(20);

 -- filing values in IncomeBracket
UPDATE HR_Attrition
SET IncomeBracket = CASE
 WHEN MonthlyIncome < 3000 THEN 'Low'
 WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium'
 ELSE 'High' END;


-- 3. Flag high risk: OverTime + Low JobSatisfaction + Low WorkLifeBalance
ALTER TABLE HR_Attrition 
 ADD  HighRiskAttrition INT ;

UPDATE HR_Attrition
SET HighRiskAttrition = case 
                         WHEN OverTime = 'Yes' AND JobSatisfaction IN (1,2) AND WorkLifeBalance IN (1,2) THEN 1
                         ELSE 0


--Final Result

SELECT * FROM HR_Attrition

