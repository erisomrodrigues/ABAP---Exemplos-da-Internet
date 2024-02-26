*&---------------------------------------------------------------------*
*& Report z_field_symbol
*& https://www.ricardoishida.com/2013/04/abap-field-symbol-ponteiros-pointers.html *
*&
*&---------------------------------------------------------------------*
REPORT z_field_symbol.


DATA: LV_PONT TYPE STRING VALUE 'HELLO WORLD'.

FIELD-SYMBOLS <FS_PONT>.

ASSIGN LV_PONT TO <FS_PONT>.


    if <FS_PONT> IS ASSIGNED.

    <FS_PONT> = 'GOOD BY WORLD'.

      WRITE / <FS_PONT>.

    endif.
