*&---------------------------------------------------------------------*
*& Chapter 26: Transferring data to a file
*&---------------------------------------------------------------------*
REPORT CHAP2601.
* Data declarations for later use
PARAMETERS FILENAME(128) DEFAULT '/usr/tmp/testfile.dat'
                         LOWER CASE.
TABLES CUSTOMERS.
DATA MSG_TEXT(50).
* Get data for file transfer
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
SORT ALL_CUSTOMERS BY CITY.
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-CITY,
           ALL_CUSTOMERS-NAME.
ENDLOOP.
* Opening the File
OPEN DATASET FILENAME FOR OUTPUT IN TEXT MODE
                      MESSAGE MSG_TEXT.
IF SY-SUBRC NE 0.
  WRITE: 'File cannot be opened. Reason:', MSG_TEXT.
  EXIT.
ENDIF.
* Transferring Data
LOOP AT ALL_CUSTOMERS.
  TRANSFER ALL_CUSTOMERS-NAME TO FILENAME.
ENDLOOP.
* Closing the File
CLOSE DATASET FILENAME.
