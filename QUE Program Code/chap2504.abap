*&---------------------------------------------------------------------*
*& Chapter 25: Generating a persistent program
*&---------------------------------------------------------------------*
REPORT CHAP2504.
* Internal table for source code, field for name of temporary program
DATA: SOURCE_TABLE(72) OCCURS 10 WITH HEADER LINE,
      PROGRAM_NAME LIKE SY-CPROG.
* Building the source code
APPEND 'report zgenprog.'                    TO SOURCE_TABLE.
APPEND 'write ''I am a generated program''.' TO SOURCE_TABLE.
* Insert the report, if necessary
READ REPORT 'zgenprog' INTO SOURCE_TABLE.
IF SY-SUBRC NE 0.
  APPEND 'report zgenprog.'            TO SOURCE_TABLE.
  APPEND 'write ''Here is zgenprog''.' TO SOURCE_TABLE.
  INSERT REPORT 'zgenprog' FROM SOURCE_TABLE.
ENDIF.
* Execute the report
SUBMIT ZGENPROG AND RETURN.
