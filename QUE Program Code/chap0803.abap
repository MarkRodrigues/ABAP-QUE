*&---------------------------------------------------------------------*
*& Chapter 8: Skipping lines
*&---------------------------------------------------------------------*
REPORT CHAP0803.

WRITE 'This string will appear on the first line.'.
NEW-LINE.
WRITE: 'New line',
     / 'Yet another line'.
SKIP 3.
WRITE / 'skip 3 produces three empty lines.'.
