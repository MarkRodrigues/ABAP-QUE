*&---------------------------------------------------------------------*
*& Chapter 8: Setting the layout position of fields
*&---------------------------------------------------------------------*
REPORT CHAP0804.

DATA: POS TYPE I,
      LEN TYPE I.

WRITE AT 5 'position 5'.
POS = 20.
WRITE AT POS 'position 20'.
POSITION 40.
WRITE 'position 40'.

POS = 10. LEN = 20.
NEW-LINE.
WRITE AT POS(LEN) 'position 10, length 20'.
