*&---------------------------------------------------------------------*
*& Chapter 11: Reading single entries
*&---------------------------------------------------------------------*
REPORT CHAP1105.
* Work area for a database table
TABLES CUSTOMERS.
* Reading a single entry
SELECT SINGLE * FROM CUSTOMERS
       WHERE ID = '87654321'.
IF SY-SUBRC = 0.
  WRITE CUSTOMERS-NAME.
ELSE.
  WRITE 'Customer not found.'.
ENDIF.
