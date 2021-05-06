*&---------------------------------------------------------------------*
*& Chapter 13: Deleting multiple entries from a database table
*&---------------------------------------------------------------------*
REPORT CHAP1308.
* Work area
TABLES CUSTOMERS.
* Internal table for deleted entries
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 50
                   WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS
       WHERE CITY = SPACE.
* Deleting entries with values from the internal table
DELETE CUSTOMERS FROM TABLE ALL_CUSTOMERS.
* Deleting entries according to a where condition
DELETE FROM CUSTOMERS
       WHERE ID LIKE '1%'.
