SELECT
    job_title_short AS job,
    job_location AS location,
    job_posted_date::DATE AS date 
FROM 
    job_postings_fact;

-- AT TIME ZONE

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS date 
FROM
    job_postings_fact
LIMIT 5;

-- EXTRACT FUNCTION

SELECT  
    job_title_short AS title,
    job_location AS location,
    EXTRACT(DAY FROM job_posted_date) AS date
FROM
    job_postings_fact
limit 10;

SELECT  
    job_title_short AS title,
    job_location AS location,
    EXTRACT(MONTH FROM job_posted_date) AS Month
FROM
    job_postings_fact
limit 10;

SELECT  
    job_title_short AS title,
    job_location AS location,
    EXTRACT(YEAR FROM job_posted_date) AS Year
FROM
    job_postings_fact
limit 10;

-- How job_posted trend month to month

SELECT
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS count_of_jobs
 FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY 
    count_of_jobs DESC;

-- EXERCISE

SELECT
    job_schedule_type,
    ROUND(AVG(salary_year_avg), 2) AS yearly_avg,
    ROUND(AVG(salary_hour_avg), 2) AS hourly_avg
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
GROUP BY
    job_schedule_type
ORDER BY
    yearly_avg ASC;

SELECT 
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT') AS Month,
    COUNT(job_id) AS num_of_jobs
FROM
    job_postings_fact
GROUP BY
    Month
ORDER BY
    Month;

SELECT
    c.company_id,
    c.name
FROM
    company_dim c 
    JOIN
    job_postings_fact jp ON c.company_id = jp.company_id
WHERE
    EXTRACT(MONTH FROM job_posted_date) > 6;