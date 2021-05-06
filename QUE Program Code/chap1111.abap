*&---------------------------------------------------------------------*
*& Chapter 11: Obtaining data with nested select loops
*&---------------------------------------------------------------------*
REPORT CHAP1111.
* Work areas
TABLES: CUSTOMERS, BOOKINGS.
* Reading entries from both database table
SELECT * FROM CUSTOMERS.
  SELECT * FROM BOOKINGS
         WHERE CUSTOMID   = CUSTOMERS-ID
           AND ORDER_DATE = '19990101'.
    WRITE: / CUSTOMERS-NAME,
             BOOKINGS-FLDATE.
  ENDSELECT.
ENDSELECT.
