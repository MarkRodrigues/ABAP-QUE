*&---------------------------------------------------------------------*
*& Chapter 1: Designing a report                                       *
*&---------------------------------------------------------------------*
REPORT CHAP0104.

* Declaration of a work area for a Dictionary table
TABLES CUSTOMERS.
* Internal table used as snapshot of the database table
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Definition of input fields on the report's selection screen
SELECT-OPTIONS SNAME FOR CUSTOMERS-NAME.
* Reading the entries of the database table into an internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS
       WHERE NAME IN SNAME.
* Displaying each line of an internal table
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-NAME.
ENDLOOP.
