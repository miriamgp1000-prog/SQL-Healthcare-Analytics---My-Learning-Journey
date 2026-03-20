# 🏥 SQL Healthcare Analytics - My Learning Journey

## 📌 About This Repository
I'm a nurse transitioning to data analytics. This repo documents my **SQL learning process** using public healthcare data.

**Dataset:** [CMS Synthetic Patient Data](https://console.cloud.google.com/marketplace/product/bigquery-public-data/cms-synthetic-patient-data) — 2.3 million synthetic patients in OMOP format, available via Google BigQuery.

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

### 🔹 Top 10 Diagnoses
```sql
SELECT 
  c.concept_name AS condition_name,
  COUNT(*) AS occurrence_count
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.condition_occurrence` co
JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` c
  ON co.condition_concept_id = c.concept_id
GROUP BY condition_name
ORDER BY occurrence_count DESC
LIMIT 10;
