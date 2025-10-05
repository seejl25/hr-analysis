# HR Analytics Dashboard

This project focuses on analyzing employee attrition patterns within a company using **Tableau**, **PostgreSQL**, and **Excel**.  
The goal is to uncover key insights into attrition rates by gender, department, education field, and age group, and to explore job satisfaction trends across different roles.

---

## 📊 Project Overview

Employee attrition is a critical metric for any organization, as it impacts productivity, hiring costs, and team morale.  
This dashboard helps HR professionals identify the main factors contributing to employee attrition and areas that may require organizational focus.

The analysis and visualizations were built using **Tableau**, with SQL validation performed on the data stored in **PostgreSQL**.

---

## 🧰 Tools and Technologies

- **Tableau** – Data visualization and dashboard creation  
- **PostgreSQL** – SQL queries for validation and analysis  
- **Microsoft Excel** – Data cleaning and preprocessing  

---

## 📁 Dataset

- **File name:** `HR Data.xlsx`  
- **Fields include:** Employee demographics, education, job role, department, job satisfaction rating, and attrition flag  

---

## 🧮 SQL Verification

Before visualization, all major metrics — such as total employee count, attrition count, and attrition rate — were validated using **SQL queries** in PostgreSQL to ensure the Tableau outputs were accurate.

Example checks:
```sql
-- Overall attrition rate
SELECT ((SELECT COUNT(attrition) 
		FROM hrdata
		WHERE attrition = 'Yes') / sum(employee_count)) * 100
FROM hrdata;

-- Attrition by department
SELECT department, COUNT(attrition) AS attrition_rate, 
	ROUND((CAST(COUNT(attrition) as numeric)/ (SELECT COUNT(attrition) 
								                              FROM hrdata
								                              WHERE attrition = 'Yes'))*100, 2) AS attrition_percentage
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY department;
```

## 📈 Tableau Dashboard
<img width="1447" height="813" alt="Screenshot 2025-10-05 at 11 02 42 PM" src="https://github.com/user-attachments/assets/6af4f2d5-5a7d-4e59-a48c-5ed1b6ee9a28" />

The dashboard includes multiple visual components:

- KPI Cards: Total Employees, Attrition Count, Attrition Rate, Active Employees, and Average Age

- Department-wise Attrition: Pie chart showing which departments have the highest turnover

- Attrition by Gender: Horizontal bar comparison between male and female attrition counts

- Attrition by Education Field: Ranking of attrition across academic backgrounds

- Attrition Rate by Age Group and Gender: Donut charts displaying attrition segmentation

- Job Satisfaction Heatmap: Visualization of satisfaction levels by job role (scale 1–4)

## 🔍 Key Insights

- Overall attrition rate: ~16.1%

- Sales Department recorded the highest attrition (~56%), followed by R&D.

- Male employees had higher attrition counts compared to females.

- Life Sciences field contributed the most to employee attrition among education backgrounds.

- Employees aged 25–34 formed the largest group and showed the highest attrition numbers.

- Job satisfaction tends to be lowest among Sales Executives and Laboratory Technicians.

## 📚 Learnings

- How to clean and structure HR datasets in Excel for SQL import

- Validating Tableau visualizations using PostgreSQL queries

- Designing interactive dashboards to communicate HR trends effectively

- Understanding attrition drivers and workforce composition

##🧠 Future Enhancements

- Add predictive analysis using Python (e.g., logistic regression on attrition likelihood)

- Automate SQL-to-Tableau data pipeline
