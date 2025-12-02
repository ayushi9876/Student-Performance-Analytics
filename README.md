# 🎓 Student Performance Analytics Dashboard

**Author:** Ayushi Singh  
**Tools Used:** SQL | Power BI | Power Query | Excel  

---

## 🧭 Project Overview

This project analyzes student performance data to understand how academic and behavioral factors — such as attendance, study hours, extracurricular activities, and part-time jobs — influence academic outcomes.  
The goal is to help educators identify success patterns, promote consistent study habits, and support data-driven decisions for student improvement.

---

## 🧩 Problem Statement

Educational institutions often struggle to determine which behavioral patterns most impact academic performance.  
This analysis answers key questions:
- How do **attendance** and **study hours** affect overall scores?  
- Does **gender** or **part-time work** influence performance?  
- Which factors are the strongest predictors of academic success?

---

## ⚙️ Data Pipeline

1. **Data Cleaning & Preprocessing (SQL)**  
   - Removed duplicates and handled missing values.  
   - Transformed Boolean fields into numeric form (1/0).  
   - Calculated derived metrics such as average score and performance category.  
   - Conducted EDA queries to identify correlations between attendance, study hours, and grades.  

   📄 SQL script: [`data_cleaning.sql`](SQL/data_cleaning.sql)

2. **Visualization & Analysis (Power BI)**  
   - Imported preprocessed data using **Power Query**.  
   - Designed KPI cards, trend lines, and category comparisons.  
   - Built interactive visuals for quick insights.  

3. **Reporting**  
   - A detailed report summarizing dataset, insights, and recommendations is available in the `Report` folder.

---

## 📊 Dashboard Preview

![Student Performance Dashboard](Dashboard/Dashboard_screenshot.png)

---

## 🔍 Key Insights

- Students with **20–30 hours of weekly study** and **<4 absences** achieved **~10% higher scores**.  
- Attendance and consistent study hours were stronger predictors of success than part-time jobs.  
- Gender differences were minimal, with average scores nearly equal.  
- Over **61% of students** were categorized as high performers.

---

## 📈 KPIs Highlighted

| Metric | Description | Value |
|--------|--------------|-------|
| **Average Score** | Avg score across all subjects | 80.98 |
| **Average Absences** | Avg days absent per student | 3.67 |
| **Avg Study Hours** | Weekly average of self-study hours | 17.76 |

---

## 🗂️ Repository Structure

