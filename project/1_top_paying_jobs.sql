/*
 Question: What are the top-paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely
 - Focuses on job postings with specified salaries (remove nulls)
 - BONUS: Include company names of top 10 roles
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
 */

 SELECT 
        c.name as company_name,
        p.job_id,
        p.job_title,
        p.job_location,
        p.job_schedule_type,
        p.salary_year_avg,
        p.job_posted_date
 FROM job_postings_fact p
 INNER JOIN company_dim c
 ON p.company_id = c.company_id
 WHERE 
        p.job_title = 'Data Analyst' AND
        p.job_work_from_home = true AND
        p.salary_year_avg IS NOT NULL
 ORDER BY p.salary_year_avg DESC
 LIMIT 10;