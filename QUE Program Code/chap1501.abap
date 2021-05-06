*&---------------------------------------------------------------------*
*& Chapter 15: Using select statements
*&---------------------------------------------------------------------*
REPORT CHAP1501.
* Work areas
TABLES: CUSTOMERS, BOOKINGS.
* Reading data
SELECT * FROM CUSTOMERS.
  WRITE / CUSTOMERS-NAME.
  SELECT * FROM BOOKINGS
         WHERE CUSTOMID = CUSTOMERS-ID
         AND   FLDATE     > '19990501'
         AND   ORDER_DATE = '19990101'.
    WRITE: AT /3 BOOKINGS-FLDATE.
  ENDSELECT.
ENDSELECT.
