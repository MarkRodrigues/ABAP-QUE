*&---------------------------------------------------------------------*
*& Chapter 4: Types, data, constants
*&---------------------------------------------------------------------*
REPORT CHAP0402.

* Type flag defines an abstract type
TYPES FLAG TYPE C.

* Field address_flag will allocate space in main memory at runtime
DATA ADDRESS_FLAG TYPE FLAG VALUE 'X'.

* Constants are defined like fields and cannot be changed
CONSTANTS: COMPANY_NAME(3) TYPE C VALUE 'SAP',
           MAX_COUNTER TYPE I VALUE 9999.

* Using constants to define initial values
DATA COUNTER TYPE I VALUE MAX_COUNTER.
