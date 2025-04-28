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



/*Results:
[
  {
    "company_name": "Mantys",
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37"
  },
  {
    "company_name": "Get It Recruit - Healthcare",
    "job_id": 456042,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "151500.0",
    "job_posted_date": "2023-09-25 10:59:56"
  },
  {
    "company_name": "Level",
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55"
  },
  {
    "company_name": "CyberCoders",
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20"
  },
  {
    "company_name": "Uber",
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43"
  },
  {
    "company_name": "Overmind",
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "138500.0",
    "job_posted_date": "2023-11-23 12:38:59"
  },
  {
    "company_name": "EPIC Brokers",
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-06-26 17:00:18"
  },
  {
    "company_name": "InvestM Technology LLC",
    "job_id": 479965,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-02-26 01:04:44"
  }
]
*/