*&---------------------------------------------------------------------*
*& Chapter 10: Using interface parameters of a form
*&---------------------------------------------------------------------*
REPORT CHAP1004.

* Types and data for later use
TYPES: T_NAME(20).
DATA: NAME_1 TYPE T_NAME VALUE 'A',
      NAME_2 TYPE T_NAME VALUE 'B'.
* Calling a form with different parameters
PERFORM SET_NAME CHANGING NAME_1.
PERFORM SET_NAME CHANGING NAME_2.
* Defining a form with a parameter
FORM SET_NAME
     CHANGING F_NAME TYPE T_NAME.
  WRITE F_NAME.
  F_NAME = 'Smith'.
  WRITE F_NAME.
ENDFORM.
