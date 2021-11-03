USE publications;

-- CHALLENGE 1:

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titles

INNER JOIN titleauthor 
ON titles.title_id = titleauthor.title_id

INNER JOIN publishers
ON titles.pub_id = publishers.pub_id

INNER JOIN authors
ON titleauthor.au_id = authors.au_id;

-- CHALLENGE 2:

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(title)
FROM titles

LEFT JOIN titleauthor 
ON titles.title_id = titleauthor.title_id

LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id

LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, publishers.pub_name;


-- CHALLENGE 3:

-- ¿Quiénes son los 3 autores principales que han vendido el mayor número de títulos? Escribe una consulta para averiguarlo.

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) as total
FROM authors

LEFT JOIN  titleauthor 
ON authors.au_id = titleauthor.au_id

LEFT JOIN  titles
ON titleauthor.title_id = titles.title_id

LEFT JOIN  sales
ON titles.title_id = sales.title_id 

GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3 ;

-- CHALLENGE 4:

SELECT authors.au_id, authors.au_lname, authors.au_fname, ifnull(SUM(sales.qty),0) as total
FROM authors 

LEFT JOIN  titleauthor 
ON authors.au_id = titleauthor.au_id

LEFT JOIN  titles 
ON titleauthor.title_id = titles.title_id

LEFT JOIN  sales 
ON titles.title_id = sales.title_id 

GROUP BY authors.au_id
ORDER BY total DESC ;