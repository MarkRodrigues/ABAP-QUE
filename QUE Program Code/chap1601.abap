*&---------------------------------------------------------------------*
*& Chapter 16: Parameters on the selection screen
*&---------------------------------------------------------------------*
REPORT CHAP1601.
* Defining parameters
PARAMETERS:
  P_CITY LIKE CUSTOMERS-CITY,
  P_FLDATE LIKE ACTFLI-FLDATE DEFAULT '19991231',
  P_FLAG AS CHECKBOX DEFAULT 'X'.
* Using Parameters
IF P_CITY = 'Big City'.
 WRITE 'Input value of Parameter p_city is Big City'.
ENDIF.
