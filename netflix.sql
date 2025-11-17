select *  from netflix_titles;
select 
count(*) as total_content
from netflix_titles;
 
select distinct type from netflix_titles;

select *  from netflix_titles;
-- 1 count the number of movies as tv shows
 select type , count(*) as total_content
 from netflix_titles
 group by type;
 
 -- 2 find the most comman rating for movies and tv shows
 select type, rating 
 from(
 select type, rating , count(*), rank(), over (partition by type order by count(*)desc) as ranking
 from netflix_titles
 group by (1,2) as t1
 where 
 ranking=1;

-- 3 list all movies released in specific year(e.g. 2020)
select *  from netflix_titles
where 
type ='Movie'and
release_year = 2020;

-- 4 find the top 5 countries with the most content on netlfix
select country, count(*) as Total_content from netflix_titles
group by 1
order by 2 desc
limit 5;

-- 5 identify the longest movie
select * from netflix_titles
where type='Movie'
and duration=(select max(duration) from netflix_titles);

-- 6 find content added in the last 5 years 
select *
from netflix_titles
where 
TO_DATE(date_added,'Month,DD,YYYY') >= current_date - interval '5 years';

-- 7 find all the movies/tv shows by director 'rajiv chilaka'
select *from netflix_titles
where director = 'Rajiv Chilaka';

-- 8 list all tv shows with more than 5 seasons
select *from netflix_titles
where 
     type = 'TV show' and
     CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5;
     
-- 9 count the number of content items in each genre
SELECT 
    jt.genre,
    COUNT(nt.show_id) AS total_shows
FROM netflix_titles nt
JOIN JSON_TABLE(
        CONCAT('["', REPLACE(nt.listed_in, ',', '","'), '"]'),
        '$[*]' COLUMNS (genre VARCHAR(255) PATH '$')
     ) jt
GROUP BY jt.genre
ORDER BY total_shows DESC;

-- 10 find each year and the avg no of content release by india on netflix return top 5 year with highest avg content release 
SELECT 
    extract(year from STR_TO_DATE(date_added, '%M %d, %Y'))AS year,
    count(*)
FROM netflix_titles
WHERE country = 'India'
group by 1;

-- 11 list all movies that are documentaris
select * from netflix_titles
where
listed_in LIKE '%documentaries';

-- 12 find all content without a director
SELECT *
FROM netflix_titles
WHERE director IS NULL;

-- 13 find how many movies actor 'salman khan' appered in last 10 years
select * from netflix_titles
where
cast LIKE '%Salman Khan%'
and
release_year > extract(year from current_date)-10; 

-- 14 find the top 10 actors who have appeared in the highest no of movies product in india
SELECT 
    SUBSTRING_INDEX(cast, ',', 1) AS first_actor,
    COUNT(*) AS total_content
FROM netflix_titles
where country like '%india'
GROUP BY first_actor
order by 2 desc
limit 2 ; 

-- 15 categorize the content based on the presence of the keywords ' kill' and 'violence in  th description field label content as ' good' count how many items fall into each category
select 
*,
	case
	when 
      description like '%kill' or 
      description like '%voilence' then 'bad_content'
      else 'good content'
    end category
 FROM netflix_titles;

















 
 