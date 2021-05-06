*&---------------------------------------------------------------------*
*& Chapter 10: Local data in a form
*&---------------------------------------------------------------------*
REPORT CHAP1002.

* Global field of the program
DATA FLAG VALUE 'G'.
* Displaying the global field
WRITE FLAG.
* Calling a form
PERFORM WRITE_FLAG.
* Displaying the global field again
WRITE FLAG.

* Defining a form with local data
FORM WRITE_FLAG.
* Local data
  DATA L_FLAG.
* Changing and displaying local data
  L_FLAG = 'L'.
  WRITE L_FLAG.
ENDFORM.
