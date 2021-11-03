#CHALLENGE 1
SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers as p
ON t.pub_id = p.pub_id;

# Devuelve 25 filas

SELECT * 
FROM titleauthor;

# Devuelve 25 filas, por lo tanto está bien

#CHALLENGE 2


SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, p.pub_name AS PUBLISHER, COUNT(t.title) AS TITLECOUNT 
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name;

#title count sum = 25, 24 filas todos con 1 menos una que es 2

SELECT * 
FROM titleauthor;

#25 rows, es CORRECTO

#CHALLENGE 3

SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, SUM(s.qty) as TOTAL
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN sales AS s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4
SELECT a.au_id AS AUTHOR_ID , a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, IFNULL(SUM(s.qty),0) as TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN sales AS s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
