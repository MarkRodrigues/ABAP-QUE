*&---------------------------------------------------------------------*
*& Chapter 11: Selecting single fields
*&---------------------------------------------------------------------*
REPORT CHAP1106.
* Work area for a database table
TABLES CUSTOMERS.
* Selecting single fields
DATA: CID   LIKE CUSTOMERS-ID,
      CNAME LIKE CUSTOMERS-NAME.
SELECT ID NAME INTO (CID,CNAME) FROM CUSTOMERS.
  WRITE: / CID, CNAME.
ENDSELECT.
