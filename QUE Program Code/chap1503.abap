*&---------------------------------------------------------------------*
*& Chapter 15: Using the events start-of-selection and end-of-selection
*&---------------------------------------------------------------------*
REPORT CHAP1503.
* Work area
TABLES BOOKINGS.
* Initial processing
START-OF-SELECTION.
  WRITE / 'Start'.
* Reading data
GET BOOKINGS.
  WRITE: AT /3 BOOKINGS-FLDATE.
* Final processing
END-OF-SELECTION.
  WRITE / 'Finished'.
