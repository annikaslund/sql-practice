-- Comments in SQL Start with dash-dash --

-- Selects app_name with the id of 1880 -- 
SELECT app_name
	FROM analytics
	WHERE id = 1880;

-- Selects app id & name where it was last updated on 2018-08-01'
SELECT id, app_name
	FROM analytics
	WHERE last_updated = '2018-08-01'

-- Groups categories and counts the number of apps in each -- 
SELECT category, COUNT(category) AS total
	FROM analytics 
	GROUP BY category;

-- Finds the 5 most reviewed apps and the number of views for each --
SELECT app_name, reviews
	FROM analytics
	ORDER BY reviews DESC 
	LIMIT 5;