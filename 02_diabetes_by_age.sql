-- Diabetes cases by age group
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
