USE publications;

### _________________________________ Challenge 1 ____________________________________ ###

SELECT a.au_id, a.au_lname, a.au_fname, c.title, d.pub_name
FROM authors as a

LEFT JOIN  titleauthor as b
ON a.au_id = b.au_id

LEFT JOIN  titles as c
ON b.title_id = c.title_id

LEFT JOIN  publishers as d
ON c.pub_id = d.pub_id ;


### _________________________________ Challenge 2 ____________________________________ ###

SELECT a.au_id, a.au_lname, a.au_fname, d.pub_name, count(a.au_id) as count
FROM authors as a

LEFT JOIN  titleauthor as b
ON a.au_id = b.au_id

LEFT JOIN  titles as c
ON b.title_id = c.title_id

LEFT JOIN  publishers as d
ON c.pub_id = d.pub_id 

GROUP BY a.au_id, d.pub_name
ORDER BY count DESC ;


### _________________________________ Challenge 3 ____________________________________ ###

SELECT a.au_id, a.au_lname, a.au_fname, SUM(e.qty) as total
FROM authors as a

LEFT JOIN  titleauthor as b
ON a.au_id = b.au_id

LEFT JOIN  titles as c
ON b.title_id = c.title_id

LEFT JOIN  sales as e
ON c.title_id = e.title_id 

GROUP BY a.au_id
ORDER BY total DESC
LIMIT 3 ;


### _________________________________ Challenge 4 ____________________________________ ###

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
