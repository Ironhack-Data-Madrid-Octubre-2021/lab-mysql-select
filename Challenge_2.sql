{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7244e54b",
   "metadata": {},
   "outputs": [],
   "source": [
    "SELECT a.au_id AUTHOR_ID, a.au_lname LAST_NAME, a.au_fname FIRST_NAME, p.pub_name PUBLISHER, count(t.title) AS TITLE_COUNT\n",
    "FROM authors AS a\n",
    "JOIN titleauthor AS ta on ta.au_id = a.au_id\n",
    "JOIN titles AS t on t.title_id = ta.title_id\n",
    "JOIN publishers AS p on p.pub_id = t.pub_id\n",
    "GROUP BY AUTHOR_ID, p.pub_name\n",
    ";\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.8"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
