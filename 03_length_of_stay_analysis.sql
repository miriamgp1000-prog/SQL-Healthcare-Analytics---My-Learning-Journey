-- Average length of stay by diagnosis
-- This query uses a CTE (I'm still learning this pattern)
-- AI-assisted, but I understand the logic

WITH hospital_stays AS (
  SELECT 
    person_id,
    COUNT(*) AS los_days
  FROM `bigquery-public-data.cms_synthetic_patient_data_omop.procedure_occurrence`
  WHERE procedure_concept_id IN (
    SELECT concept_id 
    FROM `bigquery-public-data.cms_synthetic_patient_data_omop.concept`
    WHERE concept_name LIKE '%Subsequent hospital care%'
  )
  GROUP BY person_id
)
SELECT 
  c.concept_name AS diagnosis,
  COUNT(DISTINCT co.person_id) AS number_of_patients,
  ROUND(AVG(hs.los_days), 1) AS avg_hospital_stay_days
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.condition_occurrence` co
JOIN hospital_stays hs
  ON co.person_id = hs.person_id
JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` c
  ON co.condition_concept_id = c.concept_id
WHERE c.concept_name IN (
  'Type 2 diabetes mellitus',
  'Atrial fibrillation',
  'Chest pain',
  'Anemia',
  'Congestive heart failure',
  'Urinary tract infectious disease'
)
GROUP BY diagnosis
ORDER BY avg_hospital_stay_days DESC;
