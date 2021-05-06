*&---------------------------------------------------------------------*
*& Chapter 17: Clicking on a hotspot area
*&---------------------------------------------------------------------*
REPORT CHAP1702.
* work area
TABLES CUSTOMERS.
* Processing data
START-OF-SELECTION.
  SELECT * FROM CUSTOMERS.
    WRITE / CUSTOMERS-NAME HOTSPOT ON.
  ENDSELECT.
* Single click
AT LINE-SELECTION.
  WRITE 'New list after single-click on a hotspot area'.
