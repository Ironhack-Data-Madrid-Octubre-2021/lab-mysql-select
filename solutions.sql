USE publications;

#Ch1

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, t.title AS TITLE, p.pub_id AS PUBLISHER
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles AS t
ON ta.title_id = t.title_id
INNER JOIN publishers AS p
ON t.pub_id = p.pub_id;

#Ch2

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, p.pub_id AS PUBLISHER, count(t.title) as TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS ta
ON a.au_id = ta.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
JOIN publishers AS p
ON t.pub_id = p.pub_id
GROUP BY AUTHOR_ID, p.pub_name;

#Ch3

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, sum(s.qty) as TOTAL
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

#Ch4

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LASTNAME, a.au_fname AS FIRSTNAME, ifnull(sum(s.qty),0) as TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 23;
