SELECT a.au_id, a.au_lname, a.au_fname, ifnull(SUM(e.qty),0) as total
FROM authors as a

LEFT JOIN  titleauthor as b
ON a.au_id = b.au_id

LEFT JOIN  titles as c
ON b.title_id = c.title_id

LEFT JOIN  sales as e
ON c.title_id = e.title_id 

GROUP BY a.au_id
ORDER BY total DESC ;