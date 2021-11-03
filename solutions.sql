USE publications;


-- CHALLENGE 1:

SELECT authors.au_id ,authors.au_fname,authors.au_lname,titles.title, publishers.pub_name
FROM authors 
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles 
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers 
ON titles.pub_id=publishers.pub_id;


-- CHALLENGE 2:

SELECT authors.au_id ,authors.au_fname,authors.au_lname, publishers.pub_name, COUNT(title)
FROM authors 
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles 
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers 
ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;


-- CHALLENGE 3:

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(sales.qty) AS TOTAL
FROM authors 
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles 
ON titleauthor.title_id=titles.title_id
INNER JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;


-- CHALLENGE 4:

SELECT authors.au_id, authors.au_fname, authors.au_lname, ifnull(SUM(sales.qty),0) AS TOTAL
FROM authors 
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles 
ON titleauthor.title_id=titles.title_id
LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23;





