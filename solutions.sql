#Query ejercicios 1 y 2
SELECT a.au_id,a.au_lname,a.au_fname,c.title,d.pub_name,count(d.pub_id)
FROM authors a
INNER JOIN titleauthor b
ON a.au_id = b.au_id 
INNER JOIN titles c
on c.title_id = b.title_id
INNER JOIN publishers d
on c.pub_id = d.pub_id
GROUP BY a.au_id,c.title_id

#Query ejercicio 3

select c.au_id,a.au_fname,a.au_lname,d.qty,sum(d.qty)
from authors a,titles b,titleauthor c,sales d
where a.au_id = c.au_id and b.title_id = c.title_id and d.title_id = c.title_id
group by a.au_id
order by sum(d.qty) desc
limit 3;

#Query Ejercicio 4
select ifnull(c.au_id,0),a.au_fname,a.au_lname,ifnull(d.qty,0),ifnull(sum(d.qty),0)
from authors a left join titleauthor c
on a.au_id = c.au_id
left join titles b 
on c.title_id = b.title_id
left join sales d
on c.title_id = d.title_id
group by a.au_id
order by sum(d.qty) desc


