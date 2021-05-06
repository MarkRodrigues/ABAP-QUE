*&---------------------------------------------------------------------*
*& Chapter 10: Form parameters with generic types
*&---------------------------------------------------------------------*
REPORT CHAP1009.
* Variable for later use
DATA: SHORT_STRING(3) VALUE 'AB',
      SHORT_NUMBER(3) TYPE N VALUE '0',
      ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100.
* Calling forms with different actual parameters
* Correct call (actual paramter is of type c)
PERFORM WRITE_FIRST_CHARACTER CHANGING SHORT_STRING.
* Inccorrect call (actual paramter is not of type c)
*perform write_first_character changing short_number.
* Correct call (actual paramter is a table)
PERFORM SORT_AND_SEARCH_IN_TABLE
        CHANGING ALL_CUSTOMERS.

* Form parameters with generic types
FORM WRITE_FIRST_CHARACTER CHANGING F_STRING TYPE C.
  SHIFT F_STRING LEFT DELETING LEADING SPACE.
  WRITE AT (1) F_STRING.
ENDFORM.

FORM SORT_AND_SEARCH_IN_TABLE
     CHANGING F_TABLE TYPE TABLE.
  SORT F_TABLE.
  SEARCH F_TABLE FOR 'Smith'.
ENDFORM.
