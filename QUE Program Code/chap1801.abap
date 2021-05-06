*&---------------------------------------------------------------------*
*& Chapter 18: Sample report with selection criteria
*&---------------------------------------------------------------------*
REPORT CHAP1801.
TABLES: CUSTOMERS, BOOKINGS.
PARAMETERS P_DATE TYPE D.
SELECT-OPTIONS S_NAME FOR CUSTOMERS-NAME.
SELECT * FROM CUSTOMERS
       WHERE NAME IN S_NAME.
  WRITE / CUSTOMERS-NAME.
  SELECT * FROM BOOKINGS
         WHERE ORDER_DATE = P_DATE
         AND   CUSTOMID   = CUSTOMERS-ID.
    WRITE: / BOOKINGS-CARRID,
             BOOKINGS-CONNID,
             BOOKINGS-FLDATE.
  ENDSELECT.
ENDSELECT.
