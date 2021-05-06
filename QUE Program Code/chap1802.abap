*&---------------------------------------------------------------------*
*& Chapter 18: Running a report
*&---------------------------------------------------------------------*
REPORT CHAP1802.
* Work area
TABLES CUSTOMERS.
* Selection criteria
SELECT-OPTIONS S_NAME FOR CUSTOMERS-NAME.
* Running report chap1801 with specified selection criteria
SUBMIT CHAP1801
       WITH P_DATE = SY-DATUM
       WITH S_NAME IN S_NAME.
