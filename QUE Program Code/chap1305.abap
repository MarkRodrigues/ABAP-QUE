*&---------------------------------------------------------------------*
*& Chapter 13: Modifying single entries in a database table
*&---------------------------------------------------------------------*
REPORT CHAP1305.
* Work area
TABLES CUSTOMERS.
* Modifying an entry
CUSTOMERS-ID   = '12345678'.
CUSTOMERS-CITY = 'Village'.
MODIFY CUSTOMERS.
