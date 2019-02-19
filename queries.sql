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

-- Finds the top app that has a rating of at least 4.8 with the most reviews --
SELECT app_name
	FROM analytics
	WHERE rating >= 4.8
	ORDER BY reviews DESC
	LIMIT 1;

-- Orders categories by the average rating from highest to lowest -- 
SELECT category, AVG(rating) AS average_rating
	FROM analytics
	GROUP BY category 
	ORDER BY average_rating DESC;

--Most expensive app with a rating that is less than 3 --
SELECT app_name, price, rating
	FROM analytics
	WHERE rating < 3
	ORDER BY price desc
	LIMIT 1;

--all apps with a min install not exveeding 50  and has a rating --
SELECT app_name, min_installs,rating 
	FROM analytics
	WHERE min_installs < 50 AND rating is not NULL
	ORDER BY rating DESC;

-- all apps that are rated less than three with at least 10000 reviews--
SELECT app_name, rating, reviews
	FROM analytics
		WHERE rating < 3 AND reviews >= 10000;

--Top ten most revied apps that cost between 10 cents and 99 cents --
SELECT app_name, reviews
	FROM analytics
		WHERE price BETWEEN .10 AND .999999
		ORDER BY reviews DESC
		LIMIT 10;

-- most outdated app --
SELECT *
	FROM analytics
	WHERE last_updated = (Select MIN(last_updated) FROM analytics);        

-- most expensive app --
SELECT *
	FROM analytics
	WHERE price = (Select MAX(price) FROM analytics);


-- sum of all reviews -- 
SELECT SUM(reviews) as review_sum
	FROM analytics;

-- categories that have more than 300 apps --
SELECT category, COUNT(category)
	FROM analytics
		GROUP BY category
			HAVING COUNT(category) > 300;

-- app that has highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times--
SELECT app_name, reviews, min_installs, (min_installs/reviews) AS proportion
	FROM analytics	
	WHERE min_installs > 100000
	ORDER BY proportion DESC
	LIMIT 1;


-- --

	
