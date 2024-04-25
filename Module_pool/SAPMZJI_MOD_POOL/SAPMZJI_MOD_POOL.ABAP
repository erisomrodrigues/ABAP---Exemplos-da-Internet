*&---------------------------------------------------------------------*
*& Modulpool SAPMZJI_MOD_POLL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM SAPMZJI_MOD_POOL.

DATA: IN_MATNR TYPE MATNR, C_M1 TYPE C, C_M2 TYPE C.
DATA: OKCODE_100 TYPE SY-UCOMM.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.


  C_M1 = 'X'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  PAI_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pai_0100 INPUT.

  IF OKCODE_100 = 'FCT_GET'.
    IF C_M1 = 'X'.
    SELECT * FROM MARA INTO TABLE @DATA(IT_MARA)
            WHERE MTART = 'FERT'.
    ENDIF.

  ELSEIF okcode_100 = 'FCT_EXIT'.
     LEAVE PROGRAM.
  ENDIF.
ENDMODULE.
