*&---------------------------------------------------------------------*
*& Chapter 1: How to define types and data objects                     *
*&---------------------------------------------------------------------*
REPORT CHAP0101.

* Elementary type character, length 20
DATA CUSTOMER_NAME(25) TYPE C.

* Non-elementary type
TYPES T_NAME(25) TYPE C.
DATA NEW_CUSTOMER_NAME TYPE T_NAME.

* Reference to a data object
DATA VENDOR_NAME LIKE CUSTOMER_NAME.

* Record
DATA: BEGIN OF BOOKING,
        ID(4) TYPE C,
        FLIGHT_DATE TYPE D,
        NAME LIKE CUSTOMER_NAME,
      END OF BOOKING.

* Internal table
DATA BOOKING_TABLE LIKE BOOKING OCCURS 100.
