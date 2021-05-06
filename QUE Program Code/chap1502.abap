*&---------------------------------------------------------------------*
*& Chapter 15: Using a Logical Database
*&---------------------------------------------------------------------*
REPORT CHAP1502.
* Work areas
TABLES: CUSTOMERS, BOOKINGS.
* Reading data
GET CUSTOMERS.
  WRITE / CUSTOMERS-NAME.
GET BOOKINGS.
  WRITE: AT /3 BOOKINGS-FLDATE.
