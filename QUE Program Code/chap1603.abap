*&---------------------------------------------------------------------*
*& Chapter 16: Selection screen events
*&---------------------------------------------------------------------*
REPORT CHAP1603 MESSAGE-ID SU.
* Worka area
TABLES CUSTOMERS.
* Selection criteria
PARAMETERS PCODE LIKE CUSTOMERS-POSTCODE.
SELECT-OPTIONS S_NAME FOR CUSTOMERS-NAME.
* Variables
DATA: PARAMETER_LENGTH TYPE I,
      NUMBER_OF_SELECTIONS TYPE I.
* Checking user input in Parameter pcode
AT SELECTION-SCREEN ON PCODE.
  PARAMETER_LENGTH = STRLEN( PCODE ).
  IF PARAMETER_LENGTH < 5.
    MESSAGE E000 WITH 'ZIP code invalid'.
  ENDIF.
* Checking user input in Select-Option s_name
AT SELECTION-SCREEN ON S_NAME.
  DESCRIBE TABLE S_NAME LINES NUMBER_OF_SELECTIONS.
  IF NUMBER_OF_SELECTIONS = 0.
    MESSAGE E000 WITH 'Please specify name of customer'.
  ENDIF.
* Processing data
START-OF-SELECTION.
  SELECT * FROM CUSTOMERS
         WHERE NAME IN S_NAME.
    WRITE / CUSTOMERS-NAME.
  ENDSELECT.
