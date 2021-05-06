*&---------------------------------------------------------------------*
*& Chapter 11: Ordering query results
*&---------------------------------------------------------------------*
REPORT CHAP1108.
* Work area
TABLES CUSTOMERS.
* Reading table entries in a specified order
SELECT * FROM CUSTOMERS
       ORDER BY CITY NAME.
  WRITE: / CUSTOMERS-CITY,
           CUSTOMERS-NAME.
ENDSELECT.
