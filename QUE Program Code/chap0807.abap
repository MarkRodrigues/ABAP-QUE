*&---------------------------------------------------------------------*
*& Chapter 8: Using colors
*&---------------------------------------------------------------------*
REPORT CHAP0807.

* Display the header using an appropriate color (grayish blue)
WRITE 'Header' COLOR COL_HEADING.

* Switch the standard color
FORMAT COLOR COL_TOTAL.

* Make the color less bright
WRITE / 'total sum' COLOR COL_TOTAL INTENSIFIED OFF.

* Using different colors
FORMAT COLOR COL_HEADING.
WRITE / 'Header'.
FORMAT COLOR OFF.
SKIP.
WRITE: / 'Key field' COLOR COL_KEY,
         'Background',
         'Negative' COLOR COL_NEGATIVE,
       / 'Total sum' COLOR COL_TOTAL INTENSIFIED OFF.
