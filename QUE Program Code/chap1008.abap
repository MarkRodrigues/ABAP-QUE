*&---------------------------------------------------------------------*
*& Chapter 10: Form parameters without type reference
*&---------------------------------------------------------------------*
REPORT CHAP1008.
* Variable for later use
DATA: STRING_1(2) VALUE 'AB',
      STRING_2(8) VALUE '  ABAP/4'.
* Calling forms with different actual parameters
PERFORM WRITE_FIRST_CHARACTER CHANGING: STRING_1,
                                        STRING_2.
* Form parameters without type reference
FORM WRITE_FIRST_CHARACTER CHANGING F_STRING.
  SHIFT F_STRING LEFT DELETING LEADING SPACE.
  WRITE AT (1) F_STRING.
ENDFORM.
