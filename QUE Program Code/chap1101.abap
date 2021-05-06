*&---------------------------------------------------------------------*
*& Chapter 11: A simple query
*&---------------------------------------------------------------------*
REPORT CHAP1101.
* Work area for a database table
TABLES CUSTOMERS.
* Reading all entries of the database table
SELECT * FROM CUSTOMERS.
  WRITE: / CUSTOMERS-NAME.
ENDSELECT.
