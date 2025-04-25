/*
 Answer: What are the top skills based on salary?
 - Look at the average salary associated with each skill for Data Analyst positions
 - Focuses on roles with specified salaries, regardless of location
 - Why? It reveals how different skills impact salary levels for Data Analysts and 
     helps identify the most financially rewarding skills to acquire or improve
 */

WITH job_skills as (
    SELECT 
            skills_job_dim.job_id,
            skills_dim.skill_id,
            skills_dim.skills
    FROM skills_job_dim
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
)

SELECT
        s.skills,
        f.salary_year_avg
FROM job_postings_fact f
INNER JOIN job_skills s ON f.job_id = s.job_id
WHERE 
        f.job_title = 'Data Analyst'AND
        f.salary_year_avg IS NOT NULL
ORDER BY f.salary_year_avg DESC;