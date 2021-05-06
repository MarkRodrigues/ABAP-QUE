*&---------------------------------------------------------------------*
*& Chapter 8: Customizing pages
*&---------------------------------------------------------------------*

* suppress the standard header of a page
REPORT CHAP0802 NO STANDARD PAGE HEADING..

* Define a counter for the output page
DATA COUNTER(9) TYPE N.

* Start a new page and set the line size
NEW-PAGE LINE-SIZE 44.

* Display the counter 40 times
DO 40 TIMES.
  COUNTER = SY-INDEX.
  WRITE COUNTER.
ENDDO.
