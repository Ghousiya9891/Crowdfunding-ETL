select * from backers;
-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT b.cf_id, c.backers_count
FROM backers AS b
JOIN campaign AS c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
ORDER BY c.backers_count DESC;

select * from contacts;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT *
FROM (
	SELECT DISTINCT bac.cf_id,bac.first_name, bac.last_name, bac.email,
	(cam.goal - cam.pledged) AS "Rem_Goal_Amt"
	FROM backers AS bac
	JOIN campaign AS cam
	ON cam.cf_id = bac.cf_id
	WHERE cam.outcome = 'live'
	ORDER BY bac.cf_id
	) AS new_tab
ORDER BY "Rem_Goal_Amt" DESC;

CREATE TABLE rem_goals_data ( 
	cf_id int NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	rem_goal_amt INT NOT NULL)


-- Check the table
select * from rem_goals_data;
select distinct bac.email, bac.first_name, bac.last_name, bac.cf_id, cam.company_name, cam.description,cam.end_date,
(cam.goal - cam.pledged) as left_goal from backers bac
inner join campaign cam on bac.cf_id=cam.cf_id
order by bac.email
-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
CREATE TABLE email_backers_remaining_goal_amount ( 
	email VARCHAR(100),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	cf_id INT NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	description VARCHAR(50) NOT NULL,
	end_date date NOT NULL,
	left_goal INT NOT NULL)
	
select * from email_backers_remaining_goal_amount;





