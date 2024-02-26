*&---------------------------------------------------------------------*
*& Report z_field_symbols_01_eri001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_field_symbols_01_eri001.

* structure | name | age
TYPES: BEGIN OF ty_data,
         name TYPE string,
         age  TYPE i,
       END OF ty_data.

* Tabletype
TYPES: TY_IT_ITAB TYPE STANDARD TABLE OF ty_data WITH DEFAULT KEY.

* internal table
DATA: IT_ITAB TYPE ty_it_itab.

* we fill some data to the internal table
it_itab = value ty_it_itab(
    ( name =  'tom' age  = '20' )
    ( name =  'Eva' age  = '30' )
).

* Declare field symbol
FIELD-SYMBOLS: <FS_LINE> TYPE TY_DATA.

* example 1
*LOOP AT it_itab ASSIGNING <fs_line>.
*    WRITE:/ <fs_line>-name, <fs_line>-age.
*ENDLOOP.

* example 2 ( inline )
LOOP AT IT_ITAB ASSIGNING FIELD-SYMBOL(<FS_INLINE>).
    WRITE:/ <fs_inline>-name, <fs_inline>-age.
ENDLOOP.
