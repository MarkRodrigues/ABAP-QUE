*&---------------------------------------------------------------------*
*& Chapter 13: Modifying multiple entries in a database table
*&---------------------------------------------------------------------*
REPORT CHAP1306.
* Work area
TABLES CUSTOMERS.
* Internal table for changed entries
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 50
                   WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS
       WHERE CITY = SPACE.
ALL_CUSTOMERS-ID   = '04295119'.
ALL_CUSTOMERS-NAME = 'Gray'.
APPEND ALL_CUSTOMERS.
LOOP AT ALL_CUSTOMERS.
  ALL_CUSTOMERS-CITY = 'City unknown'.
  MODIFY ALL_CUSTOMERS.
ENDLOOP.
* Modifying the database table with values from the internal table
MODIFY CUSTOMERS FROM TABLE ALL_CUSTOMERS.
