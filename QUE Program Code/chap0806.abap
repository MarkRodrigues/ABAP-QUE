*&---------------------------------------------------------------------*
*& Chapter 8: Using symbols and icons
*&---------------------------------------------------------------------*
REPORT CHAP0806.

* Declaring symbols and icons
INCLUDE: <SYMBOL>, <ICON>.

* Displaying symbols and icons
WRITE: / SYM_PHONE     AS SYMBOL, 'telephone',
       / SYM_FAX       AS SYMBOL, 'fax machine',
       / SYM_LEFT_HAND AS SYMBOL, 'hand pointing left',
       / SYM_CAUTION   AS SYMBOL, 'caution',
       / ICON_CHECKED  AS ICON,   'checked; okay',
       / ICON_DELETE   AS ICON,   'delete',
       / ICON_PRINT    AS ICON,   'print'.
