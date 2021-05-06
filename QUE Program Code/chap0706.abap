*&---------------------------------------------------------------------*
*& Chapter 7: Copying structured objects
*&---------------------------------------------------------------------*
REPORT CHAP0706.

* Using move-corresponding to copy fields with the same name
DATA: BEGIN OF MY_CUSTOMER,
        ID(8) TYPE N,
        NAME(25),
        CITY(25),
      END OF MY_CUSTOMER,
      BEGIN OF CITY_OF_CUSTOMER,
        CITY LIKE MY_CUSTOMER-CITY,
        TEXT(30),
        ID LIKE MY_CUSTOMER-ID,
      END OF CITY_OF_CUSTOMER.

MY_CUSTOMER-ID = '87654321'.
CITY_OF_CUSTOMER-TEXT = 'Old text'.
MOVE-CORRESPONDING MY_CUSTOMER TO CITY_OF_CUSTOMER.
WRITE: / 'Changed ID',     CITY_OF_CUSTOMER-ID,
       / 'Unchanged text', CITY_OF_CUSTOMER-TEXT.

* Using the move command for structures
DATA: CURRENT_CUSTOMER LIKE MY_CUSTOMER,
      BEGIN OF PREVIOUS_CUSTOMER,
        IDENTIFIER LIKE MY_CUSTOMER-ID,
        NAME       LIKE MY_CUSTOMER-NAME,
        CITY       LIKE MY_CUSTOMER-CITY,
      END OF PREVIOUS_CUSTOMER.
CURRENT_CUSTOMER-ID = '12345678'.
MOVE CURRENT_CUSTOMER TO PREVIOUS_CUSTOMER.
WRITE: / 'Changed ID', PREVIOUS_CUSTOMER-IDENTIFIER.

* Copying complete internal tables
TYPES: BEGIN OF TABLE_LINE,
         FIELD_1,
         FIELD_2 TYPE I,
       END OF TABLE_LINE.
DATA: SOURCE_TABLE TYPE TABLE_LINE OCCURS 100,
      TARGET_TABLE TYPE TABLE_LINE OCCURS 50.
MOVE SOURCE_TABLE TO TARGET_TABLE.
