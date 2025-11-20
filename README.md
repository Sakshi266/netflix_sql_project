# Netflix Movies and tv show data analysis using sql

### 📊 Netflix SQL Data Analysis Project
This project focuses on analyzing the Netflix Movies & TV Shows dataset using MySQL. The goal is to explore content trends, identify patterns, and derive insights from various attributes such as genres, release year, country, cast, ratings, and more.

### 🔍 Project Overview

Using SQL queries, this project performs:

Data cleaning & transformation

Exploratory data analysis (EDA)

Content classification (movies vs shows)

Trend analysis (by year, genre, rating, country)

Text search on cast, director, description

Handling NULL values and formatting dates

The dataset used is netflix_titles, containing information like show_id, title, type, director, cast, country, date_added, rating, duration, listed_in, description, etc.

### 🛠 Tech Stack

MySQL

### 📂 Key SQL Tasks Covered

✔ Count total movies & TV shows

✔ Find top genres/categories

✔ Get the first actor from cast

✔ Clean and convert date formats

✔ Filter data by country / rating

✔ Identify content with sensitive keywords

✔ Find directors or cast with missing values

✔ Search content starring specific actors

✔ Extract release trends

### 📑 Example SQL Queries
1️⃣ Count total content

SELECT COUNT(*) AS total_titles FROM netflix_titles;

2️⃣ Classify good vs bad content

SELECT *,

CASE 
    WHEN description LIKE '%kill%' 
      OR description LIKE '%violence%' THEN 'bad_content'
    ELSE 'good_content'
END AS category
FROM netflix_titles;

3️⃣ Extract first actor

SELECT 
    SUBSTRING_INDEX(cast, ',', 1) AS first_actor
FROM netflix_titles;

4️⃣ Convert date format

SELECT 
    STR_TO_DATE(date_added, '%M %d, %Y') AS formatted_date
FROM netflix_titles;

5️⃣ Find all titles from India

SELECT *
FROM netflix_titles
WHERE country = 'India';

6️⃣ Search for Salman Khan
SELECT *
FROM netflix_titles
WHERE cast LIKE '%Salman Khan%';

