/*
 Question: What are the most in-demand skills for data analysts?
 - Join job postings to inner join table similar to query 2
 - Identify the top 5 in-demand skills for a data analyst.
 - Focus on all job postings.
 - Why? Retrieves the top 5 skills with the highest demand in the job market, 
     providing insights into the most valuable skills for job seekers.
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
        jobs.job_title,
        job_skills.skills,
        COUNT(job_skills.skill_id) as count_skills
FROM job_skills
INNER JOIN job_postings_fact jobs
ON job_skills.job_id = jobs.job_id
WHERE jobs.job_title = 'Data Analyst'
GROUP BY jobs.job_title, job_skills.skills
ORDER BY count_skills DESC
LIMIT 5;


/*Results:
[
  {
    "job_title": "Data Analyst",
    "skills": "sql",
    "count_skills": "24099"
  },
  {
    "job_title": "Data Analyst",
    "skills": "excel",
    "count_skills": "15154"
  },
  {
    "job_title": "Data Analyst",
    "skills": "python",
    "count_skills": "14246"
  },
  {
    "job_title": "Data Analyst",
    "skills": "tableau",
    "count_skills": "12112"
  },
  {
    "job_title": "Data Analyst",
    "skills": "power bi",
    "count_skills": "10156"
  }
]
*/