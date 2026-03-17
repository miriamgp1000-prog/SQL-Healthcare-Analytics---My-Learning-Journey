-- Top 10 most frequent diagnoses in the CMS dataset
SELECT 
  c.concept_name AS condition_name,
  COUNT(*) AS occurrence_count
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.condition_occurrence` co
JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` c
  ON co.condition_concept_id = c.concept_id
GROUP BY condition_name
ORDER BY occurrence_count DESC
LIMIT 10;
