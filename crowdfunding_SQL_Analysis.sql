-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count desc;
-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT campaign.cf_id, campaign.backers_count FROM backers
INNER JOIN campaign ON campaign.cf_id = backers.cf_id
WHERE campaign.outcome = 'live'
GROUP BY campaign.cf_id
ORDER BY backers_count desc;
-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT contacts.first_name, contacts.last_name, contacts.email, 
	   (campaign.goal - campaign.pledged) AS Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN contacts ON contacts.contact_id = campaign.contact_id
WHERE outcome = 'live'
ORDER BY remaining_goal_amount desc;
-- Check the table
