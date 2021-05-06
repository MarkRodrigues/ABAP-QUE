*&---------------------------------------------------------------------*
*& Chapter 14: Importing from the ABAP/4 Memory
*&---------------------------------------------------------------------*
REPORT CHAP1402.
* Internal tables which will be imported
DATA: ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                    WITH HEADER LINE,
      ALL_BOOKINGS  LIKE BOOKINGS  OCCURS 10
                    WITH HEADER LINE,
      NEW_BOOKINGS LIKE BOOKINGS OCCURS 50
                    WITH HEADER LINE.
* Importing from the ABAP/4 Memory
IMPORT ALL_CUSTOMERS ALL_BOOKINGS
       FROM MEMORY ID 'CUSTBOOK'.
IF SY-SUBRC NE 0.
  WRITE 'Import failed.'.
ENDIF.
* Skipping and renaming objects at import
IMPORT ALL_BOOKINGS TO NEW_BOOKINGS
       FROM MEMORY ID 'CUSTBOOK'.
* Displaying the result
LOOP AT ALL_CUSTOMERS.
  WRITE / ALL_CUSTOMERS-NAME.
ENDLOOP.
LOOP AT ALL_BOOKINGS.
  WRITE / ALL_BOOKINGS-FLDATE.
ENDLOOP.
LOOP AT NEW_BOOKINGS.
  WRITE / NEW_BOOKINGS-FLDATE.
ENDLOOP.
