*&---------------------------------------------------------------------*
*& Chapter 9: External flow of control (events)
*&---------------------------------------------------------------------*
REPORT CHAP0901.

* Display a list of customers
TABLES CUSTOMERS.
SELECT * FROM CUSTOMERS.
  WRITE / CUSTOMERS-NAME.
ENDSELECT.

* Event for drill down
AT LINE-SELECTION.
  WRITE: / 'This line appears after drill-down'.
