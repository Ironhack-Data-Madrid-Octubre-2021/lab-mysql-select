USE publications;
SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(title)
FROM titles
JOIN publishers
ON titles.pub_id=publishers.pub_id
JOIN titleauthor
ON titleauthor.title_id=titles.title_id
JOIN authors
ON authors.au_id=titleauthor.au_id
GROUP BY au_fname, pub_name;