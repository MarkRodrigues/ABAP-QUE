*&---------------------------------------------------------------------*
*& Chapter 11: Getting statistical information
*&---------------------------------------------------------------------*
REPORT CHAP1107.
* Work area for a database table
TABLES: BOOKINGS, ACTFLI.
* Variables for later use
DATA: COUNT_BOOKINGS TYPE I,
      AVERAGE_SEATS_OCCUPIED LIKE ACTFLI-SEATSOCC,
      MAX_SEATS              LIKE ACTFLI-SEATSMAX.
* Getting the number of selected entries
SELECT COUNT(*) FROM BOOKINGS INTO COUNT_BOOKINGS
       WHERE ORDER_DATE >= '19990101'.
WRITE COUNT_BOOKINGS.
* Average and maximum
SELECT AVG( SEATSOCC ) MAX( SEATSMAX ) FROM ACTFLI
       INTO (AVERAGE_SEATS_OCCUPIED,MAX_SEATS).
WRITE: / AVERAGE_SEATS_OCCUPIED, MAX_SEATS.
