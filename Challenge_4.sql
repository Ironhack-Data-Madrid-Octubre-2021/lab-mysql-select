/*
Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
Also order your results based on TOTAL from high to low.
*/

SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, count(t.title) as TOTAL
FROM authors a
LEFT JOIN titleauthor ta on ta.au_id = a.au_id
LEFT JOIN titles t on t.title_id = ta.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
;