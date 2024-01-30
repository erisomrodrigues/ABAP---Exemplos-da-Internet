*&---------------------------------------------------------------------*
*& Report zztest_line_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_line_01.

SELECT *
         FROM SCARR
         INTO TABLE @DATA(ITAB).

LOOP AT ITAB ASSIGNING FIELD-SYMBOL(<FS_ITAB>).
    WRITE / <fs_itab>-carrname.
ENDLOOP.
