SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, p.pub_name PUBLISHER, count(t.title) AS TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS ta on ta.au_id = a.au_id
JOIN titles AS t on t.title_id = ta.title_id
JOIN publishers AS p on p.pub_id = t.pub_id
GROUP BY AUTHOR_ID, p.pub_name
;

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, sum(s.qty) AS TOTAL
FROM authors AS a
JOIN titleauthor AS ta on ta.au_id = a.au_id
JOIN titles AS t on t.title_id = ta.title_id
JOIN sales AS s on s.title_id = t.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;



