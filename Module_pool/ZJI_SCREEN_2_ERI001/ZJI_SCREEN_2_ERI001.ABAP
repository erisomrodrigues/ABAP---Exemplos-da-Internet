*&---------------------------------------------------------------------*
*& Report ZJI_SCREEN_2_ERI001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zji_screen_2_eri001.

CALL SCREEN 100.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  DATA okcode_100 TYPE sy-ucomm.
  IF okcode_100 = 'FCT_200'.
    SET SCREEN 200.
  ELSEIF okcode_100 = 'FCT_EXIT'.
    LEAVE PROGRAM.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  DATA okcode_200 TYPE sy-ucomm.
  IF okcode_200 = 'FCT_EXIT'.
    LEAVE SCREEN.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  POV_CCODE  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pov_ccode INPUT.

    SELECT bukrs, butxt FROM t001 INTO TABLE @DATA(it_ccodes) UP TO 20 ROWS.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
*     DDIC_STRUCTURE         = ' '
      retfield    = 'BUKRS'
*     PVALKEY     = ' '
      dynpprog    = SY-REPID
      dynpnr      = SY-DYNNR
      dynprofield = 'CCODE'
*     STEPL       = 0
*     WINDOW_TITLE           =
*     VALUE       = ' '
      value_org   = 'S'
*     MULTIPLE_CHOICE        = ' '
*     DISPLAY     = ' '
*     CALLBACK_PROGRAM       = ' '
*     CALLBACK_FORM          = ' '
*     CALLBACK_METHOD        =
*     MARK_TAB    =
*     IMPORTING
*     USER_RESET  =
    TABLES
      value_tab   = it_ccodes
*     FIELD_TAB   =
*     RETURN_TAB  =
*     DYNPFLD_MAPPING        =
*     EXCEPTIONS
*     PARAMETER_ERROR        = 1
*     NO_VALUES_FOUND        = 2
*     OTHERS      = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDMODULE.
