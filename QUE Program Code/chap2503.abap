*&---------------------------------------------------------------------*
*& Chapter 25: A real life example for using a temporary program
*&---------------------------------------------------------------------*
REPORT CHAP2503.
* Variables for later use
PARAMETERS TABNAME(10) DEFAULT 'CUSTOMERS'.
DATA: SOURCE_TABLE(72) OCCURS 100 WITH HEADER LINE,
      PROGRAM_NAME LIKE SY-CPROG,
      SYNTAX_CHECK_MESSAGE(128),
      LINE_NO TYPE I.
* Building the source code
PERFORM BUILD_THE_SOURCE_CODE USING TABNAME.
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
PERFORM DISPLAY_TABLE IN PROGRAM (PROGRAM_NAME).
* Form to build the source code of the temporary program
FORM BUILD_THE_SOURCE_CODE USING F_NAME.
APPEND:
'report ztmpprog.                  ' TO SOURCE_TABLE,
'tables                            ' TO SOURCE_TABLE,
        F_NAME                       TO SOURCE_TABLE,
'.                                 ' TO SOURCE_TABLE,
'field-symbols <output>.           ' TO SOURCE_TABLE,
'form display_table.               ' TO SOURCE_TABLE,
'select * from                     ' TO SOURCE_TABLE,
               F_NAME                TO SOURCE_TABLE,
'.                                 ' TO SOURCE_TABLE,
'  new-line.                       ' TO SOURCE_TABLE,
'  do.                             ' TO SOURCE_TABLE,
'    assign component sy-index     ' TO SOURCE_TABLE,
'           of structure           ' TO SOURCE_TABLE,
            F_NAME                   TO SOURCE_TABLE,
'           to <output>.           ' TO SOURCE_TABLE,
'    if sy-subrc ne 0. exit. endif.' TO SOURCE_TABLE,
'    write <output>.               ' TO SOURCE_TABLE,
'  enddo.                          ' TO SOURCE_TABLE,
'endselect.                        ' TO SOURCE_TABLE,
'endform.                          ' TO SOURCE_TABLE.
ENDFORM.
