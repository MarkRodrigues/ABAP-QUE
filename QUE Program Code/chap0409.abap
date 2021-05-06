*&---------------------------------------------------------------------*
*& Chapter 4: Using system fields
*&---------------------------------------------------------------------*
REPORT CHAP0409.

WRITE: / 'Current date',        SY-DATUM,
       / 'Current table index', SY-TABIX,
       / 'Loop counter',        SY-INDEX,
       / 'System return code',  SY-SUBRC.
