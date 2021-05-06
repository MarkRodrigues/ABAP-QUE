*&---------------------------------------------------------------------*
*& Chapter 11: Using where clauses
*&---------------------------------------------------------------------*
REPORT CHAP1104.
* Work areas
TABLES: BOOKINGS, CUSTOMERS.
* Internal tables
DATA CUSTOMER_ORDERS LIKE BOOKINGS OCCURS 100
                     WITH HEADER LINE.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.

* Selecting data with a simple where clause
SELECT * FROM BOOKINGS INTO TABLE CUSTOMER_ORDERS
       WHERE ORDER_DATE = '19990101'.
* Displaying the result
LOOP AT CUSTOMER_ORDERS.
  WRITE / CUSTOMER_ORDERS-FLDATE.
ENDLOOP.

* Selecting data with a complex where clause
SELECT * FROM BOOKINGS INTO TABLE CUSTOMER_ORDERS
         WHERE CUSTOMID   =  '87654321'
           AND ORDER_DATE >= '19990101'.
* Displaying the result
SKIP.
LOOP AT CUSTOMER_ORDERS.
  WRITE / CUSTOMER_ORDERS-FLDATE.
ENDLOOP.

* Selecting data with a complex where clause
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS
       WHERE NAME LIKE 'E%'.
* Displaying the result
SKIP.
LOOP AT ALL_CUSTOMERS.
  WRITE / ALL_CUSTOMERS-NAME.
ENDLOOP.
