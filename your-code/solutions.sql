/* In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles
each author has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/

SELECT ta.au_id, au.au_lname, au.au_fname , t.title , pu.pub_name
FROM titleauthor AS ta
LEFT JOIN authors AS au
ON ta.au_id = au.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN publishers AS pu
ON t.pub_id = pu.pub_id
ORDER BY au.au_lname , au.au_fname , t.title;


/* Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. */
SELECT ta.au_id, au.au_lname, au.au_fname , pu.pub_name , COUNT(t.title) AS "Title Count"
FROM titleauthor AS ta
LEFT JOIN authors AS au
ON ta.au_id = au.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN publishers AS pu
ON t.pub_id = pu.pub_id
GROUP BY ta.au_id
ORDER BY au.au_lname , au.au_fname , pu.pub_name ;

/*Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.*/
SELECT au.au_id , au.au_lname, au.au_fname , SUM(s.qty) as Total
FROM sales AS s
LEFT JOIN titleauthor AS ta
ON s.title_id = ta.title_id
LEFT JOIN authors AS au
ON ta.au_id = au.au_id
GROUP BY au.au_id
ORDER BY Total DESC
LIMIT 3;


/* Challenge 4 - Best Selling Authors Ranking
Display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
 Also order your results based on TOTAL from high to low.*/

SELECT au.au_id , au.au_lname, au.au_fname , IFNULL(SUM(s.qty),0) as Total
FROM authors AS au
LEFT JOIN titleauthor AS ta
ON au.au_id = ta.au_id
LEFT JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY au.au_id
ORDER BY Total DESC;
