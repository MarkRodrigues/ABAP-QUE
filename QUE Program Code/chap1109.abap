*&---------------------------------------------------------------------*
*& Chapter 11: Using Select-Options
*&---------------------------------------------------------------------*
REPORT CHAP1109.
* Work area
TABLES CUSTOMERS.
* Specifiying a Select-Option
SELECT-OPTIONS SNAME FOR CUSTOMERS-NAME.
* Internal table for later use
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Reading table entries according to a Select-Option
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS
       WHERE NAME IN SNAME.
* Displaying the reuslt
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-CITY,
           ALL_CUSTOMERS-NAME.
ENDLOOP.
