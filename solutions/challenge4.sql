USE publications;
SELECT authors.au_id, au_lname, au_fname, IFNULL(SUM(sales.qty),0)
FROM titles
RIGHT JOIN publishers
ON titles.pub_id=publishers.pub_id
RIGHT JOIN titleauthor
ON titleauthor.title_id=titles.title_id
RIGHT JOIN authors
ON authors.au_id=titleauthor.au_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY au_fname
ORDER BY SUM(qty) DESC
LIMIT 23;