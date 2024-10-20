/*
Find the job postings from the first quater that have salary greater than $70K.
 - Combine the job postings tables from the first quater of 2023.
 - Get the job_postings with the average yearly salary > $70,000.
*/

SELECT  
    quater_1_jobs.job_title_short,
    quater_1_jobs.job_location,
    quater_1_jobs.job_via,
    quater_1_jobs.job_posted_date::date,
    quater_1_jobs.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs) AS quater_1_jobs
WHERE
    quater_1_jobs.salary_year_avg > 70000
        AND quater_1_jobs.job_title_short = 'Data Analyst'
ORDER BY
    quater_1_jobs.salary_year_avg DESC;

-- Alternate Code
SELECT  
    job_title_short,
    job_location,
    job_via,
    job_posted_date::date,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs) AS quater_1_jobs
WHERE
    salary_year_avg > 70000
        AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;