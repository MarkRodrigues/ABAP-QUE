*&---------------------------------------------------------------------*
*& Chapter 11: Using Internal Tables for Selection Criteria
*&---------------------------------------------------------------------*
REPORT CHAP1112.
* Work areas
TABLES: CUSTOMERS, BOOKINGS.
* Internal tables
DATA: ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                    WITH HEADER LINE,
      ALL_BOOKINGS  LIKE BOOKINGS OCCURS 500
                    WITH HEADER LINE.
* Reading entries from both database table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
SELECT * FROM BOOKINGS  INTO TABLE ALL_BOOKINGS
       FOR ALL ENTRIES IN ALL_CUSTOMERS
       WHERE CUSTOMID   = ALL_CUSTOMERS-ID
         AND ORDER_DATE = '19990101'.
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  LOOP AT ALL_BOOKINGS
       WHERE CUSTOMID = ALL_CUSTOMERS-ID.
    WRITE: / ALL_CUSTOMERS-NAME,
             ALL_BOOKINGS-FLDATE.
  ENDLOOP.
ENDLOOP.
