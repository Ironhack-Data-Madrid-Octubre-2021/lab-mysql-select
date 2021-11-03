SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

/*
Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
*/

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, p.pub_name PUBLISHER, count(t.title) as TITLE_COUNT
FROM authors a
JOIN titleauthor ta on ta.au_id = a.au_id
JOIN titles t on t.title_id = ta.title_id
JOIN publishers p on p.pub_id = t.pub_id
GROUP BY AUTHOR_ID
;

create view suma as
SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, p.pub_name PUBLISHER, count(t.title) as TITLE_COUNT
FROM authors a
JOIN titleauthor ta on ta.au_id = a.au_id
JOIN titles t on t.title_id = ta.title_id
JOIN publishers p on p.pub_id = t.pub_id
GROUP BY AUTHOR_ID
;
select sum(Title_count) from suma;
