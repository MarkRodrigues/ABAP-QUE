*&---------------------------------------------------------------------*
*& Chapter 24: Working with Field Symbols
*&---------------------------------------------------------------------*
REPORT CHAP2401.
* Defining a Field Symbol
FIELD-SYMBOLS <FS>.
* Variable for later use
DATA FIELD VALUE 'X'.
* Assigning a field to a Field Symbol
ASSIGN FIELD TO <FS>.
* Using a Field Symbol which has an assigned field
WRITE <FS>.
