*&---------------------------------------------------------------------*
*& Report z_field_symbols
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_field_symbols.

" SEM USAR FIELD SYMBOL
*DATA: GT_SPFLI TYPE TABLE OF SPFLI,
*      GS_SPFLI TYPE SPFLI.
*
*SELECT *
*         FROM SPFLI
*         INTO TABLE @gt_spfli.
*
*LOOP AT GT_SPFLI INTO GS_SPFLI.
*    GS_SPFLI-carrid = '???'.
*    MODIFY gt_spfli FROM gs_spfli.
*ENDLOOP.
*
*
*cl_demo_output=>display_data( GT_SPFLI ).

" USANDO FIELD SYMBOL SE OBTEM O MESMO RESULTADO

DATA: GT_SPFLI TYPE TABLE OF SPFLI.
      
SELECT *
         FROM SPFLI
         INTO TABLE @gt_spfli.

LOOP AT gt_spfli ASSIGNING FIELD-SYMBOL(<FS_SPFLI>).
    <fs_spfli>-carrid = '???'.
ENDLOOP.

cl_demo_output=>display_data( GT_SPFLI ).
