*&---------------------------------------------------------------------*
*& Chapter 7: Copying fields
*&---------------------------------------------------------------------*
REPORT CHAP0701.

* move fields
DATA: NAME(25),
      COUNTER TYPE I.
DATA: SOURCE LIKE NAME,
      TARGET LIKE SOURCE.
MOVE: 'Edison' TO NAME,
      17 TO COUNTER.
MOVE SOURCE TO TARGET.

* Using the compute command (keyword can be omitted)
COMPUTE TARGET = SOURCE.
TARGET = SOURCE.

* Concatenating compute commands
DATA: PHONE_1 LIKE SOURCE,
      PHONE_2 LIKE PHONE_1,
      PHONE_3 LIKE PHONE_2,
      PHONE_4 LIKE PHONE_3.
PHONE_4 = PHONE_3 = PHONE_2 = PHONE_1 = SOURCE.
