*&---------------------------------------------------------------------*
*& Chapter 11: Using a dynamic table name
*&---------------------------------------------------------------------*
REPORT CHAP1110.
* Variables for later use
DATA: TABLENAME(10),
      COUNT_ROWS TYPE I.
* Setting the table name dynamically
MOVE 'CUSTOMERS' TO TABLENAME.
* Selecting data
SELECT COUNT( * ) FROM (TABLENAME) INTO COUNT_ROWS.
WRITE: TABLENAME, COUNT_ROWS.
