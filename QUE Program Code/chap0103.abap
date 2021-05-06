*&---------------------------------------------------------------------*
*& Chapter 1: Working with database tables and internal tables         *
*&---------------------------------------------------------------------*
REPORT CHAP0103.

* Declaration of a work area for a Dictionary table
TABLES CUSTOMERS.
* Internal table used as snapshot of the database table
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Reading the entries of the database table into an internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
* Displaying each line of an internal table
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-NAME.
ENDLOOP.
