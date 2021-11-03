/*Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles 
each author has published at which publishers. Your output should have at least the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published*/

/*select * from authors;
select * from publishers;
select * from titles;
select * from titleauthor;*/

/*SELECT customerName, customercity, customermail, salestotal
FROM onlinecustomers AS oc
   INNER JOIN
   orders AS o
   ON oc.customerid = o.customerid
   INNER JOIN
   sales AS s
   ON o.orderId = s.orderId*/

select authors.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, titles.title as Title, publishers.pub_name as Publisher
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on publishers.pub_id = titles.pub_id;

/*Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE COUNT - number of published titles per each author
PUBLISHER - name of the publisher where the title was published*/

Select authors.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, publishers.pub_name as Publisher, count(titles.title) as Title 
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on publishers.pub_id = titles.pub_id
GROUP BY authors.au_id;

/*Removing the group by the query returns the total amount of titles*/

/*Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? 
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.*/

Select authors.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, titles.title_id as Title, sum(sales.qty) as Total_sales
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
limit 3;

/*Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.*/

Select authors.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, titles.title_id as Title, ifnull(sum(sales.qty),0) as Total_sales
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;