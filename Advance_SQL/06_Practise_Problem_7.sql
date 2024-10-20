/*
Find the count of the number of remotes job_postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - include skill_id, name, and count of job postings requireing the skills
*/

WITH remote_job_skills AS (
SELECT
    skill_id,
    COUNT(*) AS skill_count
FROM
    skills_job_dim AS skills_to_job
    INNER JOIN
    job_postings_fact AS job_postings ON skills_to_job.job_id = job_postings.job_id
WHERE
    job_postings.job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT
    skill.skill_id,
    skill.skills,
    remote_job_skills.skill_count
FROM
    remote_job_skills
    INNER JOIN
    skills_dim AS skill ON skill.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 10;

/*
Find the count of the number of non remotes job_postings per skill
    - Display the top 10 skills by their demand in non remote jobs of Data Scientist
    - include skill_id, name, and count of job postings requireing the skills
*/

WITH non_remote_jobs AS (
SELECT
    skill_id,
    COUNT(skill_id) AS skill_count
FROM
    skills_job_dim AS skill_to_job
    INNER JOIN
    job_postings_fact AS job_postings ON job_postings.job_id = skill_to_job.job_id
WHERE
    job_postings.job_work_from_home = FALSE
        AND job_postings.job_title_short = 'Data Scientist'
GROUP BY
    skill_id
)

SELECT
    skill.skill_id,
    skill.skills,
    non_remote_jobs.skill_count
FROM
    non_remote_jobs
    INNER JOIN
    skills_dim AS skill ON skill.skill_id = non_remote_jobs.skill_id
ORDER BY
    non_remote_jobs.skill_count DESC
LIMIT 10;