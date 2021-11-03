

# CHALLENGE I
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors as a
LEFT JOIN titleauthor as au
ON a.au_id = au.au_id
LEFT JOIN titles as t
ON au.title_id = t.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id;

# CHALLENGE II
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, COUNT(t.title) AS TITLE_SUM
FROM authors as a
LEFT JOIN titleauthor as au
ON a.au_id = au.au_id
LEFT JOIN titles as t
ON au.title_id = t.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name;

# CHALLENGE III
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(s.qty) AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as au
ON a.au_id = au.au_id
LEFT JOIN titles as t
ON au.title_id = t.title_id
LEFT JOIN sales as s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC
LIMIT 3;

# CHALLENGE IV
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, IFNULL(SUM(s.qty),0) AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as au
ON a.au_id = au.au_id
LEFT JOIN titles as t
ON au.title_id = t.title_id
LEFT JOIN sales as s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC
LIMIT 23;

