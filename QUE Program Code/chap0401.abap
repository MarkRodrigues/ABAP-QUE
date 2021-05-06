*&---------------------------------------------------------------------*
*& Chapter 4: Three approaches to define data objects
*&---------------------------------------------------------------------*
REPORT CHAP0401.

* 1. Elementary types
DATA: CUSTOMER_NAME_1(25) TYPE C,
      VENDOR_NAME_1(25)   TYPE C.

* 2. Reference to an existing field
DATA: CUSTOMER_NAME_2(25) TYPE C,
      VENDOR_NAME_2 LIKE CUSTOMER_NAME_2.

* 3. Reference to a non-elementary type
TYPES T_NAME(25) TYPE C.
DATA: CUSTOMER_NAME_3 TYPE T_NAME,
      VENDOR_NAME_3   TYPE T_NAME.
