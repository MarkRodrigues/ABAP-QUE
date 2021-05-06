*&---------------------------------------------------------------------*
*& Chapter 13: Updating multiple entries in a database table
*&---------------------------------------------------------------------*
REPORT CHAP1304.
* Work area
TABLES CUSTOMERS.
* Internal table for changed entries
DATA CHANGED_CUSTOMERS LIKE CUSTOMERS OCCURS 50
                       WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS INTO TABLE CHANGED_CUSTOMERS
       WHERE CITY = SPACE.
LOOP AT CHANGED_CUSTOMERS.
  CHANGED_CUSTOMERS-CITY = 'City unknown'.
  MODIFY CHANGED_CUSTOMERS.
ENDLOOP.
* Updating the database table with values from the internal table
UPDATE CUSTOMERS FROM TABLE CHANGED_CUSTOMERS.
* Updating the database table according to a where condition
UPDATE CUSTOMERS SET   CITY = 'City unknown'
                 WHERE CITY = SPACE.
