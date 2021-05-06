*&---------------------------------------------------------------------*
*& Chapter 28: Sample program for OLE Automation
*&---------------------------------------------------------------------*
REPORT CHAP2801.
* Including OLE types
INCLUDE OLE2INCL.
* Tables and variables for later use
TABLES: CUSTOMERS.
DATA: APPLICATION TYPE OLE2_OBJECT,
      WORKBOOK    TYPE OLE2_OBJECT,
      SHEET       TYPE OLE2_OBJECT,
      CELLS       TYPE OLE2_OBJECT.
* Creating an object
CREATE OBJECT APPLICATION 'excel.application'.
IF SY-SUBRC NE 0.
   WRITE: / 'Error when opening excel.application', SY-MSGLI.
ENDIF.
* Setting properties
SET PROPERTY OF APPLICATION 'Visible' = 1.
* Calling methods
CALL METHOD OF APPLICATION 'Workbooks' = WORKBOOK.
PERFORM ERRORS.
CALL METHOD OF WORKBOOK 'Add'.
PERFORM ERRORS.
CALL METHOD OF APPLICATION 'Worksheets' = SHEET EXPORTING #1 = 1.
PERFORM ERRORS.
CALL METHOD OF SHEET 'Activate'.
PERFORM ERRORS.
PERFORM FILL_SHEET.

* Subroutine for filling the spread sheet
FORM FILL_SHEET.
  DATA: ROW_MAX TYPE I VALUE 256,
        INDEX   TYPE I.
  FIELD-SYMBOLS: <NAME>.
  SELECT * FROM CUSTOMERS.
    INDEX = ROW_MAX * ( SY-DBCNT - 1 ) + 1.
    DO 4 TIMES.
      ASSIGN COMPONENT SY-INDEX OF STRUCTURE CUSTOMERS TO <NAME>.
      CALL METHOD OF SHEET 'Cells' = CELLS
                           EXPORTING #1 = INDEX.
      SET PROPERTY OF CELLS 'Value' = <NAME>.
      ADD 1 TO INDEX.
    ENDDO.
  ENDSELECT.
ENDFORM.
* Subroutine for error handling
FORM ERRORS.
  IF SY-SUBRC NE 0.
    WRITE: / 'Error in OLE call', SY-MSGLI.
    EXIT.
  ENDIF.
ENDFORM.
