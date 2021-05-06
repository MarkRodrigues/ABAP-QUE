*&---------------------------------------------------------------------*
*& Chapter 26: Reading data from a file
*&---------------------------------------------------------------------*
REPORT CHAP2602.
* Data declarations for later use
TABLES CUSTOMERS.
PARAMETERS FILENAME(128) DEFAULT '/usr/tmp/testfile.dat'
                         LOWER CASE.
DATA: MSG_TEXT(50),
      ALL_CUSTOMER_NAMES LIKE CUSTOMERS-NAME OCCURS 100
                        WITH HEADER LINE.
* Opening the File
OPEN DATASET FILENAME FOR INPUT IN TEXT MODE
                      MESSAGE MSG_TEXT.
IF SY-SUBRC NE 0.
  WRITE: 'File cannot be opened. Reason:', MSG_TEXT.
  EXIT.
ENDIF.
* Reading Data
DO.
  READ DATASET FILENAME INTO ALL_CUSTOMER_NAMES.
  IF SY-SUBRC NE 0.
    EXIT.
  ENDIF.
  APPEND ALL_CUSTOMER_NAMES.
ENDDO.
* Closing the file
CLOSE DATASET FILENAME.
* Display the result
LOOP AT ALL_CUSTOMER_NAMES.
  WRITE / ALL_CUSTOMER_NAMES.
ENDLOOP.
