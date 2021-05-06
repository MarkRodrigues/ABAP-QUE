*&---------------------------------------------------------------------*
*& Chapter 24: Using Field Symbols for components of a structure
*&---------------------------------------------------------------------*
REPORT CHAP2403.
* Table work area for later use
TABLES CUSTOMERS.
* Defining a Field Symbol
FIELD-SYMBOLS <OUTPUT>.
* Displaying all fields of all table entries
SELECT * FROM CUSTOMERS.
  NEW-LINE.
  DO.
    ASSIGN COMPONENT SY-INDEX OF STRUCTURE CUSTOMERS TO <OUTPUT>.
    IF SY-SUBRC <> 0.
      EXIT.
    ENDIF.
    WRITE <OUTPUT>.
  ENDDO.
ENDSELECT.
