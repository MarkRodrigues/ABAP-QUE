*&---------------------------------------------------------------------*
*& Chapter 12: Filling an internal table from a database table
*&---------------------------------------------------------------------*
REPORT CHAP1203.
* Work area for a database table
TABLES CUSTOMERS.
* Defining an internal table with header line
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Filling the internal table (previous content overwritten)
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
* Filling the internal table (previous content kept)
SELECT * FROM CUSTOMERS APPENDING TABLE ALL_CUSTOMERS.
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  WRITE / ALL_CUSTOMERS-NAME.
ENDLOOP.
