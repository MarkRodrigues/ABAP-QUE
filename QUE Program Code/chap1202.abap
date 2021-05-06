*&---------------------------------------------------------------------*
*& Chapter 12: Internal tables with header lines
*&---------------------------------------------------------------------*
REPORT CHAP1202.
* Work area for a database table
TABLES CUSTOMERS.
* Defining an internal table with header line
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Reading all entries of the database table into the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
