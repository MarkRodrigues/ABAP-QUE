*&---------------------------------------------------------------------*
*& Chapter 17: Tabular lists
*&---------------------------------------------------------------------*
REPORT CHAP1706 NO STANDARD PAGE HEADING.
CONSTANTS MY_LINE_SIZE TYPE I VALUE 40.
DATA SQUARE TYPE I.
NEW-PAGE LINE-SIZE MY_LINE_SIZE.
ULINE.
FORMAT COLOR COL_HEADING.
WRITE: / SY-VLINE,
         'Numbers and their squares',
         AT MY_LINE_SIZE SY-VLINE.
FORMAT COLOR OFF.
ULINE.
DO 20 TIMES.
  SQUARE = SY-INDEX ** 2.
  WRITE: / SY-VLINE,
           SY-INDEX COLOR COL_KEY,
           SY-VLINE,
           SQUARE,
         AT MY_LINE_SIZE SY-VLINE.
ENDDO.
ULINE.
