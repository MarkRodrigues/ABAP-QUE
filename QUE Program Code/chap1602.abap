*&---------------------------------------------------------------------*
*& Chapter 16: Working with Select-Options
*&---------------------------------------------------------------------*
REPORT CHAP1602.
* Work area
TABLES CUSTOMERS.
* Defining Select-Options
SELECT-OPTIONS S_NAME FOR CUSTOMERS-NAME.
SELECT * FROM CUSTOMERS
       WHERE NAME IN S_NAME.
  WRITE / CUSTOMERS-NAME.
ENDSELECT.
