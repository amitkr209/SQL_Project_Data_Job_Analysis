SELECT  
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN  job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category,
    COUNT(job_id) AS number_of_jobs
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY    
    location_category;

SELECT 
    CASE
        WHEN salary_year_avg > 100000 THEN 'High_Salary_Job'
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Medium_Salary_Job'
        ELSE 'Low_Salary_Job'
    END AS Salary_Buckets,
    COUNT(job_id) AS number_of_jobs
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    Salary_Buckets
ORDER BY
    number_of_jobs DESC;