*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic sort command with several sort criteria
*&---------------------------------------------------------------------*
REPORT CHAP2302.
* Parameters for the sort criterion, can be modified by the end user
PARAMETERS: COLUMN1(10)          DEFAULT 'NAME',
            COLUMN2 LIKE COLUMN1 DEFAULT 'ID'.
* Declarations for later use
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
* Dynamic sort with two sort criteria
SORT ALL_CUSTOMERS BY (COLUMN1) (COLUMN2) DESCENDING.
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-ID,
           ALL_CUSTOMERS-NAME,
           ALL_CUSTOMERS-CITY,
           ALL_CUSTOMERS-TELEPHONE.
ENDLOOP.
