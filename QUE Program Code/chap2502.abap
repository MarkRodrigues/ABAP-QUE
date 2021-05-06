*&---------------------------------------------------------------------*
*& Chapter 25: Syntax errors in temporary programs
*&---------------------------------------------------------------------*
REPORT CHAP2502.
* Variables for later use
DATA: SOURCE_TABLE(72) OCCURS 10 WITH HEADER LINE,
      PROGRAM_NAME LIKE SY-CPROG,
      SYNTAX_CHECK_MESSAGE(128),
      LINE_NO TYPE I.
* Building the source code
APPEND 'report test.'                        TO SOURCE_TABLE.
APPEND 'form display.'                       TO SOURCE_TABLE.
APPEND 'write ''I am a temporary program''.' TO SOURCE_TABLE.
APPEND 'endform'                             TO SOURCE_TABLE.
* Generating the temporary program, checking syntax errors
GENERATE SUBROUTINE POOL SOURCE_TABLE
                         NAME    PROGRAM_NAME
                         MESSAGE SYNTAX_CHECK_MESSAGE
                         LINE    LINE_NO.
IF SY-SUBRC NE 0.
  WRITE: / 'Syntax error, message', SYNTAX_CHECK_MESSAGE,
         / 'in line', LINE_NO.
  EXIT.
ENDIF.
* Calling a form externally
PERFORM DISPLAY IN PROGRAM (PROGRAM_NAME).
