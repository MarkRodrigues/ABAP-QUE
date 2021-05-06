*&---------------------------------------------------------------------*
*& Chapter 4: Date and time
*&---------------------------------------------------------------------*
REPORT CHAP0405.

* Date fields are type d with the fixed length 8 and the internal
* representation YYYYMMDD (year, month, and day).
* The initial value of a date field is 00000000.
DATA TODAY TYPE D.

* The write command formats dates according to personal settings of
* the end user.
TODAY = SY-DATUM.
WRITE (10) TODAY.

* Using date fields to perform computations
DATA ULTIMO TYPE D.
* Set variable to first day of current month.
ULTIMO = SY-DATUM.
ULTIMO+6(2) = '01'.
* Set variable to last day of previous month.
SUBTRACT 1 FROM ULTIMO.
WRITE / ULTIMO.

* Time fields are type t with the fixed length 6
* and the format HHMMSS (hours, minutes, and seconds)
DATA MY_TIME TYPE T.
WRITE /(8) MY_TIME.
