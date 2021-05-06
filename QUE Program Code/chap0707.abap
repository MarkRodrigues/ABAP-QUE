*&---------------------------------------------------------------------*
*& Chapter 7: Arithmetic Expressions and Mathematical Functions
*&---------------------------------------------------------------------*
REPORT CHAP0707.

* Self-explanatory formulas
DATA: A TYPE P, B LIKE A, X LIKE A, Y LIKE A,
      INCOME TYPE I, TAX TYPE P, NET_INCOME TYPE P,
      ALPHA TYPE P.
Y = A * X + B.
NET_INCOME = INCOME * ( 1 - TAX ).
Y = X * COS( ALPHA ).

* Arithmetic expressions
DATA: BLACK_SWANS TYPE I,
      WHITE_SWANS TYPE I.
DATA PERCENTAGE TYPE P DECIMALS 2.
PERCENTAGE = BLACK_SWANS * 100 / ( BLACK_SWANS + WHITE_SWANS ).

* Associative law
DATA: N1 TYPE P, N2 TYPE P, N3 TYPE P, N4 TYPE P, N5 TYPE P.
N5 = ( ( N1 - ( N2 / N3 ) ) * ( N4 + N1 ) / N5 ).
N5 =   ( N1 - N2   / N3 )   * ( N4 + N1 ) / N5.

* More formulas including mathematical functions
DATA: W TYPE P, D TYPE I, N TYPE P, Q TYPE I, R TYPE P.
Y = X * COS( ALPHA ).
A = 1.
W = EXP( B * LOG( A ) ).
D = N DIV Q.
