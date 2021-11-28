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