USE publications;
#Challenge1
SELECT titles.title, titleauthor.au_id, authors.au_fname, authors.au_lname,  publishers.pub_name
FROM titles 
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN authors 
ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers
ON titles.pub_id= publishers.pub_id;

#Challenge2
SELECT titleauthor.au_id, authors.au_fname, authors.au_lname,  publishers.pub_name, COUNT(titles.title)
FROM titles 
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN authors 
ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers
ON titles.pub_id= publishers.pub_id
GROUP BY authors.au_id, pub_name;

#CHALLENGE 3
SELECT a.au_id, a.au_lname, a.au_fname, sum(sales.qty)
FROM authors as a
LEFT JOIN titleauthor
ON a.au_id = titleauthor.au_id
LEFT JOIN titles as t
ON titleauthor.title_id = t.title_id
LEFT JOIN sales
ON t.title_id = sales.title_id
GROUP BY a.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;

#CHALLENGE 4
SELECT a.au_id, a.au_lname, a.au_fname, IFNULL(sum(sales.qty), 0)
FROM authors as a
LEFT JOIN titleauthor
ON a.au_id = titleauthor.au_id
LEFT JOIN titles as t
ON titleauthor.title_id = t.title_id
LEFT JOIN sales
ON t.title_id = sales.title_id
GROUP BY a.au_id
ORDER BY sum(sales.qty) DESC;







