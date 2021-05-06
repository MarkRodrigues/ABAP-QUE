*&---------------------------------------------------------------------*
*& Chapter 17: Pop-up Screens
*&---------------------------------------------------------------------*
REPORT CHAP1703.
* work area
TABLES CUSTOMERS.
* Processing data
START-OF-SELECTION.
  SELECT * FROM CUSTOMERS.
    WRITE / CUSTOMERS-NAME HOTSPOT ON.
  ENDSELECT.
* Single click
AT LINE-SELECTION.
  WINDOW STARTING AT 10 10
         ENDING   AT 40 20.
  WRITE 'This is my first window'.
