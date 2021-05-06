*&---------------------------------------------------------------------*
*& Chapter 26: Reading data from a file (presentation server)
*&---------------------------------------------------------------------*
REPORT CHAP2604.
* Data declarations for later use
PARAMETERS FILENAME(128) DEFAULT 'c:\users\default\testfile.dat'
                         LOWER CASE.
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
CALL FUNCTION 'WS_UPLOAD'
     EXPORTING
          FILENAME        = FILENAME
     TABLES
          DATA_TAB        = ALL_CUSTOMERS
     EXCEPTIONS
          FILE_OPEN_ERROR = 1
          OTHERS          = 2.
CASE SY-SUBRC.
  WHEN 1.
    WRITE 'Error when file opened'.
    EXIT.
  WHEN 2.
    WRITE 'Error during data transfer'.
    EXIT.
ENDCASE.
* Display the result
LOOP AT ALL_CUSTOMERS.
  WRITE: / ALL_CUSTOMERS-NAME,
           ALL_CUSTOMERS-CITY.
ENDLOOP.
