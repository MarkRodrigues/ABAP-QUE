*&---------------------------------------------------------------------*
*& Chapter 7: Converting date fields
*&---------------------------------------------------------------------*
REPORT CHAP0705.

* Using the built-in calendar
DATA: RECEIVING_DATE       TYPE D,
      LAST_ADMISSIBLE_DATE TYPE D.

RECEIVING_DATE = '19980223'.
LAST_ADMISSIBLE_DATE = RECEIVING_DATE + 10.
WRITE / LAST_ADMISSIBLE_DATE.

RECEIVING_DATE = '19980305'.
LAST_ADMISSIBLE_DATE = RECEIVING_DATE + 10.
WRITE / LAST_ADMISSIBLE_DATE.

RECEIVING_DATE = '20000223'.
LAST_ADMISSIBLE_DATE = RECEIVING_DATE + 10.
WRITE / LAST_ADMISSIBLE_DATE.
