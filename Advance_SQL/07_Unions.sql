-- Union Syntax

-- Get the jobs and companies from january
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

-- Get the jobs and companies from feburaray
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

-- Get the jobs and companies from march
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;

-- Union ALL Syntax
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;

-- EXERCISE
SELECT
    s.skills,
    s.type 
FROM
    skills_dim s
    RIGHT JOIN
    skills_job_dim sj ON s.skill_id = sj.skill_id
    RIGHT JOIN
    job_postings_fact jp ON jp.job_id = sj.job_id
WHERE
    EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3)

UNION

SELECT
    s.skills,
    s.type 
FROM
    skills_dim s
    RIGHT JOIN
    skills_job_dim sj ON s.skill_id = sj.skill_id
    RIGHT JOIN
    job_postings_fact jp ON jp.job_id = sj.job_id
WHERE
    EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3)
        AND jp.salary_year_avg > 70000
