*&---------------------------------------------------------------------*
*& Chapter 4: Hexadecimal (or binary) data                             *
*&---------------------------------------------------------------------*
REPORT CHAP0406.

* Hexadecimal (or binary) data is stored in fields of type x.
* A type x field of length n contains 2n digits
* and its output length is also equal to 2n.
* For example, the bit stream 1111000010001001 can be defined as
* follows (remind that 1111 = F, 0000 = 0, 1000 = 8, 1001 = 9):
DATA XSTRING(2) TYPE X VALUE 'F089'.
