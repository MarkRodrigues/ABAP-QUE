*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic read table command
*&---------------------------------------------------------------------*
REPORT CHAP2303.
* Parameters for reading a single line, can be modified by the end user
PARAMETERS: KEY1(10)         DEFAULT 'NAME',
            VALUE1(25),
            KEY2   LIKE KEY1 DEFAULT 'ID',
            VALUE2 LIKE VALUE1.
* Declarations for later use
TABLES CUSTOMERS.
DATA ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                   WITH HEADER LINE.
* Filling the internal table
SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.
* Dynamic read table command
READ TABLE ALL_CUSTOMERS
   WITH KEY (KEY1) = VALUE1
            (KEY2) = VALUE2.
* Displaying the result
IF SY-SUBRC EQ 0.
  WRITE: / ALL_CUSTOMERS-ID,
           ALL_CUSTOMERS-NAME,
           ALL_CUSTOMERS-CITY,
           ALL_CUSTOMERS-TELEPHONE.
ELSE.
  WRITE 'Entry not found'.
ENDIF.
