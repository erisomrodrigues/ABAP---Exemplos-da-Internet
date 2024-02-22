*&---------------------------------------------------------------------*
*& Report ZTESTE00
*&--https://www.youtube.com/watch?v=2oQcaPHP5MU
*&
*&---------------------------------------------------------------------*
REPORT ZTESTE00.

CLASS DEMO DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS MAIN.
ENDCLASS.

CLASS DEMO IMPLEMENTATION.
  METHOD MAIN.
    TYPES: BEGIN OF TY_VBAK,
              VBELN TYPE VBAK-VBELN,
              VKORG TYPE VBAK-vkorg,
              VKGRP TYPE VBAK-vkgrp,
           END OF ty_vbak.

    DATA: LT_VBAK TYPE STANDARD TABLE OF ty_vbak.
    DATA: LT_VBAK_GRP TYPE STANDARD TABLE OF ty_vbak.

    SELECT
            FROM VBAK
            FIELDS VBELN, VKORG, VKGRP
            INTO TABLE @LT_VBAK.
   IF SY-subrc IS INITIAL.
    LOOP AT lt_vbak ASSIGNING FIELD-SYMBOL(<FS_VBAK>)
                    GROUP BY  ( vkorg = <fs_vbak>-vkorg
                                vkgrp = <fs_vbak>-vkgrp ).

        CLEAR lt_vbak_grp.
        LOOP AT GROUP <fs_vbak> ASSIGNING FIELD-SYMBOL(<LS_GRP>).
          LT_VBAK_GRP = VALUE #( BASE lt_vbak_grp ( <ls_grp> ) ).
        ENDLOOP.
        cl_demo_output=>write( lt_vbak_grp ).
    ENDLOOP.
   ENDIF.

   cl_demo_output=>display( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
demo=>main( ).
