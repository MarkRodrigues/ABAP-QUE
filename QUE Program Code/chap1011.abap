*&---------------------------------------------------------------------*
*& Chapter 10: Recursive calls
*&---------------------------------------------------------------------*
REPORT CHAP1011.
* Variable for later use
DATA: NUMBER TYPE I VALUE 5,
      RESULT TYPE I VALUE 1.
* Calling a form from the main program
PERFORM FACTORIAL.
WRITE RESULT.
* Defining a form with a recursive call
FORM FACTORIAL.
  IF NUMBER <= 1.
    EXIT.
  ENDIF.
  RESULT = RESULT * NUMBER.
  NUMBER = NUMBER - 1.
  PERFORM FACTORIAL.
ENDFORM.
