*&---------------------------------------------------------------------*
*& Chapter 13: Inserting single entries in a database table
*&---------------------------------------------------------------------*
REPORT CHAP1301.
* Work area
TABLES CUSTOMERS.
* Record used as alternative work area
DATA MY_CUSTOMER LIKE CUSTOMERS.
* Inserting one entry from the work area
CUSTOMERS-ID = '12345678'.
CUSTOMERS-NAME = 'Brown'.
INSERT CUSTOMERS.
IF SY-SUBRC <> 0.
  WRITE: / 'Entry already exists:', CUSTOMERS-ID.
ENDIF.
* Inserting one entry from the record
MY_CUSTOMER-ID = '11111111'.
MY_CUSTOMER-NAME = 'Green'.
INSERT INTO CUSTOMERS VALUES MY_CUSTOMER.
IF SY-SUBRC <> 0.
  WRITE: / 'Entry already exists:', MY_CUSTOMER-ID.
ENDIF.
