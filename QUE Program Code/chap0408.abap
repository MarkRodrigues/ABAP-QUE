*&---------------------------------------------------------------------*
*& Chapter 4: Complex Non-Elementary Types and Data Objects
*&---------------------------------------------------------------------*
REPORT CHAP0408.

* Nested records
TYPES: BEGIN OF ADDRESS,
         CITY(25),
         STREET(30),
       END OF ADDRESS,
       BEGIN OF PERSON,
         NAME(25),
         ADDRESS TYPE ADDRESS,
       END OF PERSON.
DATA RECEIVER TYPE PERSON.
RECEIVER-NAME = 'Smith'.
RECEIVER-ADDRESS-CITY = 'Big City'.
RECEIVER-ADDRESS-STREET = 'Main street'.

* Nested internal tables
TYPES: BEGIN OF PHONE_FAX_NUMBERS,
         COUNTRY_CODE(3) TYPE N,
         AREA_CODE(3) TYPE N,
         NUMBER(10) TYPE N,
       END OF PHONE_FAX_NUMBERS,
       BEGIN OF EMPLOYEE,
         NAME(25),
         PHONE TYPE PHONE_FAX_NUMBERS OCCURS 10,
         FAX TYPE PHONE_FAX_NUMBERS OCCURS 5,
       END OF EMPLOYEE.
DATA EMPLOYEES TYPE EMPLOYEE OCCURS 100.
