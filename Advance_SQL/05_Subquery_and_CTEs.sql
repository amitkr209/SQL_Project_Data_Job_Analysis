SELECT
    *
FROM (
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

WITH january_jobs AS (
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs;

SELECT
    company_id,
    name AS company_name 
FROM 
    company_dim
WHERE
    company_id IN (SELECT
    company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = True);

WITH company_job_count AS (
SELECT
    company_id,
    COUNT(job_id) AS count_of_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
ORDER BY
    company_id)

SELECT
    company_dim.company_id,
    company_dim.name AS company_name,
    company_job_count.count_of_jobs
FROM
    company_job_count
    LEFT JOIN 
    company_dim ON company_job_count.company_id = company_dim.company_id
ORDER BY
    count_of_jobs DESC;

-- EXERCISE
SELECT
    skills_dim.skills,
    sub.skill_count
FROM
    skills_dim
    JOIN
    (SELECT
    skill_id,
    COUNT(skill_id) AS skill_count
FROM
    skills_job_dim
GROUP BY
    skill_id) AS sub ON sub.skill_id = skills_dim.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;

SELECT
    a.company_size,
    COUNT(*) AS counts
FROM
(SELECT
    company_id,
    COUNT(*) AS jobs_count,
    CASE
        WHEN COUNT(*) > 50 THEN 'Large'
        WHEN COUNT(*) BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Small'
    END AS company_size
FROM
    job_postings_fact
GROUP BY
    company_id) AS a
GROUP BY
    a.company_size
ORDER BY
    counts DESC;