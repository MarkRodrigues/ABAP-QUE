*&---------------------------------------------------------------------*
*& Chapter 18: Displaying the selection screen
*&---------------------------------------------------------------------*
REPORT CHAP1803.
* Work area
TABLES CUSTOMERS.
* Selection criteria
SELECT-OPTIONS S_NAME FOR CUSTOMERS-NAME.
* running chap1801 and displaying the selection screen
SUBMIT CHAP1801
       VIA SELECTION-SCREEN
       WITH P_DATE = SY-DATUM
       WITH S_NAME IN S_NAME.
