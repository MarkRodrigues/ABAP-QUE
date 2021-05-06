*&---------------------------------------------------------------------*
*& Chapter 8: Type-Specific Output Options
*&---------------------------------------------------------------------*
REPORT CHAP0808.

* Specifying a format template
DATA TIME TYPE T VALUE '154633'.
WRITE AT (8) TIME USING EDIT MASK '__:__:__'.

* Using decimals
DATA PACKED_NUMBER TYPE P VALUE 123.
WRITE PACKED_NUMBER DECIMALS 2.
