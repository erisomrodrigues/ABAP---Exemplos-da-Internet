*&---------------------------------------------------------------------*
*& Module Pool      ZGYATRI_CB
*&------https://www.youtube.com/watch?v=0g5wZ7KLnGc
*&
*&---------------------------------------------------------------------*
PROGRAM zgyatri_cb.

DATA: matno           TYPE matnr.
DATA: output          TYPE char100.
DATA: mat_desc        TYPE char1.   "Check box for matdesc
DATA: creator_name    TYPE char1.   "Check box for creator_name
DATA: gv_mat_des      TYPE maktx.   " Global variable to store the description
DATA: gv_creator_name TYPE ernam.   " Global variable to store the name in output

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT. "PBO
  SET PF-STATUS 'ZGYATRI'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT. "PAI

  CASE sy-ucomm.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0. " IT WILL JUST GO BACK FROM THE CURRENT SCREEN
    WHEN 'DISPLAY'.
      IF creator_name = 'X'.
        SELECT SINGLE ernam
                      FROM mara
                      INTO @creator_name
                      WHERE matnr = @matno.
          IF SY-SUBRC NE 0. " Value not found
            MESSAGE 'GIVEN MATERIAL NOT FOUND IN MARA TABLE' TYPE 'I' DISPLAY LIKE 'E'.
          ELSE.
        OUTPUT = CREATOR_NAME.

      ENDIF.
      ENDIF.

      IF mat_desc IS NOT INITIAL.
        SELECT SINGLE maktx
                      FROM makt
                      INTO @gv_mat_des WHERE MATNR = @MATNO.
          IF SY-SUBRC NE 0.
            MESSAGE 'GIVEN MATERIAL NOT FOUND IN MAKT TABLE' TYPE 'I' DISPLAY LIKE 'E'.
          ELSE.
        OUTPUT = gv_mat_des.

      ENDIF.
      ENDIF.

      IF GV_CREATOR_NAME IS NOT INITIAL AND gv_mat_des IS NOT INITIAL.
        CONCATENATE gv_creator_name gv_mat_des INTO output.
      ENDIF.


  ENDCASE.

ENDMODULE.
