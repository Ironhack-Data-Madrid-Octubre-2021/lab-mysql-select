

SELECT a.au_id , a.au_lname, a.au_fname , c.title , d.pub_name 
FROM authors AS a, titleauthor AS b, titles AS c, publishers AS d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id;


SELECT a.au_id , a.au_lname, a.au_fname , c.title , d.pub_name 
FROM authors AS a, titleauthor AS b, titles AS c, publishers AS d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id
GROUP BY a.au_id;

labs
SELECT a.au_id , a.au_lname, a.au_fname , c.title , d.pub_name 
FROM authors AS a, titleauthor AS b, titles AS c, publishers AS d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND b.title_id = d.title_id
GROUP BY a.au_id
ORDER BY count(title) DESC LIMIT 3;