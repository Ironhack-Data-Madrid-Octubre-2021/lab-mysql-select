SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


#/* CHALLENGE 1 /*           

SELECT cau.au_id, concat(au_fname,' ', au_lname) AS au_fullname, title, pub_name
FROM authors AS cau
		JOIN titleauthor AS t
			ON cau.au_id = t.au_id
		JOIN titles AS ts
			ON t.title_id = ts.title_id
		JOIN publishers AS pub
			ON ts.pub_id = pub.pub_id;
            
#/* CHALLENGE 2 /*           

SELECT cau.au_id, CONCAT(au_fname, ' ', au_lname) AS au_fullname, pub.pub_name, COUNT(title)
FROM authors AS cau
		JOIN titleauthor AS t
			ON cau.au_id = t.au_id
		JOIN titles AS ts
			ON t.title_id = ts.title_id
		JOIN publishers AS pub
			ON ts.pub_id = pub.pub_id
	GROUP BY pub.pub_name, au_fullname
    ORDER BY au_fullname, pub.pub_name;  

#/* CHALLENGE 3 /*

SELECT au.au_id AS 'Author ID', au.au_lname AS 'Last Name', au.au_fname AS 'First Name', SUM(sales.qty * titles.price) AS 'Total'  
FROM authors AS au
	JOIN titleauthor as ti
		ON au.au_id = ti.au_id 
	JOIN titles 
		ON ti.title_id = titles.title_id 
	JOIN sales 
		ON titles.title_id = sales.title_id
GROUP BY  au.au_id
ORDER BY Total desc
LIMIT 3;
  