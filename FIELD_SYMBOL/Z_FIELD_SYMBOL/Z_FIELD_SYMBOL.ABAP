*&---------------------------------------------------------------------*
*& Report z_field_symbols
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_field_symbols.

DATA: GT_SPFLI TYPE TABLE OF SPFLI,
      GS_SPFLI TYPE SPFLI.

SELECT *
         FROM SPFLI
         INTO TABLE @gt_spfli.

LOOP AT GT_SPFLI INTO GS_SPFLI.
    GS_SPFLI-carrid = '???'.
    MODIFY gt_spfli FROM gs_spfli.
ENDLOOP.


cl_demo_output=>display_data( GT_SPFLI ).
