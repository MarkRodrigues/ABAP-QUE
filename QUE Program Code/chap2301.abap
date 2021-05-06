*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic sort command
*&---------------------------------------------------------------------*
REPORT CHAP2301.
* Parameter for the sort criterion, can be modified by the end user
PARAMETERS COLUMN(10) DEFAULT 'NAME'.
* Declarations for later use
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
* Dynamic sort
SORT ALL_CUSTOMERS BY (COLUMN).
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-ID,
           ALL_CUSTOMERS-NAME,
           ALL_CUSTOMERS-CITY,
           ALL_CUSTOMERS-TELEPHONE.
ENDLOOP.
