*&---------------------------------------------------------------------*
*& Module Pool      ZSAPTARGET_MPP_VOO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE zsaptarget_mpp_voo_top                  .    " Global Data

* INCLUDE ZSAPTARGET_MPP_VOO_O01                  .  " PBO-Modules
* INCLUDE ZSAPTARGET_MPP_VOO_I01                  .  " PAI-Modules
* INCLUDE ZSAPTARGET_MPP_VOO_F01                  .  " FORM-Routines

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'ENTERM'.
    SELECT  SINGLE  carrid,
                    connid,
                    fldate,
                    price,
                    currency
            FROM sflight
            INTO @st_sflight
            WHERE carrid = @in_carrid AND connid = @in_connid.
    IF sy-subrc = 0.
      CALL SCREEN 200.
    ELSE.
      MESSAGE 'DATA NOT FOUND' TYPE 'I'.
    ENDIF.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
IF SY-UCOMM = 'BACK'.
  CALL SCREEN 100.
ENDIF.
ENDMODULE.
