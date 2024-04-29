*----------------------------------------------------------------------*
***INCLUDE ZJI_MODULE_POOL_USER_COMMANI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  DATA OKCODE_100 TYPE SY-ucomm.
    IF okcode_100 = 'FCT_EXIT'.
      LEAVE PROGRAM.
      ELSEIF OKCODE_100 = 'FCT_COFIRME'.
        CALL SCREEN 555 STARTING AT 10 20 ENDING AT 30 60.


    ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0555  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0555 INPUT.
  DATA OKCODE_555 TYPE SY-ucomm.
    IF okcode_555 = 'FCT_NO'.
      SET SCREEN 0.
    ENDIF.
ENDMODULE.
