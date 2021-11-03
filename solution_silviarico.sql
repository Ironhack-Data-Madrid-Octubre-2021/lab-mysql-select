
#ACTIVIDAD 1: Autor - títulos

SELECT au.au_id as Author_ID, au.au_lname as last_name, au.au_fname as first_name, t.title as title, t.title_id as title_id, p.pub_name as publisher
FROM titles AS t
LEFT JOIN titleauthor as a
ON t.title_id = a.title_id
LEFT JOIN authors as au
ON a.au_id = au.au_id
left JOIN publishers as p
ON t.pub_id = p.pub_id;



#Actividad title counts
SELECT au.au_id as Author_ID, au.au_lname as last_name, au.au_fname as first_name, p.pub_name as publisher, count(t.title) as titles_no
FROM titles AS t
LEFT JOIN titleauthor as a
ON t.title_id = a.title_id
LEFT JOIN authors as au
ON a.au_id = au.au_id
left JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY t.title
ORDER BY titles_no DESC;


# Actividad 3 best sellers (sales amount)

SELECT au.au_id as Author_ID, au.au_lname as last_name, au.au_fname as first_name, p.pub_name as publisher, sum(s.qty) as books_sold
FROM titles AS t
LEFT JOIN titleauthor as a
ON t.title_id = a.title_id
LEFT JOIN authors as au
ON a.au_id = au.au_id
left JOIN publishers as p
ON t.pub_id = p.pub_id
LEFT JOIN sales as s
ON t.title_id=s.title_id
GROUP BY Author_id
ORDER BY books_sold DESC
LIMIT 3;

# Actividad 4 autores

SELECT au.au_id as Author_ID, au.au_lname as last_name, au.au_fname as first_name, p.pub_name as publisher, IFNULL(sum(s.qty),0) as books_sold
FROM titles AS t
LEFT JOIN titleauthor as a
ON t.title_id = a.title_id
LEFT JOIN authors as au
ON a.au_id = au.au_id
left JOIN publishers as p
ON t.pub_id = p.pub_id
LEFT JOIN sales as s
ON t.title_id=s.title_id
GROUP BY Author_id
ORDER BY books_sold DESC;



