#####Query uno#####

select a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", c.title AS "TITLE", d.pub_name AS "PUBLISHER"
FROM authors a, titleauthor b, titles c, publishers d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id;

#####Query dos#####
select a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", count(title) AS "TITLE COUNT", d.pub_name AS "PUBLISHER"
FROM authors a, titleauthor b, titles c, publishers d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id
GROUP BY a.au_id;

#####Query tres#####
select a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", count(title) AS "TOTAL"
FROM authors a, titleauthor b, titles c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY count(title) DESC
LIMIT 3;

#####Query cuatro#####
select a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", count(title) AS "TOTAL"
FROM authors a LEFT JOIN titleauthor b
ON a.au_id = b.au_id 
LEFT JOIN titles c
ON b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY count(title) DESC;