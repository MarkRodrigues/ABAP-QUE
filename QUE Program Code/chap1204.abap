*&---------------------------------------------------------------------*
*& Chapter 12: Appending single lines
*&---------------------------------------------------------------------*
REPORT CHAP1204.
* Work area for a database table
TABLES CUSTOMERS.
* Types for later use
TYPES: BEGIN OF T_CUSTOMER_CITY,
         ID   LIKE CUSTOMERS-ID,
         CITY LIKE CUSTOMERS-CITY,
      END OF T_CUSTOMER_CITY.
* Internal table with two columns
DATA CUSTOMER_CITIES TYPE T_CUSTOMER_CITY OCCURS 100
                     WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS.
  MOVE-CORRESPONDING CUSTOMERS TO CUSTOMER_CITIES.
  APPEND CUSTOMER_CITIES.
ENDSELECT.
* Displaying the result
LOOP AT CUSTOMER_CITIES.
  WRITE / CUSTOMER_CITIES-CITY.
ENDLOOP.
