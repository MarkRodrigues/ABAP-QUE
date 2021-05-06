*&---------------------------------------------------------------------*
*& Chapter 4: Records and internal tables
*&---------------------------------------------------------------------*
REPORT CHAP0407.

* Records (or structures) consist of a fixed number of components
DATA: BEGIN OF CUSTOMER,
        ID(8) TYPE N,
        NAME(25),
        TELEPHONE(12),
      END OF CUSTOMER.

* Working with the different components and the structure itself
DATA VENDOR LIKE CUSTOMER.
CUSTOMER-ID = '87654321'.
CUSTOMER-NAME = 'Edison'.
CUSTOMER-TELEPHONE = '111-111-1111'.
MOVE CUSTOMER TO VENDOR.
WRITE / VENDOR-NAME.

* Defining an internal table each entry having the structure of
* the record customer
DATA ALL_CUSTOMERS LIKE CUSTOMER OCCURS 100.

* Using a reference to a non-elementary type.
TYPES: BEGIN OF PERSONAL_DATA,
         NAME(25),
         CITY(25),
         STREET(30),
       END OF PERSONAL_DATA.
DATA PEOPLE TYPE PERSONAL_DATA OCCURS 300.

* Internal table with a header line, which is used as a default record
* to hold the record currently being added to the table
DATA NEW_CUSTOMERS LIKE CUSTOMER OCCURS 100
                   WITH HEADER LINE.
