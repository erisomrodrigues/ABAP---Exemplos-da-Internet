*&---------------------------------------------------------------------*
*& Modulpool SAPMZJI_MOD_POLL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM sapmzji_mod_pool_eri001.

DATA: in_matnr TYPE matnr,
      c_m1     TYPE c,
      c_m2     TYPE c.

DATA: okcode_100 TYPE sy-ucomm.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.


  c_m1 = 'X'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  PAI_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pai_0100 INPUT.

  IF okcode_100 = 'FCT_GET'.
    IF c_m1 = 'X'.
      SELECT * FROM mara INTO TABLE @DATA(it_mara)
              WHERE mtart = 'FERT'.
    ENDIF.

  ELSEIF okcode_100 = 'FCT_EXIT'.
    LEAVE PROGRAM.

  ELSEIF okcode_100 = 'FCT_S200'.
    CALL SCREEN 200.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  DATA: okcode_200 TYPE sy-ucomm.
  DATA: i_plant TYPE werks_d.
  DATA: I_MATNR TYPE MATNR.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_200 INPUT.

  IF okcode_200 = 'FCT_EXIT'.
    LEAVE PROGRAM.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  DATA_VALIDATION  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE data_validation INPUT.
  IF okcode_200 = 'SAVE'.
    IF i_plant <> '1000'.
      MESSAGE 'Only Plant 1000 to be used' TYPE 'E' DISPLAY LIKE 'W'.
    ENDIF.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.

TABLES EKKO.

  SELECT SINGLE * FROM EKKO.

ENDMODULE.
