*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic external perform (call back form)
*&---------------------------------------------------------------------*
REPORT CHAP2309.
PERFORM EXTFORM IN PROGRAM CHAP2310
        USING 'CALL_BACK_FORM'
              SY-CPROG.
FORM CALL_BACK_FORM.
   WRITE / 'I am the call back form in chap2309.'.
ENDFORM.
