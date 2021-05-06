*&---------------------------------------------------------------------*
*& Chapter 23: External perform (caller)
*&---------------------------------------------------------------------*
REPORT CHAP2307.
* List of the current program
WRITE / 'I am program chap2307'.
* External perform
PERFORM EXTFORM IN PROGRAM CHAP2308.
