*&---------------------------------------------------------------------*
*& Chapter 10: Using table parameters
*&---------------------------------------------------------------------*
REPORT CHAP1006.

* Work area of database table and internal table for later use
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 50 WITH HEADER LINE.
* Calling a form with a table parameter
PERFORM READ_CUSTOMERS TABLES ALL_CUSTOMERS.
LOOP AT ALL_CUSTOMERS.
  WRITE / ALL_CUSTOMERS-NAME.
ENDLOOP.
* Defining a form with a table parameter
FORM READ_CUSTOMERS TABLES F_CUSTOMERS STRUCTURE ALL_CUSTOMERS.
  SELECT * FROM CUSTOMERS INTO TABLE F_CUSTOMERS.
ENDFORM.
