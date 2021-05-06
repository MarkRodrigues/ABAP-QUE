*&---------------------------------------------------------------------*
*& Chapter 9: Internal flow of control (if, case, do, while)
*&---------------------------------------------------------------------*
REPORT CHAP0902.

* Declarations for later use
TABLES CUSTOMERS.
DATA: COLOR(10) VALUE 'yellow',
      N(4) TYPE N VALUE '123',
      P TYPE P,
      C4(4) VALUE '124',
      C5(5) VALUE '00124',
      SQUARE_NUMBER TYPE I,
      X TYPE I,
      Y TYPE I.

* Using a condition (e.g., business class or not)
IF CUSTOMERS-CUSTTYPE = 'B'.
* book business class
  WRITE 'B'.
ELSE.
* book economy class
  WRITE 'Something else'.
ENDIF.

* Nested if clauses
IF N > 0.
  N = N + 1.
ELSE.
  IF N = 0.
    WRITE / 'zero'.
  ELSE.
    N = N - 1.
  ENDIF.
ENDIF.

* Using elseif instead of a nested if clauses
IF N > 0.
  N = N + 1.
ELSEIF N = 0.
  WRITE / 'zero'.
ELSE.
  N = N - 1.
ENDIF.

* Using a case clause
CASE COLOR.
  WHEN 'red'.    WRITE 'color is red'.
  WHEN 'green'.  WRITE 'color is green'.
  WHEN 'yellow'. WRITE 'color is yellow'.
  WHEN OTHERS.   WRITE 'non-standard color'.
ENDCASE.

* Some logical expressions in if clauses
IF N IS INITIAL.
  WRITE 'initial'.
ELSEIF N LT 0
    OR N GT 5.
  WRITE / 'less than zero or greater than 5'.
ELSE.
  WRITE / 'something else'.
ENDIF.

IF N > P.
  WRITE / 'n is greater than p'.
ENDIF.

* Conversion in an expression
IF C4 = C5.
  WRITE / 'c4 and c5 are equal'.
ENDIF.

* Comparing character strings
DATA: A(6) VALUE 'ABAP/4',
      RESULT(6).
IF A CA 'XP'.
  RESULT = A+SY-FDPOS(2).
  WRITE / RESULT.
ENDIF.

IF A CO 'ABP'.
  WRITE / 'a only contains A,B, and P'.
ENDIF.

IF A CS 'BAP'.
  WRITE / 'a contains the string BAP'.
ENDIF.

IF A CP '*AP++'.
  WRITE / 'a contains AP followed by two more characters'.
ENDIF.

* Unconditional loop
DO 100 TIMES.
  SQUARE_NUMBER = SY-INDEX ** 2.
  WRITE / SQUARE_NUMBER.
ENDDO.

* Terminating a loop
DO.
* terminate loop after 5 steps or when the color is red
  IF SY-INDEX > 5 OR COLOR = 'red'. EXIT. ENDIF.
* main loop step
  WRITE / SY-INDEX.
ENDDO.

* Using a conditional loop.
X = Y - 2.
WHILE X <> Y.
  X = Y + 1.
  WRITE / X.
  IF X > Y. EXIT. ENDIF.
ENDWHILE.
