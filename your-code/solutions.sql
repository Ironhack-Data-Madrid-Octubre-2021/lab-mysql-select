SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(title)
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_name;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) as total
FROM authors
LEFT JOIN titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, ifnull(SUM(qty),0) as total
FROM authors
LEFT JOIN titleauthor
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total DESC










