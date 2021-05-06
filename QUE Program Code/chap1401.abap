*&---------------------------------------------------------------------*
*& Chapter 14: Exporting to the ABAP/4 Memory
*&---------------------------------------------------------------------*
REPORT CHAP1401.
* Work areas
TABLES: CUSTOMERS, BOOKINGS.
* Internal tables which will be exported
DATA: ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                    WITH HEADER LINE,
      ALL_BOOKINGS  LIKE BOOKINGS  OCCURS 10
                    WITH HEADER LINE.
* Filling the internal tables
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
SELECT * FROM BOOKINGS  INTO TABLE ALL_BOOKINGS.
* Exporting to the ABAP/4 Memory
EXPORT ALL_CUSTOMERS ALL_BOOKINGS
       TO MEMORY ID 'CUSTBOOK'.
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  WRITE / ALL_CUSTOMERS-NAME.
ENDLOOP.
LOOP AT ALL_BOOKINGS.
  WRITE / ALL_BOOKINGS-FLDATE.
ENDLOOP.
