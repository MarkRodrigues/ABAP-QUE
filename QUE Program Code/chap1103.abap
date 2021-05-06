*&---------------------------------------------------------------------*
*& Chapter 11: Using internal tables as snapshots of database tables
*&---------------------------------------------------------------------*
REPORT CHAP1103.
* Work area for a database table
TABLES CUSTOMERS.
* Internal table
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Filling the internal table with all entries of the database table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
* Displaying the contents of the internal table
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-NAME.
ENDLOOP.
