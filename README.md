# HR Attrition Analysis – SQL & Power BI

## Objective of the Analysis
Employee attrition directly impacts organizational cost, productivity, and workforce stability.  

The primary objectives of this project are:
- To identify the **key causes of employee attrition**
- To analyze **which employee segments are most at risk**
- To provide **data-driven recommendations** that support HR retention strategies

This project is designed as a **portfolio demonstration of a real-world HR analytics use case**, following a structured analytical workflow.

---

## Dataset Overview
The dataset represents employee-level HR information, including:
- Demographics (age, gender, marital status)
- Job-related attributes (department, job role, tenure)
- Compensation details (monthly income)
- Workplace factors (overtime, job satisfaction, work-life balance, business travel)
- Attrition indicator (Yes / No)

Each record corresponds to a single employee.

---

## Tools Used
- **SQL:** Data loading, preprocessing, feature engineering, and analytical queries  
- **Power BI:** Interactive dashboard creation and visual analysis  
- **Git & GitHub:** Version control and portfolio presentation  

---

## Step 1: Data Loading (SQL)
- Raw HR dataset loaded into a relational database
- Column data types validated
- Initial row counts verified to ensure complete ingestion

**Tool used:** SQL

---

## Step 2: Data Preprocessing & Feature Engineering (SQL)
Key preprocessing steps performed using SQL:
- Removed non-informative and constant columns
- Checked and validated duplicate records
- Created analytical features:
  - Age Groups
  - Income Brackets
  - Tenure Groups
- Added indexing to improve query performance

This step ensures the dataset is analytics-ready and optimized for downstream analysis.

**Tool used:** SQL

---

## Step 3: Exploratory & Analytical Queries (SQL)
Core business-focused analysis conducted using SQL:
- Overall employee attrition rate calculation
- Attrition breakdown by:
  - Department
  - Job role
  - Age group
  - Income bracket
  - Business travel frequency
- Identification of high-risk employee segments
- Development of a simple risk scoring logic based on overtime, satisfaction, and tenure

**Tool used:** SQL

---

## Step 4: Power BI Dashboard (Visualization)
An interactive dashboard was built to visualize insights and support decision-making.

The dashboard includes:
- Key KPIs (Attrition Rate, Total Employees, Total Attritions)
- Attrition analysis by role, department, age group, and income
- Trend analysis by tenure
- Slicers for demographic and job-based filtering

**Tool used:** Power BI

---

## Power BI Dashboard Preview

<img width="617" height="347" alt="Mod_dashboard" src="https://github.com/user-attachments/assets/8a32ff88-e548-43f8-913f-f3526f43cc7d" />



---

## Key Findings
- Overall attrition rate ranges between **11–16%**
- Higher attrition observed in **Sales** and **R&D** departments
- Overtime is strongly associated with increased attrition
- Younger and lower-income employees show higher turnover risk
- Job satisfaction and work-life balance are critical retention factors

---

## Recommendations
Based on the analysis, recommended actions include:
- Monitoring and controlling excessive overtime
- Targeted retention strategies for high-attrition roles
- Focused engagement initiatives for early-tenure employees
- Compensation and growth-path reviews for low-income segments
- Regular tracking of job satisfaction and work-life balance metrics

These recommendations are **indicative and portfolio-based**, intended to reflect analytical reasoning rather than operational guarantees.







