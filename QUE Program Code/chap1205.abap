*&---------------------------------------------------------------------*
*& Chapter 12: Appending multiple lines
*&---------------------------------------------------------------------*
REPORT CHAP1205.
* Work area for a database table
TABLES CUSTOMERS.
* Defining internal tables
DATA: ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                    WITH HEADER LINE,
      OLD_CUSTOMERS LIKE CUSTOMERS OCCURS 10
                    WITH HEADER LINE.
* Filling both internal tables
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
SELECT * FROM CUSTOMERS INTO TABLE OLD_CUSTOMERS.
* Appending one internal table to the other
APPEND LINES OF OLD_CUSTOMERS TO ALL_CUSTOMERS.
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  WRITE / ALL_CUSTOMERS-NAME.
ENDLOOP.
