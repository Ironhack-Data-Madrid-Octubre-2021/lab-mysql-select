/*
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
*/

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, sum(s.qty) as TOTAL
FROM authors a
JOIN titleauthor ta on ta.au_id = a.au_id
JOIN titles t on t.title_id = ta.title_id
JOIN sales s on s.title_id = t.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3
;