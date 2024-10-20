CREATE TABLE job_applied (
    job_is INT,
    application_sent_date DATE,
    custom_resume BOOLEAN, 
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT 
    *
FROM
    job_applied;

-- INSERT VALUES INTO the `job_applied` table.
INSERT INTO job_applied (
            job_is,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES
            (1,
            '2024-02-01',
            true,
            'resume_01.pdf',
            true,
            'cover_letter_01.pdf',
            'submitted'),
            (2,
            '2024-02-02',
            true,
            'resume_02.pdf',
            true,
            'cover_letter_02.pdf',
            'submitted'),
            (,
            '2024-02-03',
            true,
            'resume_03.pdf',
            true,
            'cover_letter_03.pdf',
            'submitted');

-- Alter the table
ALTER TABLE job_applied
ADD contact VARCHAR(50);

ALTER TABLE job_applied
RENAME COLUMN job_is TO job_id;

SELECT *
FROM job_applied;

-- UPDATE TABLE
UPDATE job_applied
SET
    contact = 'Elrich Buckmen'
WHERE
    job_id = 1;

UPDATE job_applied
SET 
    contact = 'Dinesh Chugtai'
WHERE
    job_id = 2;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

-- DROP TABLE
DROP TABLE job_applied;