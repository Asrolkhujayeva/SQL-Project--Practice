# 📊 Top-Paying Data Analyst Jobs – SQL Portfolio Project

This SQL project explores real-world job market trends for **Data Analysts**, including salary insights, in-demand tools, and skill recommendations. The analysis is based on a job postings dataset and is designed to help job seekers identify high-paying and high-demand opportunities in remote data roles.

---

## 🧠 Project Goals

- Identify **top-paying** remote Data Analyst roles
- Discover which **skills** are most frequently required
- Understand the **value of different skills** based on salary
- Recommend **optimal skills** based on demand and compensation

---

## 🗂 Queries & Insights

### 1. 💰 What are the top-paying remote Data Analyst jobs?
- Filters out roles without salary data
- Lists top 10 highest-paying jobs
- Includes job title, salary, location, and company

📎 Tables used: `job_postings_fact`, `company_dim`

---

### 2. 🛠 What skills are required for those top-paying jobs?
- Retrieves specific skills for the top 10 roles above
- Useful for job seekers aiming to align with well-paid positions

📎 Tables used: `job_postings_fact`, `company_dim`, `skills_job_dim`, `skills_dim`

---

### 3. 🔥 What are the most in-demand skills for Data Analysts?
- Counts how often each skill appears in job postings
- Reveals the top 5 most requested tools/technologies

📌 Top 5 Skills:
| Skill     | Count     |
|-----------|-----------|
| SQL       | 24,099    |
| Excel     | 15,154    |
| Python    | 14,246    |
| Tableau   | 12,112    |
| Power BI  | 10,156    |

---

### 4. 💵 What skills are associated with the highest salaries?
- Calculates average salary per skill
- Useful to prioritize learning high-value technologies

📌 Sample Top Skills by Salary:
| Skill        | Avg Salary ($) |
|--------------|----------------|
| PySpark      | 208,172        |
| Bitbucket    | 189,155        |
| Couchbase    | 160,515        |
| Pandas       | 151,821        |
| Jupyter      | 152,777        |

---

### 5. 📈 What are the most **optimal** skills to learn?
- Combines **demand** and **average salary**
- Shows top 25 tools worth learning for impact and income

📌 Sample:
| Skill     | Demand | Avg Salary |
|-----------|--------|------------|
| Python    | 236    | 101,397    |
| Tableau   | 230    | 99,288     |
| Looker    | 49     | 103,795    |
| Snowflake | 37     | 112,948    |
| AWS       | 32     | 108,317    |

---

## 🛠 Tools Used

- SQL (PostgreSQL syntax)
- db: `job_postings_fact`, `skills_job_dim`, `skills_dim`, `company_dim`
- Environment: Jupyter Notebook + SQL Magic or a SQL IDE

---

## 📁 Folder Structure Suggestion

