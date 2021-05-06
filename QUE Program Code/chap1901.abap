*&---------------------------------------------------------------------*
*& Chapters 19-22: Sample dialog program (flight reservation)
*&---------------------------------------------------------------------*
* This program source contains all modules and subroutines of the
* flight reservation program, but screen and GUI status definitions
* are not included.
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Include MSABBTOP                          Modulpool        SAPMSABB *
*&                                                                     *
*&---------------------------------------------------------------------*
PROGRAM SAPMSABB MESSAGE-ID SU.

* Database tables
TABLES:
  PLANFLI,                          " Flight connections
  ACTFLI,                           " Dates of flights
  CUSTOMERS,                        " Customer data
  BOOKINGS.                         " Booking informations

* User defined types
TYPES:
  BOOLEAN          TYPE C,          " true = 'X', false otherwise
  SCREEN_CODE      LIKE SY-DYNNR,
  STATUS_CODE      LIKE SY-PFKEY,
  TITLEBAR_CODE(3) TYPE N,
  FUNCTION_CODE(4) TYPE C.

DATA:
* Global data
  FCODE           TYPE FUNCTION_CODE,
  FLAG_FOUND      TYPE BOOLEAN,
  FLAG_KEEP_INPUT TYPE BOOLEAN,

* Screen fields which do not come from the dictionary
  SEATS_FREE     TYPE I,
  SEATS_REQUIRED TYPE I.

DATA:
* table of all customers
  ALL_CUSTOMERS LIKE CUSTOMERS OCCURS 100
                WITH HEADER LINE.

CONSTANTS:
* Boolean constants
  TRUE             TYPE C VALUE 'X',
  FALSE            TYPE C VALUE ' ',

* Screen codes
  C_SCREEN_REQUEST TYPE SCREEN_CODE VALUE '0100',
  C_SCREEN_BOOKING TYPE SCREEN_CODE VALUE '0200',

* Status codes
  C_STATUS_REQUEST TYPE STATUS_CODE VALUE 'REQUEST',
  C_STATUS_BOOKING TYPE STATUS_CODE VALUE 'BOOKING',
  C_STATUS_LIST    TYPE STATUS_CODE VALUE 'LIST',

* Titlebar codes
  C_TITLE_REQUEST        TYPE TITLEBAR_CODE VALUE '100',
  C_TITLE_BOOKING        TYPE TITLEBAR_CODE VALUE '200',
  C_TITLE_LIST_CUSTOMERS TYPE TITLEBAR_CODE VALUE '110',

* Function codes
  C_FCODE_REQUEST  TYPE FUNCTION_CODE VALUE 'REQU',
  C_FCODE_BOOKING  TYPE FUNCTION_CODE VALUE 'BOOK',
  C_FCODE_CLEAR    TYPE FUNCTION_CODE VALUE 'CLEA',
  C_FCODE_BACK     TYPE FUNCTION_CODE VALUE 'BACK',
  C_FCODE_EXIT     TYPE FUNCTION_CODE VALUE 'EXIT'.

*-----------------------------------------------------------------------
***INCLUDE MSABBI01 .
*-----------------------------------------------------------------------

*&---------------------------------------------------------------------*
*&      Module  EXIT_SCREEN  INPUT
*&---------------------------------------------------------------------*
*       Handles back, exit, and clear command.                         *
*----------------------------------------------------------------------*
MODULE EXIT_SCREEN INPUT.
  CASE FCODE.
    WHEN C_FCODE_Clear.
*     Just clear the input fields
      CASE SY-DYNNR.
        WHEN c_screen_request.  CLEAR: PLANFLI, ACTFLI.
        WHEN C_SCREEN_BOOKING.  CLEAR CUSTOMERS.
                                SEATS_REQUIRED = 1.
      ENDCASE.
    WHEN C_FCODE_BACK.
*     Switch to previous screen.
      CASE SY-DYNNR.
        WHEN c_screen_request.  SET SCREEN 0.
        WHEN C_SCREEN_BOOKING.  FLAG_KEEP_INPUT = FALSE.
                                SET SCREEN c_screen_request.
      ENDCASE.
    WHEN C_FCODE_EXIT.
*     Exit program
      SET SCREEN 0.
  ENDCASE.
  LEAVE SCREEN.
ENDMODULE.                 " EXIT_SCREEN  INPUT

*&---------------------------------------------------------------------*
*&      Module  ACTION_REQUEST  INPUT
*&---------------------------------------------------------------------*
*       Check input data to represent a valid flight connection.       *
*----------------------------------------------------------------------*
MODULE ACTION_REQUEST INPUT.
  CASE FCODE.
    WHEN C_FCODE_REQUEST.
*     Check for a valid connection
      PERFORM FLIGHT_REQUEST CHANGING FLAG_FOUND.

      IF FLAG_FOUND = FALSE.
        MESSAGE E001.         " Flight connection not available
      ELSE.
        SET SCREEN 200.       " Next screen: entering customer data
        LEAVE SCREEN.
      ENDIF.
  ENDCASE.
ENDMODULE.                 " ACTION_REQUEST  INPUT

*&---------------------------------------------------------------------*
*&      Module  ACTION_BOOKING  INPUT
*&---------------------------------------------------------------------*
*       Get customer data to make the booking.                         *
*----------------------------------------------------------------------*
MODULE ACTION_BOOKING INPUT.
  CASE FCODE.
    WHEN C_FCODE_BOOKING.
*     Make the booking
      PERFORM FLIGHT_BOOKING.

*     Return to previous screen for another request.
      FLAG_KEEP_INPUT = FALSE.
      SET SCREEN C_SCREEN_REQUEST.
      LEAVE SCREEN.
  ENDCASE.
ENDMODULE.                 " ACTION_BOOKING  INPUT

*&---------------------------------------------------------------------*
*&      Module  VALUES_CUSTOMERS  INPUT
*&---------------------------------------------------------------------*
*       Display list of customers                                      *
*----------------------------------------------------------------------*
MODULE VALUES_CUSTOMERS INPUT.
* Display all customers in a dialog box
  CALL SCREEN 110
       STARTING AT 10 10
       ENDING   AT 30 20.
ENDMODULE.                 " VALUES_CUSTOMERS  INPUT

*&---------------------------------------------------------------------*
*&      Module  ACTION_LIST  INPUT
*&---------------------------------------------------------------------*
*       Write list of customers                                        *
*----------------------------------------------------------------------*
MODULE ACTION_LIST INPUT.

* Read all customers
  SELECT * FROM CUSTOMERS INTO TABLE ALL_CUSTOMERS.

* Write all customers
  NEW-PAGE NO-TITLE.
  LOOP AT ALL_CUSTOMERS.
    WRITE / ALL_CUSTOMERS-NAME.
    HIDE ALL_CUSTOMERS-ID.
  ENDLOOP.

ENDMODULE.                 " ACTION_LIST  INPUT

*-------------------------------------------------------------------
***INCLUDE MSABBO01 .
*-------------------------------------------------------------------

*&---------------------------------------------------------------------*
*&      Module  INIT_REQUEST  OUTPUT
*&---------------------------------------------------------------------*
*       Initializes titlebar and status of the screen for a flight     *
*       request.                                                       *
*----------------------------------------------------------------------*
MODULE INIT_REQUEST OUTPUT.
* Initialize titlebar and status
  SET TITLEBAR  C_TITLE_REQUEST.
  SET PF-STATUS C_STATUS_REQUEST.
ENDMODULE.                 " INIT_REQUEST  OUTPUT

*&---------------------------------------------------------------------*
*&      Module  INIT_BOOKING  OUTPUT
*&---------------------------------------------------------------------*
*       Initializes titlebar and status of the screen for a flight     *
*       request. The fields for the number of free and required seats  *
*       and for the customer's data are initialized.                   *
*----------------------------------------------------------------------*
MODULE INIT_BOOKING OUTPUT.
* Initialize titlebar and status
  SET TITLEBAR  C_TITLE_BOOKING.
  SET PF-STATUS C_STATUS_BOOKING.

* Get number of seats free
  SEATS_FREE = ACTFLI-SEATSMAX - ACTFLI-SEATSOCC.

* While processing the booking screen, the contents of the
* input fields are kept, e.g. if ENTER is pressed.
  IF FLAG_KEEP_INPUT = FALSE.
    CLEAR CUSTOMERS.
    SEATS_REQUIRED = 1.
    FLAG_KEEP_INPUT = TRUE.  " kept while processing the screen
  ENDIF.
ENDMODULE.                 " INIT_BOOKING  OUTPUT
*&---------------------------------------------------------------------*
*&      Module  INIT_LIST  OUTPUT
*&---------------------------------------------------------------------*
*       Write list of customers                                        *
*----------------------------------------------------------------------*
MODULE INIT_LIST OUTPUT.

* Initialize titlebar and status
  SET TITLEBAR  C_TITLE_LIST_CUSTOMERS.
  SET PF-STATUS C_STATUS_LIST.

* Prepare list
  SUPPRESS DIALOG.
  LEAVE TO LIST-PROCESSING AND RETURN TO SCREEN 0.

ENDMODULE.                 " INIT_LIST  OUTPUT

*-------------------------------------------------------------------
***INCLUDE MSABBF01 .
*-------------------------------------------------------------------

*&---------------------------------------------------------------------*
*&      Form  FLIGHT_REQUEST
*&---------------------------------------------------------------------*
*       Check for a valid connection                                   *
*----------------------------------------------------------------------*
FORM FLIGHT_REQUEST CHANGING F_FLAG_FOUND TYPE BOOLEAN.

* First check for a valid connection, i.e. check if carrier CARRID
* offers a flight starting in city CITYFROM with destination CITYTO.
  F_FLAG_FOUND = FALSE.
  SELECT        * FROM  PLANFLI
         WHERE  CARRID      = PLANFLI-CARRID
         AND    CITYFROM    = PLANFLI-CITYFROM
         AND    CITYTO      = PLANFLI-CITYTO.

*   Then check if the connection is also offered for the
*   specified date.
    SELECT SINGLE * FROM  ACTFLI
           WHERE  CARRID      = PLANFLI-CARRID
           AND    CONNID      = PLANFLI-CONNID
           AND    FLDATE      = ACTFLI-FLDATE.
    IF SY-SUBRC = 0.
      F_FLAG_FOUND = TRUE.
      EXIT.
    ENDIF.
  ENDSELECT.
ENDFORM.                               " FLIGHT_REQUEST


*&---------------------------------------------------------------------*
*&      Form  FLIGHT_BOOKING
*&---------------------------------------------------------------------*
*       Insert the booking into database tables                        *
*----------------------------------------------------------------------*
FORM FLIGHT_BOOKING.

  DATA: L_CUSTOMERS  LIKE CUSTOMERS OCCURS 10
                                    WITH HEADER LINE,
        L_LINE_COUNT TYPE I,
        L_INDEX      LIKE SY-TABIX.

* 1. Check if seats are available
  IF SEATS_REQUIRED > SEATS_FREE.
    MESSAGE E003 WITH SEATS_FREE.       " Not enough seats
  endif.

* 2. Booking is only allowed for registered customers. Thus,
*    check if a customer id is available in table CUSTOMERS.
  SELECT * FROM  CUSTOMERS INTO TABLE L_CUSTOMERS
           WHERE NAME = CUSTOMERS-NAME.

* Check number of matching entries
  DESCRIBE TABLE L_CUSTOMERS LINES L_LINE_COUNT.
  IF L_LINE_COUNT = 0.
    message e004 with customers-name.  " Customer id not available
  ELSEIF L_LINE_COUNT > 1.
*   Process dialog to select the appropriate customer
    ...     " To be implemented: sets L_INDEX
  endif.

  L_INDEX = 1.     " Must be deleted if L_INDEX is set above
  READ TABLE L_CUSTOMERS INDEX L_INDEX.
  IF SY-SUBRC <> 0.
    MESSAGE A006.     " Internal booking error: missing entry
  ENDIF.

* 3. Update bookings information in table BOOKINGS
  MOVE-CORRESPONDING ACTFLI TO BOOKINGS.
  PERFORM SET_BOOKID CHANGING BOOKINGS-BOOKID.
  BOOKINGS-CUSTOMID   = L_CUSTOMERS-ID.
  BOOKINGS-ORDER_DATE = SY-DATUM.

  INSERT BOOKINGS.    " Optional: call function in update task
  IF SY-SUBRC <> 0.
    MESSAGE A005.     " Internal booking error: duplicate entries
  ENDIF.

* 4. Update number of occupied seats in table ACTFLI
  ADD SEATS_REQUIRED TO ACTFLI-SEATSOCC.
  UPDATE ACTFLI.      " Optional: call function in update task
  IF SY-SUBRC <> 0.
    MESSAGE A006.     " Internal booking error: missing entry
  ENDIF.

* Optional: using an update task
* call function 'ABAP_BOOK_INSERT_BOOKINGS'
*      in update task
*      exporting
*           i_bookings = bookings
*           i_actfli   = actfli.
* commit work.

* 5. Message: booking successful for customer ...
  MESSAGE I002 WITH ACTFLI-CONNID CUSTOMERS-NAME.



ENDFORM.                               " FLIGHT_BOOKING

*&---------------------------------------------------------------------*
*&      Form  SET_BOOKID
*&---------------------------------------------------------------------*
*       Determine a new booking id.                                    *
*----------------------------------------------------------------------*
FORM SET_BOOKID CHANGING F_BOOKID LIKE BOOKINGS-BOOKID.

* Get maximum bookid and increment it by 1
  SELECT MAX( BOOKID ) INTO (F_BOOKID) FROM BOOKINGS.
  ADD 1 TO F_BOOKID.
ENDFORM.                               " SET_BOOKID

*-------------------------------------------------------------------
***INCLUDE MSABBE01 .
*-------------------------------------------------------------------

*&---------------------------------------------------------------------*
*&   Event AT LINE-SELECTION
*&---------------------------------------------------------------------*

at line-selection.
* Get selected customer and display name
  read table all_customers with key id = all_customers-id.
  if sy-subrc = 0.
    customers-name = all_customers-name.
  endif.
  leave to screen 0.
