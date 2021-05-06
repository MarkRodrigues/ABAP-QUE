*&---------------------------------------------------------------------*
*& Chapter 24: Using Field Symbols for variable parts of fields
*&---------------------------------------------------------------------*
REPORT CHAP2402.
DATA: EXTERNAL_RECORD(4000),
      POSITION TYPE I,
      LENGTH TYPE N.
FIELD-SYMBOLS <ENTRY>.
EXTERNAL_RECORD = '0005Smith0007Edwards0005Young'.
DO.
  LENGTH = EXTERNAL_RECORD+POSITION(4).
  IF LENGTH = 0.
    EXIT.
  ENDIF.
  ADD 4 TO POSITION.
  ASSIGN EXTERNAL_RECORD+POSITION(LENGTH) TO <ENTRY>.
  WRITE <ENTRY>.
  ADD LENGTH TO POSITION.
  IF POSITION >= 4000.
    EXIT.
  ENDIF.
ENDDO.
