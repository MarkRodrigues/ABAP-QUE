*&---------------------------------------------------------------------*
*& Chapter 13: Updating single entries in a database table
*&---------------------------------------------------------------------*
REPORT CHAP1303.
* Work area
TABLES CUSTOMERS.
* Record used as alternative work area
DATA MY_CUSTOMER LIKE CUSTOMERS.
* Updating one entry from the work area
CUSTOMERS-ID = '12345678'.
CUSTOMERS-CITY = 'Village'.
UPDATE CUSTOMERS.
IF SY-SUBRC <> 0.
  WRITE:  'Entry not existing:', CUSTOMERS-ID.
ENDIF.
