#Challenge 1 
SELECT a.au_id, a.au_lname, a.au_fname,t.title,p.pub_name
FROM authors AS a
INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id
INNER JOIN titles as t
ON ta.title_id = t.title_id
INNER JOIN publishers as p
ON t.pub_id = p.pub_id
;

#Challenge 2
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(a.au_id) as count
FROM authors as a
LEFT JOIN  titleauthor as t
ON a.au_id = t.au_id
LEFT JOIN  titles as c
ON t.title_id = c.title_id
LEFT JOIN  publishers as p
ON c.pub_id = p.pub_id 
GROUP BY a.au_id, p.pub_name
ORDER BY count DESC ;

#Challenge 3 
SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) as Total
FROM authors as a
LEFT JOIN  titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN  titles as t
ON ta.title_id = t.title_id
LEFT JOIN  sales as s
ON t.title_id = t.title_id 
GROUP BY a.au_id
ORDER BY total DESC
LIMIT 3 ;

#Challenge 4
SELECT a.au_id, a.au_lname, a.au_fname, ifnull(SUM(s.qty),0) as Total
FROM authors as a
LEFT JOIN  titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN  titles as t
ON ta.title_id = t.title_id
LEFT JOIN  sales as s
ON t.title_id = t.title_id 
GROUP BY a.au_id
ORDER BY total;