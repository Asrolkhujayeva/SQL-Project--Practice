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
ORDER BY
    demand_count DESC,
    avrg_salary DESC;



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
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avrg_salary": "106906"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "demand_count": "17",
    "avrg_salary": "94145"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avrg_salary": "99936"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avrg_salary": "99171"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avrg_salary": "109654"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avrg_salary": "101414"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avrg_salary": "99631"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avrg_salary": "99077"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_count": "13",
    "avrg_salary": "90077"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avrg_salary": "106683"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avrg_salary": "114210"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avrg_salary": "98958"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "10",
    "avrg_salary": "141907"
  },
  {
    "skill_id": 184,
    "skills": "dax",
    "demand_count": "10",
    "avrg_salary": "104500"
  },
  {
    "skill_id": 204,
    "skills": "visio",
    "demand_count": "10",
    "avrg_salary": "95842"
  },
  {
    "skill_id": 14,
    "skills": "c#",
    "demand_count": "10",
    "avrg_salary": "86540"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "9",
    "avrg_salary": "151821"
  },
  {
    "skill_id": 26,
    "skills": "c",
    "demand_count": "9",
    "avrg_salary": "98938"
  },
  {
    "skill_id": 16,
    "skills": "t-sql",
    "demand_count": "9",
    "avrg_salary": "96365"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "demand_count": "9",
    "avrg_salary": "95224"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demand_count": "8",
    "avrg_salary": "102920"
  },
  {
    "skill_id": 10,
    "skills": "html",
    "demand_count": "8",
    "avrg_salary": "86438"
  },
  {
    "skill_id": 12,
    "skills": "bash",
    "demand_count": "6",
    "avrg_salary": "96558"
  },
  {
    "skill_id": 202,
    "skills": "ms access",
    "demand_count": "6",
    "avrg_salary": "85519"
  },
  {
    "skill_id": 190,
    "skills": "spreadsheet",
    "demand_count": "6",
    "avrg_salary": "81892"
  },
  {
    "skill_id": 170,
    "skills": "windows",
    "demand_count": "6",
    "avrg_salary": "74124"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "5",
    "avrg_salary": "143513"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demand_count": "5",
    "avrg_salary": "131162"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "5",
    "avrg_salary": "126103"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "5",
    "avrg_salary": "124903"
  },
  {
    "skill_id": 23,
    "skills": "crystal",
    "demand_count": "5",
    "avrg_salary": "120100"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "5",
    "avrg_salary": "112000"
  },
  {
    "skill_id": 15,
    "skills": "matlab",
    "demand_count": "5",
    "avrg_salary": "94200"
  },
  {
    "skill_id": 216,
    "skills": "github",
    "demand_count": "5",
    "avrg_salary": "91580"
  },
  {
    "skill_id": 235,
    "skills": "planner",
    "demand_count": "5",
    "avrg_salary": "76800"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "demand_count": "5",
    "avrg_salary": "76301"
  },
  {
    "skill_id": 236,
    "skills": "smartsheet",
    "demand_count": "5",
    "avrg_salary": "63000"
  },
  {
    "skill_id": 57,
    "skills": "postgresql",
    "demand_count": "4",
    "avrg_salary": "123879"
  },
  {
    "skill_id": 67,
    "skills": "db2",
    "demand_count": "4",
    "avrg_salary": "114072"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "demand_count": "4",
    "avrg_salary": "97230"
  },
  {
    "skill_id": 20,
    "skills": "powershell",
    "demand_count": "4",
    "avrg_salary": "95275"
  },
  {
    "skill_id": 200,
    "skills": "cognos",
    "demand_count": "4",
    "avrg_salary": "93264"
  },
  {
    "skill_id": 249,
    "skills": "microsoft teams",
    "demand_count": "4",
    "avrg_salary": "87854"
  },
  {
    "skill_id": 226,
    "skills": "terminal",
    "demand_count": "4",
    "avrg_salary": "80625"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "demand_count": "4",
    "avrg_salary": "80000"
  },
  {
    "skill_id": 112,
    "skills": "plotly",
    "demand_count": "4",
    "avrg_salary": "78750"
  },
  {
    "skill_id": 220,
    "skills": "gitlab",
    "demand_count": "3",
    "avrg_salary": "154500"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "demand_count": "3",
    "avrg_salary": "152777"
  },
  {
    "skill_id": 211,
    "skills": "jenkins",
    "demand_count": "3",
    "avrg_salary": "125436"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "3",
    "avrg_salary": "122500"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "3",
    "avrg_salary": "108200"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "demand_count": "3",
    "avrg_salary": "107667"
  },
  {
    "skill_id": 70,
    "skills": "sqlite",
    "demand_count": "3",
    "avrg_salary": "89167"
  },
  {
    "skill_id": 120,
    "skills": "seaborn",
    "demand_count": "3",
    "avrg_salary": "77500"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "3",
    "avrg_salary": "66020"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "3",
    "avrg_salary": "66020"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "2",
    "avrg_salary": "208172"
  },
  {
    "skill_id": 218,
    "skills": "bitbucket",
    "demand_count": "2",
    "avrg_salary": "189155"
  },
  {
    "skill_id": 35,
    "skills": "swift",
    "demand_count": "2",
    "avrg_salary": "153750"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "2",
    "avrg_salary": "136508"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "2",
    "avrg_salary": "132500"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "2",
    "avrg_salary": "125781"
  },
  {
    "skill_id": 191,
    "skills": "microstrategy",
    "demand_count": "2",
    "avrg_salary": "121619"
  },
  {
    "skill_id": 177,
    "skills": "arch",
    "demand_count": "2",
    "avrg_salary": "82750"
  },
  {
    "skill_id": 104,
    "skills": "spring",
    "demand_count": "2",
    "avrg_salary": "82000"
  },
  {
    "skill_id": 255,
    "skills": "webex",
    "demand_count": "2",
    "avrg_salary": "81250"
  },
  {
    "skill_id": 29,
    "skills": "julia",
    "demand_count": "2",
    "avrg_salary": "71148"
  },
  {
    "skill_id": 21,
    "skills": "visual basic",
    "demand_count": "2",
    "avrg_salary": "62500"
  },
  {
    "skill_id": 144,
    "skills": "ruby",
    "demand_count": "2",
    "avrg_salary": "61780"
  },
  {
    "skill_id": 30,
    "skills": "ruby",
    "demand_count": "2",
    "avrg_salary": "61780"
  },
  {
    "skill_id": 85,
    "skills": "watson",
    "demand_count": "1",
    "avrg_salary": "160515"
  },
  {
    "skill_id": 65,
    "skills": "couchbase",
    "demand_count": "1",
    "avrg_salary": "160515"
  },
  {
    "skill_id": 206,
    "skills": "datarobot",
    "demand_count": "1",
    "avrg_salary": "155486"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "1",
    "avrg_salary": "145000"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demand_count": "1",
    "avrg_salary": "145000"
  },
  {
    "skill_id": 250,
    "skills": "twilio",
    "demand_count": "1",
    "avrg_salary": "127000"
  },
  {
    "skill_id": 238,
    "skills": "notion",
    "demand_count": "1",
    "avrg_salary": "125000"
  },
  {
    "skill_id": 84,
    "skills": "ibm cloud",
    "demand_count": "1",
    "avrg_salary": "111500"
  },
  {
    "skill_id": 39,
    "skills": "rust",
    "demand_count": "1",
    "avrg_salary": "97500"
  },
  {
    "skill_id": 225,
    "skills": "unity",
    "demand_count": "1",
    "avrg_salary": "95500"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demand_count": "1",
    "avrg_salary": "95000"
  },
  {
    "skill_id": 60,
    "skills": "mariadb",
    "demand_count": "1",
    "avrg_salary": "95000"
  },
  {
    "skill_id": 45,
    "skills": "pascal",
    "demand_count": "1",
    "avrg_salary": "92000"
  },
  {
    "skill_id": 42,
    "skills": "vb.net",
    "demand_count": "1",
    "avrg_salary": "90000"
  },
  {
    "skill_id": 242,
    "skills": "clickup",
    "demand_count": "1",
    "avrg_salary": "90000"
  },
  {
    "skill_id": 221,
    "skills": "chef",
    "demand_count": "1",
    "avrg_salary": "85000"
  },
  {
    "skill_id": 145,
    "skills": "node.js",
    "demand_count": "1",
    "avrg_salary": "83500"
  },
  {
    "skill_id": 248,
    "skills": "zoom",
    "demand_count": "1",
    "avrg_salary": "80740"
  },
  {
    "skill_id": 115,
    "skills": "ggplot2",
    "demand_count": "1",
    "avrg_salary": "75000"
  },
  {
    "skill_id": 51,
    "skills": "erlang",
    "demand_count": "1",
    "avrg_salary": "72500"
  },
  {
    "skill_id": 47,
    "skills": "sass",
    "demand_count": "1",
    "avrg_salary": "67500"
  },
  {
    "skill_id": 88,
    "skills": "colocation",
    "demand_count": "1",
    "avrg_salary": "67500"
  },
  {
    "skill_id": 11,
    "skills": "css",
    "demand_count": "1",
    "avrg_salary": "52500"
  },
  {
    "skill_id": 153,
    "skills": "ruby on rails",
    "demand_count": "1",
    "avrg_salary": "51059"
  },
  {
    "skill_id": 253,
    "skills": "wire",
    "demand_count": "1",
    "avrg_salary": "42500"
  }
]

*/

