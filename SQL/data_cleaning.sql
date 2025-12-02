------------------------------------------------------------
-- STUDENT PERFORMANCE DATA PREPROCESSING AND ANALYSIS
-- Author: Ayushi Singh
-- Purpose: Data cleaning, transformation, and exploratory analysis
------------------------------------------------------------

-- 1️⃣ Inspect Dataset
SELECT COUNT(*) FROM student_scores;
SELECT * FROM student_scores;

-- 2️⃣ Data Cleaning and Transformation

-- Convert Boolean columns (True/False) into numeric (1/0)
UPDATE student_scores
SET part_time_job = CASE WHEN part_time_job = 'True' THEN 1 ELSE 0 END,
    extracurricular_activities = CASE WHEN extracurricular_activities = 'True' THEN 1 ELSE 0 END;

-- Check for duplicate email IDs
SELECT email, COUNT(*) AS duplicate_count
FROM student_scores
GROUP BY email
HAVING COUNT(*) > 1;

-- Check for missing (NULL) values
SELECT
  SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
  SUM(CASE WHEN weekly_self_study_hours IS NULL THEN 1 ELSE 0 END) AS missing_study_hours,
  SUM(CASE WHEN absence_days IS NULL THEN 1 ELSE 0 END) AS missing_absence,
  SUM(CASE WHEN math_score IS NULL THEN 1 ELSE 0 END) AS missing_math
FROM student_scores;

-- 3️⃣ Basic Statistics
SELECT
  ROUND(AVG(math_score),2) AS avg_math,
  ROUND(MIN(math_score),2) AS min_math,
  ROUND(MAX(math_score),2) AS max_math,
  ROUND(AVG(english_score),2) AS avg_english,
  ROUND(AVG(absence_days),2) AS avg_absence,
  ROUND(AVG(weekly_self_study_hours),2) AS avg_study_hours
FROM student_scores;

-- 4️⃣ Derived Metric: Average Score per Student
SELECT id, first_name, gender,
  ROUND((math_score + history_score + physics_score +
         chemistry_score + biology_score + english_score +
         geography_score) / 7, 2) AS avg_score
FROM student_scores;

-- 5️⃣ Category-Wise and Correlation Analysis

-- Number of students by gender
SELECT gender, COUNT(*) AS total_students
FROM student_scores
GROUP BY gender;

-- Weekly self-study hours distribution
SELECT weekly_self_study_hours, COUNT(*) AS total_students
FROM student_scores
GROUP BY weekly_self_study_hours
ORDER BY weekly_self_study_hours;

-- Absence days distribution
SELECT absence_days, COUNT(*) AS total_students
FROM student_scores
GROUP BY absence_days
ORDER BY absence_days;

-- Average score by gender
SELECT gender,
  ROUND(AVG((math_score + history_score + physics_score +
             chemistry_score + biology_score + english_score +
             geography_score) / 7), 2) AS avg_score
FROM student_scores
GROUP BY gender;

-- Weekly study hours vs average score
SELECT weekly_self_study_hours,
  ROUND(AVG((math_score + history_score + physics_score +
             chemistry_score + biology_score + english_score +
             geography_score) / 7), 2) AS avg_score
FROM student_scores
GROUP BY weekly_self_study_hours
ORDER BY weekly_self_study_hours;

-- Extracurricular participation vs average score
SELECT extracurricular_activities,
  ROUND(AVG((math_score + history_score + physics_score +
             chemistry_score + biology_score + english_score +
             geography_score) / 7), 2) AS avg_score
FROM student_scores
GROUP BY extracurricular_activities
ORDER BY extracurricular_activities;

-- Absence days vs average score
SELECT absence_days,
  ROUND(AVG((math_score + history_score + physics_score +
             chemistry_score + biology_score + english_score +
             geography_score) / 7), 2) AS avg_score
FROM student_scores
GROUP BY absence_days
ORDER BY absence_days;

-- Part-time job vs average score
SELECT part_time_job,
  ROUND(AVG((math_score + history_score + physics_score +
             chemistry_score + biology_score + english_score +
             geography_score) / 7), 2) AS avg_score
FROM student_scores
GROUP BY part_time_job
ORDER BY part_time_job;

-- 6️⃣ Outliers: Very high and very low performers
SELECT id, first_name,
  ROUND((math_score + history_score + physics_score +
         chemistry_score + biology_score + english_score +
         geography_score) / 7, 2) AS avg_score
FROM student_scores
WHERE (math_score + history_score + physics_score +
       chemistry_score + biology_score + english_score +
       geography_score) / 7 > 90
   OR (math_score + history_score + physics_score +
       chemistry_score + biology_score + english_score +
       geography_score) / 7 < 40
ORDER BY avg_score;
