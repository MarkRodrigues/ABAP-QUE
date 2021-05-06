*&---------------------------------------------------------------------*
*& Chapter 25: Working with temporary programs
*&---------------------------------------------------------------------*
REPORT CHAP2501.
* Internal table for source code, field for name of temporary program
DATA: SOURCE_TABLE(72) OCCURS 10 WITH HEADER LINE,
      PROGRAM_NAME LIKE SY-CPROG.
* Building the source code
APPEND 'report test.'                        TO SOURCE_TABLE.
APPEND 'form display.'                       TO SOURCE_TABLE.
APPEND 'write ''I am a temporary program''.' TO SOURCE_TABLE.
APPEND 'endform.'                            TO SOURCE_TABLE.
* Generating the temporary program
GENERATE SUBROUTINE POOL SOURCE_TABLE NAME PROGRAM_NAME.
* Calling a form externally
PERFORM DISPLAY IN PROGRAM (PROGRAM_NAME).
