*&---------------------------------------------------------------------*
*& Chapter 3: The Syntax of ABAP/4 Programs
*&---------------------------------------------------------------------*
* Declaration of the program name
REPORT CHAP0301.

* Displaying the words 'Customer list' on the screen
WRITE / 'Customer list'.

* Using an addition of the write command
WRITE AT /10 'Customer list'.

* Using single quotation marks within the text of a literal
WRITE / 'Customer''s Name'.

* Here is a comment with an asterisk in the first column
WRITE / 'Ms O''Connor'. "This is a comment at the end of the line

* A field of type character and length 40
DATA TARGET_STRING(40) TYPE C.

* Statements may extend over several lines
* (e.g., copying fields using the move command):
MOVE 'Source string'
  TO
    TARGET_STRING.
WRITE / TARGET_STRING.

* Combining Statements
WRITE: / 'Customer list',
         'Bookings'.
