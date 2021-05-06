*&---------------------------------------------------------------------*
*& Chapter 12: A simple internal table
*&---------------------------------------------------------------------*
REPORT CHAP1201.
* Work area for a database table
TABLES CUSTOMERS.
* Defining an internal table
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100.
* Reading all entries of the database table into the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
