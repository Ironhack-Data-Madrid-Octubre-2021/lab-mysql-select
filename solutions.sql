/*
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers.
Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/
USE publications;

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, t.title TITLE, p.pub_name PUBLISHER 
FROM authors a 
JOIN titleauthor ta on ta.au_id = a.au_id
JOIN titles t on t.title_id = ta.title_id
JOIN publishers p on p.pub_id = t.pub_id
;


SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

/*
Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
*/

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, p.pub_name PUBLISHER, count(t.title) as TITLE_COUNT
FROM authors a
JOIN titleauthor ta on ta.au_id = a.au_id
JOIN titles t on t.title_id = ta.title_id
JOIN publishers p on p.pub_id = t.pub_id
GROUP BY AUTHOR_ID, p.pub_name
;

create view suma as
SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, p.pub_name PUBLISHER, count(t.title) as TITLE_COUNT
FROM authors a
JOIN titleauthor ta on ta.au_id = a.au_id
JOIN titles t on t.title_id = ta.title_id
JOIN publishers p on p.pub_id = t.pub_id
GROUP BY AUTHOR_ID, p.pub_name
;

select sum(Title_count) from suma;


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

/*
Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
Also order your results based on TOTAL from high to low.
*/

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, ifnull(sum(s.qty),0) as TOTAL
FROM authors a
LEFT JOIN titleauthor ta on ta.au_id = a.au_id
LEFT JOIN titles t on t.title_id = ta.title_id
LEFT JOIN sales s on s.title_id = t.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
;