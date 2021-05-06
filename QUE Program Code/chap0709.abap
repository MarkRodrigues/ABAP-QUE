*&---------------------------------------------------------------------*
*& Chapter 7: Special conversions
*&---------------------------------------------------------------------*
REPORT CHAP0709.

* Converting type c to type n
DATA: SCN(4) VALUE '12x4',
      T1CN(2) TYPE N,
      T2CN(6) TYPE N.
MOVE: SCN TO T1CN,
      SCN TO T2CN.

* Converting type n to type c
DATA: SNC(4) TYPE N VALUE '0124',
      T1NC(2),
      T2NC(6).
MOVE: SNC TO T1NC,
      SNC TO T2NC.

* Converting type n to type p
DATA: SNP(6) TYPE N VALUE '012345',
      T1NP(10) TYPE P,
      T2NP(2) TYPE P.
MOVE  SNP TO T1NP.
*move snp to t2np. "This produces a runtime error when activated!

* Converting type p to type n
DATA: SPN(4) TYPE P VALUE 124,
      T1PN(2) TYPE N,
      T2PN(6) TYPE N.
MOVE: SPN TO T1PN,
      SPN TO T2PN.

WRITE 'Program finished'.
