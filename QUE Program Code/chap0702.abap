*&---------------------------------------------------------------------*
*& Chapter 7: Simple examples of field conversion
*&---------------------------------------------------------------------*
REPORT CHAP0702.

* Converting to numbers during computations
DATA: NUMBER_1(4) VALUE '1771',
      NUMBER_2(3),
      RESULT TYPE I.

NUMBER_2 = '005'.
RESULT = NUMBER_1 + NUMBER_2.
WRITE / RESULT.

NUMBER_2 = '  5'.
RESULT = NUMBER_1 + NUMBER_2.
WRITE / RESULT.

* Padding character fields with blanks
DATA: OLD_CUSTOMER_NAME(10) VALUE 'Edison',
      NEW_CUSTOMER_NAME(25).
MOVE OLD_CUSTOMER_NAME TO NEW_CUSTOMER_NAME.
WRITE / NEW_CUSTOMER_NAME.

* Calculating dates
DATA: ANY_DATE TYPE D,
      SAME_DAY_OF_NEXT_WEEK TYPE D.

ANY_DATE = '19991231'.
SAME_DAY_OF_NEXT_WEEK = ANY_DATE + 7.
WRITE / SAME_DAY_OF_NEXT_WEEK.

ANY_DATE = '20000228'.
SAME_DAY_OF_NEXT_WEEK = ANY_DATE + 7.
WRITE / SAME_DAY_OF_NEXT_WEEK.
