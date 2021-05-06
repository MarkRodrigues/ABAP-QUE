*&---------------------------------------------------------------------*
*& Chapter 7: String Operations
*&---------------------------------------------------------------------*
REPORT CHAP0708.

* Concatenating strings without delimiter
DATA: FIRST_NAME(25), MIDDLE_NAME(2), LAST_NAME(25),
      FULL_NAME(54).
FIRST_NAME  = 'John'.
MIDDLE_NAME = 'F.'.
LAST_NAME   = 'Kennedy'.
CONCATENATE FIRST_NAME MIDDLE_NAME LAST_NAME INTO FULL_NAME.
WRITE / FULL_NAME.

* Concatenating strings with delimiter
DATA: DIRECTORY_1(2), DIRECTORY_2(10), FILE_NAME(10),
      PATH(24).
DIRECTORY_1 = 'a:'.
DIRECTORY_2 = 'usr'.
FILE_NAME = 'programs'.
CONCATENATE DIRECTORY_1 DIRECTORY_2 FILE_NAME
            INTO PATH
            SEPARATED BY '\'.
WRITE / PATH.

* Splitting strings
DATA: LIST(40),
      NAME_1(25), NAME_2(25), NAME_3(25).
LIST = 'Edison,Smith,Young'.
SPLIT LIST AT ',' INTO NAME_1 NAME_2 NAME_3.
WRITE: / NAME_1, NAME_2, NAME_3.

* Splitting strings with result in an internal table
DATA NAMES LIKE NAME_1 OCCURS 10 WITH HEADER LINE.
LIST = 'Edison,Smith,Young,Edwards'.
SPLIT LIST AT ',' INTO TABLE NAMES.
LOOP AT NAMES.
  WRITE / NAMES.
ENDLOOP.

* Shifting strings by a fixed number of places
NAME_1 = 'Edison'.
NAME_2 = 'Smith'.
NAME_3 = 'Young'.
SHIFT NAME_1.
SHIFT NAME_2 BY 3 PLACES.
SHIFT NAME_3 RIGHT.
WRITE: / NAME_1, NAME_2, NAME_3.

* Shifting strings up to a substring
NAMES = 'Alexander Bill Charles'.
SHIFT NAMES UP TO 'Bill'.
WRITE / NAMES.

* Shifting strings deleting blanks
NAMES = 'Joanne___'.
SHIFT NAMES RIGHT DELETING TRAILING SPACE.
WRITE / NAMES.

* Replacing and translating characters in strings
DATA: STRING(80),
      EXPRESSION(30).
STRING = 'Variable: &. The variable & is substituted later.'.
REPLACE '&' WITH 'X' INTO STRING.
WRITE / STRING.
TRANSLATE STRING USING '&X'.
WRITE / STRING.
EXPRESSION = 'a ** 2 + b ** 2 = c ** 2'.
TRANSLATE EXPRESSION USING 'axbycz'.
WRITE / EXPRESSION.

* Searching for strings in fields or internal tables
DATA TEXT(100) VALUE 'Texas California New Mexico Louisiana Oregon'.
SEARCH TEXT FOR 'California'.
IF SY-SUBRC NE 0. WRITE 'Not found'. ENDIF.
SEARCH TEXT FOR 'cAliforniA'.
IF SY-SUBRC NE 0. WRITE 'Not found'. ENDIF.
SEARCH TEXT FOR 'New M'.
IF SY-SUBRC NE 0. WRITE 'Not found'. ENDIF.

* Working with parts of fields
DATA: S(8) VALUE 'ABCDEFGH',
      T(8) VALUE '12345678',
      OFF1 TYPE I, OFF2 TYPE I,
      LEN1 TYPE I, LEN2 TYPE I.

OFF1 = 2.
LEN1 = 3.
OFF2 = 4.
LEN2 = 3.
MOVE S+OFF1(LEN1) TO T+OFF2(LEN2).
WRITE / T.
