*&---------------------------------------------------------------------*
*& Chapter 10: Type check for form parameters
*&---------------------------------------------------------------------*
REPORT CHAP1007.
* Types and variables for later use
TYPES: T_NAME_1(20),
       T_NAME_2(20).
DATA: NAME_1 TYPE T_NAME_1,
      NAME_2 TYPE T_NAME_2.
* Calling forms with different actual parameters
PERFORM SET_NAME_LIKE CHANGING NAME_1.
PERFORM SET_NAME_LIKE CHANGING NAME_2.
PERFORM SET_NAME_TYPE CHANGING NAME_1.
PERFORM SET_NAME_TYPE CHANGING NAME_2.
* Form definition with type reference via like
FORM SET_NAME_LIKE CHANGING F_NAME LIKE NAME_2.
  F_NAME = 'Smith'.
ENDFORM.
* Form definition with type reference via type
FORM SET_NAME_TYPE CHANGING F_NAME TYPE T_NAME_2.
  F_NAME = 'Smith'.
ENDFORM.
