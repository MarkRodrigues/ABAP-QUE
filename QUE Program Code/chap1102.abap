*&---------------------------------------------------------------------*
*& Chapter 11: Using an alternative work area
*&---------------------------------------------------------------------*
REPORT CHAP1102.
* Work area for a database table
TABLES CUSTOMERS.
* alternative work area
DATA MY_CUSTOMER LIKE CUSTOMERS.
* Reading all entries of the database table
SELECT * FROM CUSTOMERS INTO MY_CUSTOMER.
  WRITE: / MY_CUSTOMER-NAME.
ENDSELECT.
