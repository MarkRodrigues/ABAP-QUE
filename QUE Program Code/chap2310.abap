*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic external perform
*&---------------------------------------------------------------------*
REPORT CHAP2310.
FORM EXTFORM
     USING F_CALL_BACK_FORM
           F_PROGRAM.
  PERFORM (F_CALL_BACK_FORM) IN PROGRAM (F_PROGRAM).
  WRITE / 'I am the form in chap2310.'.
ENDFORM.
