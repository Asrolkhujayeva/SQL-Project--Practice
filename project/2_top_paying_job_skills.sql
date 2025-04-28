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

 /*Results
[
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "skills": "python"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "skills": "mysql"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "skills": "aws"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "sql"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "python"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "r"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "sas"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "matlab"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "pandas"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "skills": "tableau"
  }
]
 */