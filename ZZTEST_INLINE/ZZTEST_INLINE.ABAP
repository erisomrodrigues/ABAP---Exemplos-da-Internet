*&---------------------------------------------------------------------*
*& Report zztest_inline
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zztest_inline.

DATA ITAB TYPE TABLE OF SCARR.

SELECT *
        FROM SCARR
        INTO TABLE ITAB.

cl_demo_output=>display( ITAB
*  EXPORTING
*    data =
*    name =
).
