*&---------------------------------------------------------------------*
*& Chapter 10: Simple form (local subroutine of a program)
*&---------------------------------------------------------------------*
REPORT CHAP1001.

* Global field of the program
DATA FLAG VALUE 'G'.
* Displaying the global field
WRITE FLAG.
* Calling a form
PERFORM SET_FLAG.
* Displaying the global field again
WRITE FLAG.

* Defining a form
FORM SET_FLAG.
* Changing and displaying the global field
  FLAG = 'L'.
  WRITE FLAG.
ENDFORM.
