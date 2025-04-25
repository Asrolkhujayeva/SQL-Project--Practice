/*
 Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analyst jobs from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
     helping job seekers understand which skills to develop that align with top salaries
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
        c.name as company_name,
        p.job_id,
        p.job_title,
        p.job_location,
        p.job_schedule_type,
        p.salary_year_avg,
        p.job_posted_date,
        s.skills
 FROM job_postings_fact p
 INNER JOIN company_dim c ON p.company_id = c.company_id
 INNER JOIN job_skills s ON p.job_id = s.job_id
 WHERE 
        p.job_title = 'Data Analyst' AND
        p.job_work_from_home = true AND
        p.salary_year_avg IS NOT NULL
 ORDER BY p.salary_year_avg DESC
 LIMIT 10;