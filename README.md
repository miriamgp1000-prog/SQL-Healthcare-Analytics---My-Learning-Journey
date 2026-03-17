# 🏥 SQL Healthcare Analytics - My Learning Journey

## 📌 About This Repository
I'm a nurse transitioning to data analytics. This repo documents my **SQL learning process** using public healthcare data.

## ✅ What I Can Do Confidently:
- SELECT, WHERE, GROUP BY, ORDER BY
- Simple JOINs between 2-3 tables
- Aggregate functions (COUNT, AVG, MIN, MAX)
- Basic filtering and sorting

## 🚧 What I'm Learning Now:
- Common Table Expressions (CTEs)
- Subqueries
- Window functions

## 📊 My Progress
I started with simple queries to explore patient demographics, then gradually attempted more complex analyses with guidance.

## 🔍 Sample Query I Wrote Myself:
```sql
### 🔹 Top 10 Diagnoses
SELECT 
  c.concept_name AS condition_name,
  COUNT(*) AS occurrence_count
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.condition_occurrence` co
JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` c
  ON co.condition_concept_id = c.concept_id
GROUP BY condition_name
ORDER BY occurrence_count DESC
LIMIT 10;
```
```sql
### 🔹 Diabetes by Age Group  
SELECT 
  CASE 
    WHEN p.year_of_birth >= 1970 THEN '0-50'
    WHEN p.year_of_birth >= 1950 THEN '50-70' 
    WHEN p.year_of_birth >= 1930 THEN '70-90'
    ELSE '90+'
  END AS age_group,
  COUNT(*) AS diabetes_cases
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.condition_occurrence` co
JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.person` p
  ON co.person_id = p.person_id
WHERE co.condition_concept_id IN (
  SELECT concept_id 
  FROM `bigquery-public-data.cms_synthetic_patient_data_omop.concept`
  WHERE concept_name LIKE '%diabetes%'
)
GROUP BY age_group
ORDER BY age_group;
```

## 🤝 How I Use AI in My Learning
I use AI tools (DeepSeek) as a pair programmer — it helps me write complex syntax while I focus on the logic, interpretation, and clinical relevance. 
Every query here is something I understand and can explain.

## 📬 Contact
**Miriam** – [Email](mailto:miriam.gp1000@gmail.com) | [LinkedIn](https://linkedin.com/in/miriam-gonzalez-a8793a381)
