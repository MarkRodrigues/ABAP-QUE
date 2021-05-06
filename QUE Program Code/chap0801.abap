*&---------------------------------------------------------------------*
*& Chapter 8: Using the Basic Layout Formats
*&---------------------------------------------------------------------*
REPORT CHAP0801.

* Simple output containing the current date
WRITE: 'This is the current date:', SY-DATUM.

* Displaying fields according to their type
DATA: STRING(20),
      INT TYPE I,
      PACKED_NUMBER TYPE P DECIMALS 2,
      DATE LIKE SY-DATUM.
STRING = 'Customer list'.
INT = 17.
PACKED_NUMBER = 5 / 4.
DATE = SY-DATUM + 30.
WRITE: / STRING, INT, PACKED_NUMBER, DATE.
