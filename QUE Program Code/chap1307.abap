*&---------------------------------------------------------------------*
*& Chapter 13: Deleting single entries from a database table
*&---------------------------------------------------------------------*
REPORT CHAP1307.
* Work area
TABLES CUSTOMERS.
* Deleting an entry
CUSTOMERS-ID = '12345678'.
DELETE CUSTOMERS.
