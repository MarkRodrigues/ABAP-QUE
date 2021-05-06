*&---------------------------------------------------------------------*
*& Chapter 10: Using static variables
*&---------------------------------------------------------------------*
REPORT CHAP1003.
* Calling a form twice
PERFORM COUNT.
PERFORM COUNT.
* Defining a form with a static variable
FORM COUNT.
  STATICS CALLS TYPE I.
  CALLS = CALLS + 1.
  WRITE CALLS.
ENDFORM.
