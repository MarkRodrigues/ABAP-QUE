*&---------------------------------------------------------------------*
*& Chapter 10: Classifying parameters
*&---------------------------------------------------------------------*
REPORT CHAP1005.

* Data declarations for later use
DATA: A1 TYPE P VALUE 2,
      A2 TYPE P VALUE 4,
      A3 TYPE P VALUE 8.
* Calling a form with different parameter types
PERFORM CALC USING    A1
                      A2
             CHANGING A3.
* Displaying the result
WRITE A3.
* Defining a form with different parameter types
FORM CALC USING    VALUE(F1) LIKE A1
                         F2  LIKE A2
          CHANGING VALUE(F3) LIKE A3.
   F3 = F1 + ( F2 * F3 ).
ENDFORM.
