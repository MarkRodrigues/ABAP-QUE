*&---------------------------------------------------------------------*
*& Chapter 23: Dynamic subtotals
*&---------------------------------------------------------------------*
REPORT CHAP2304.
TABLES ACTFLI.
DATA MY_FLIGHTS LIKE ACTFLI OCCURS 10
                WITH HEADER LINE.
DATA SUM_OCCUPIED_SEATS LIKE MY_FLIGHTS-SEATSOCC.
DATA COLUMN(30).
SELECT * FROM ACTFLI INTO TABLE MY_FLIGHTS
       ORDER BY PRIMARY KEY.
LOOP AT MY_FLIGHTS.
  WRITE: / MY_FLIGHTS-CARRID,
           MY_FLIGHTS-CONNID,
           MY_FLIGHTS-FLDATE.
ENDLOOP.
AT LINE-SELECTION.
* Display subtotals according to end user's selection
GET CURSOR FIELD COLUMN.
SHIFT COLUMN UP TO '-'.
SHIFT COLUMN.
LOOP AT MY_FLIGHTS.
  AT NEW (COLUMN).
    NEW-PAGE.
    WRITE / MY_FLIGHTS-CARRID.
    CLEAR SUM_OCCUPIED_SEATS.
  ENDAT.
  ADD MY_FLIGHTS-SEATSOCC TO SUM_OCCUPIED_SEATS.
  WRITE / MY_FLIGHTS-SEATSOCC.
  AT END OF (COLUMN).
    WRITE: / 'Occupied seats total:', SUM_OCCUPIED_SEATS.
  ENDAT.
ENDLOOP.
