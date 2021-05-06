*&---------------------------------------------------------------------*
*& Chapter 4: Character types
*&---------------------------------------------------------------------*
REPORT CHAP0403.

* Type c is the default type when no type is specified.
* Initial value is space, if it is not specified explicitly.
DATA: NAME(25) TYPE C,
      CITY(25),
      FLAG,
      SINGLE_CHARACTER VALUE 'A'.

* If the field and the initial value have different lengths, the
* initial value is either truncated or padded with blanks on the right:
DATA LANGUAGE(2) VALUE 'ABAP/4'.
WRITE / LANGUAGE.

* Maximum length 64KB
DATA MAX_CHARACTER_FIELD(65535).

* Variables of type n (numeric texts) contain strings of digits
DATA CUSTOMER_ID(8) TYPE N VALUE '87654321'.

* The default length for a field of type n is 1,
* and the default initial value is a string of zeros
DATA ZIP_CODE(5) TYPE N.
WRITE / ZIP_CODE.

* Type n fields pad the left side with zeroes
CUSTOMER_ID = '1234'.
WRITE / CUSTOMER_ID.
