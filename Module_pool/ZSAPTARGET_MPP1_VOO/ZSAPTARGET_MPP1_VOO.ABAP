*&---------------------------------------------------------------------*
*& Module Pool      ZSAPTARGET_MPP1_VOO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE ZSAPTARGET_MPP1_VOO_TOP                 .    " Global Data

* INCLUDE ZSAPTARGET_MPP1_VOO_O01                 .  " PBO-Modules
* INCLUDE ZSAPTARGET_MPP1_VOO_I01                 .  " PAI-Modules
* INCLUDE ZSAPTARGET_MPP1_VOO_F01                 .  " FORM-Routines

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
IF SY-ucomm = 'ENTER'.
  SELECT  CARRID,
          CONNID,
          FLDATE,
          PRICE,
          CURRENCY
          FROM SFLIGHT INTO TABLE @LT_SFLIGHT
          WHERE CARRID = @ST_SFLIGHT-carrid OR CONNID = @ST_SFLIGHT-connid.

    IF SY-subrc = 0.
      CALL SCREEN 200.
      ELSE.
        MESSAGE 'ENTRY NOT FOUND' TYPE 'I'.
    ENDIF.
ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  IF SY-ucomm = 'BACK'.
  CALL SCREEN 100.
  ENDIF.
ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TABLE200' ITSELF
CONTROLS: TABLE200 TYPE TABLEVIEW USING SCREEN 0200.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TABLE200'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TABLE200_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE LT_SFLIGHT LINES TABLE200-lines.
ENDMODULE.
