*&---------------------------------------------------------------------*
*& Chapter 7: Converting character fields
*&---------------------------------------------------------------------*
REPORT CHAP0703.

* Truncating fields or padding with blanks
DATA: SHORT_NAME(8),
      LONG_NAME(16).
MOVE 'Washington' TO: SHORT_NAME, LONG_NAME.
WRITE: / SHORT_NAME, LONG_NAME.

* Take care of intermediate steps
LONG_NAME = SHORT_NAME = 'Washington'.
WRITE: / SHORT_NAME, LONG_NAME.
