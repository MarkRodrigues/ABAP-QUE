*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic Open SQL Commands: table name
*&---------------------------------------------------------------------*
REPORT CHAP2305.

PARAMETERS TABLENAME(10) DEFAULT 'CUSTOMERS'.
DATA COUNT_ROWS TYPE I.
SELECT COUNT( * ) FROM (TABLENAME) INTO COUNT_ROWS.
WRITE: TABLENAME, COUNT_ROWS.

DATA WHERE_TAB(80) OCCURS 10 WITH HEADER LINE.
APPEND 'name like ''E%''' TO WHERE_TAB.
APPEND 'and city like ''S%''' TO WHERE_TAB.
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100.
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS
       WHERE ID BETWEEN 1 AND 999
       AND (WHERE_TAB).
