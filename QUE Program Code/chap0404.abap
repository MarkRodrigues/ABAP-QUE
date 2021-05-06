*&---------------------------------------------------------------------*
*& Chapter 4: Numbers
*&---------------------------------------------------------------------*
REPORT CHAP0404.

* Fields of type i (integer) are mainly used for counting
DATA: CUSTOMER_NUMBER TYPE I,
      LOOP_COUNTER TYPE I.
* Integers have a fixed length of 4 bytes.
* The initial value is zero, if it is not specified explicitly.
DATA WORD_LENGTH TYPE I VALUE 17.

* Packed numbers (type p) are a way to store numbers internally
* in a compressed form. Therefore, they cover a wide range of possible
* values can be used for all kinds of computations.
DATA NUMBER_OF_MOSQUITOES TYPE P.

* Decimal handling is supported for packed numbers
DATA AIRBAG_PRICE TYPE P DECIMALS 2 VALUE '333.22'.
WRITE / AIRBAG_PRICE.

* Default length of type p fields is 8, and the maximum length is 16,
* which can represent numbers of up to 31 digits plus the sign
DATA: PACKED_NORMAL TYPE P,
      PACKED_16(16) TYPE P.

* Floating point numbers (type f) occur in complex arithmetic
* operations. Possible values range from 1E~-307 to 1E307.
* The standard output length of fields of type f is 22.
DATA AGE_OF_EARTH TYPE F VALUE '123E+8'.
WRITE / AGE_OF_EARTH.

* The values of floating point numbers can be represented in
* different ways, but they are all equivalent:
DATA: F1 TYPE F,
      F2 TYPE F,
      F3 TYPE F.
F1 = 1.
F2 = '-12.34567'.
F3 = '-765E04'.
