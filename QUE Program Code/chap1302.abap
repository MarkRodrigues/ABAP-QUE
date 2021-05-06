*&---------------------------------------------------------------------*
*& Chapter 13: Inserting multiple entries in a database table
*&---------------------------------------------------------------------*
REPORT CHAP1302.
* Work area
TABLES CUSTOMERS.
* Internal table for new entries
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Filling the internal table
ALL_CUSTOMERS-ID   = '12345678'.
ALL_CUSTOMERS-NAME = 'Brown'.
APPEND ALL_CUSTOMERS.
ALL_CUSTOMERS-ID   = '11111111'.
ALL_CUSTOMERS-NAME = 'Green'.
APPEND ALL_CUSTOMERS.
ALL_CUSTOMERS-ID   = '12121212'.
ALL_CUSTOMERS-NAME = 'White'.
APPEND ALL_CUSTOMERS.
* Inserting the internal table
INSERT CUSTOMERS FROM TABLE ALL_CUSTOMERS.
