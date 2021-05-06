*&---------------------------------------------------------------------*
*& Chapter 17: Working with the hide command
*&---------------------------------------------------------------------*
REPORT CHAP1704.
* work area
TABLES CUSTOMERS.
* Internal table
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Processing data
START-OF-SELECTION.
  SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
  LOOP AT ALL_CUSTOMERS.
    WRITE / ALL_CUSTOMERS-NAME HOTSPOT ON.
    HIDE ALL_CUSTOMERS-ID.
  ENDLOOP.
* Detail information
AT LINE-SELECTION.
  WRITE: / 'Customer detail information:',
         ALL_CUSTOMERS-NAME,
         ALL_CUSTOMERS-CITY,
         ALL_CUSTOMERS-TELEPHONE.
