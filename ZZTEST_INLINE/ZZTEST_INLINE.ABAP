*&---------------------------------------------------------------------*
*& Report zztest_inline
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_inline.

" DECLARAÇÃO NA FORMA ANTIGA
*DATA ITAB TYPE TABLE OF SCARR.
*
*SELECT *
*        FROM SCARR
*        INTO TABLE ITAB.
*
*cl_demo_output=>display( ITAB ).

" DECLARAÇÃO NO ABAP MODERNO (INLINE)

SELECT *
        FROM SCARR
        INTO TABLE @DATA(ITAB).

cl_demo_output=>display( ITAB ).
