*&---------------------------------------------------------------------*
*& Chapter 26: Transferring data to a file (presentation server)
*&---------------------------------------------------------------------*
REPORT CHAP2603.
* Data declarations for later use
PARAMETERS FILENAME(128) DEFAULT 'c:\users\default\testfile.dat'
                         LOWER CASE.
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Get data for file transfer
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
SORT ALL_CUSTOMERS BY CITY.
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-CITY,
           ALL_CUSTOMERS-NAME.
ENDLOOP.
* Transferring Data
CALL FUNCTION 'WS_DOWNLOAD'
     EXPORTING
          FILENAME            = FILENAME
     TABLES
          DATA_TAB            = ALL_CUSTOMERS
     EXCEPTIONS
          FILE_OPEN_ERROR     = 1
          OTHERS              = 2.
CASE SY-SUBRC.
  WHEN 1.
    WRITE 'Error when file opened'.
    EXIT.
  WHEN 2.
    WRITE 'Error during data transfer'.
    EXIT.
ENDCASE.
