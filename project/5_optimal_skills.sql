/*
 Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
 - Identify skills in high demand and associated with high average salaries for Data Analyst roles
 - Concentrates on remote positions with specified salaries
 - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
     offering strategic insights for career development in data analysis
 */

WITH skills_demand AS (
    SELECT
        skills_job_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
            job_title_short = 'Data Analyst' AND
            salary_year_avg IS NOT NULL AND
            job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id, skills
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 0) as avrg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
            job_title_short = 'Data Analyst' AND
            salary_year_avg IS NOT NULL AND
            job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id, skills
)


SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avrg_salary
FROM skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY
    demand_count DESC,
    avrg_salary DESC
LIMIT 25;



/*Results:

[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avrg_salary": "97237"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "256",
    "avrg_salary": "87288"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avrg_salary": "101397"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avrg_salary": "99288"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avrg_salary": "100499"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "110",
    "avrg_salary": "97431"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avrg_salary": "98902"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avrg_salary": "98902"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "58",
    "avrg_salary": "88701"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avrg_salary": "103795"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "48",
    "avrg_salary": "82576"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avrg_salary": "112948"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avrg_salary": "104534"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avrg_salary": "97786"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avrg_salary": "111225"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avrg_salary": "108317"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "32",
    "avrg_salary": "86088"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "28",
    "avrg_salary": "97200"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avrg_salary": "115320"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "24",
    "avrg_salary": "92170"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "24",
    "avrg_salary": "88783"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avrg_salary": "113193"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avrg_salary": "104918"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avrg_salary": "97587"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_count": "18",
    "avrg_salary": "81634"
  }
]

*/

