*&---------------------------------------------------------------------*
*& Chapter 7: Converting number fields
*&---------------------------------------------------------------------*
REPORT CHAP0704.

* Using numeric texts and packed numbers
DATA: NO_EMPLOYEES(4)    TYPE N,
      NO_ROOMS           TYPE P,
      EMPLOYEES_PER_ROOM TYPE P DECIMALS 2.
EMPLOYEES_PER_ROOM = NO_EMPLOYEES / NO_ROOMS.

* Rounding with integers and packed numbers
DATA: INCOME             TYPE I            VALUE '10000',
      TAX                TYPE P DECIMALS 2 VALUE '0.2',
      NET_INCOME         TYPE P DECIMALS 2,
      ROUNDED_NET_INCOME TYPE I.

NET_INCOME = INCOME * ( 1 - TAX ).
ROUNDED_NET_INCOME = INCOME * ( 1 - TAX ).
WRITE: / NET_INCOME, ROUNDED_NET_INCOME.

INCOME = '10002'.
NET_INCOME = INCOME * ( 1 - TAX ).
ROUNDED_NET_INCOME = INCOME * ( 1 - TAX ).
WRITE: / NET_INCOME, ROUNDED_NET_INCOME.
