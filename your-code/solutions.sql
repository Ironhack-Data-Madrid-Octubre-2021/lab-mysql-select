#/* CHALLENGE 1 /*           

SELECT au_id, au_lname, au_fname, title, pub_name
FROM authors INNER JOIN titleauthor
ON authors = titleauthor


#titleauthor, titles, publishers
