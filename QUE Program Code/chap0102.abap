*&---------------------------------------------------------------------*
*& Chapter 1: A Few Simple Examples                                    *
*&---------------------------------------------------------------------*
REPORT CHAP0102.

* Copying the content of one data object to another
DATA: SOURCE(10) TYPE C,
      TARGET LIKE SOURCE.
MOVE SOURCE TO TARGET.

* Displaying the contents of fields
WRITE 'ABAP/4 is easy.'.
NEW-LINE.
WRITE 'This text is displayed on a new line.'.
WRITE / 'After the symbol /, text also appears on a new line.'.

* Standard control structures (conditions and loops)
IF SOURCE = TARGET.
  WRITE / 'Fields source and target have the same content'.
ELSE.
  WRITE / 'Fields source and target do not have the same content'.
ENDIF.

DO 3 TIMES.
  WRITE / SY-INDEX.
ENDDO.

* Local subroutine of a single program
DATA: A1 TYPE I,
      A2 TYPE I.
PERFORM CALC USING    A1
             CHANGING A2.
WRITE / A2.
FORM CALC USING    F1 LIKE A1
          CHANGING F2 LIKE A2.
   F2 = F1 + ( F2 * 17 ).
ENDFORM.

* Event for drill-down facilities (reacts when a user selects a line)
AT LINE-SELECTION.
  WRITE 'This is displayed after double-clicking a line'.
