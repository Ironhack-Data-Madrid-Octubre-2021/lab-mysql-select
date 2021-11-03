USE publications;


#1
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id;

#2
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(title) as title_count
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_name
ORDER BY title_count DESC;

#3 HIGHEST NUMBER OF TITLES (SALES QTY)
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, SUM(qty) as total
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY total DESC
LIMIT 3;

#4
SELECT titleauthor.au_id, authors.au_lname, authors.au_fname, ifnull(SUM(qty),0) as total
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY total DESC;

#4.1 Option_2
select a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", ifnull(sum(d.qty),0) AS "TOTAL"
FROM authors a LEFT JOIN titleauthor b
ON a.au_id = b.au_id 
LEFT JOIN titles c
ON b.title_id = c.title_id
LEFT JOIN sales d
ON b.title_id = d.title_id
GROUP BY a.au_id
ORDER BY sum(d.qty) DESC;

