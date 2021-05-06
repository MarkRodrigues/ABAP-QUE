*&---------------------------------------------------------------------*
*& Chapter 5: Working with tables from the Dictionary
*&---------------------------------------------------------------------*
REPORT CHAP0501.

* Declaration of a work area for a Dictionary table
TABLES CUSTOMERS.
* Reading all entries of the database table and displaying each entry
SELECT * FROM CUSTOMERS.
  WRITE: / CUSTOMERS-NAME.
ENDSELECT.
