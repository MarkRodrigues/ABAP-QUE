*&---------------------------------------------------------------------*
*& Chapter 10: Calling a function
*&---------------------------------------------------------------------*
REPORT CHAP1010.
* Variable for later use
DATA: X TYPE I VALUE 5,
      Y LIKE X VALUE 7,
      MAXIMUM LIKE X.
* Calling a function
CALL FUNCTION 'MAX_TEST'
     EXPORTING
          A       = X
          B       = Y
     IMPORTING
          MAX     = MAXIMUM.
WRITE MAXIMUM.
