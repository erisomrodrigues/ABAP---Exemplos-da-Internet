*&---------------------------------------------------------------------*
*& Report Z_ABAS_TELA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_abas_tela.
TABLES: sbook.

SELECTION-SCREEN BEGIN OF SCREEN 110 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

    SELECT-OPTIONS: s_carrid  FOR sbook-carrid NO INTERVALS,
                    s_connid  FOR sbook-connid NO INTERVALS.

  SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 110.

SELECTION-SCREEN BEGIN OF SCREEN 120 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

    SELECT-OPTIONS: s_agency FOR sbook-agencynum NO INTERVALS,
                    s_psname FOR sbook-passname  NO INTERVALS.

  SELECTION-SCREEN END OF BLOCK b2.
SELECTION-SCREEN END OF SCREEN 120.

SELECTION-SCREEN BEGIN OF TABBED BLOCK TAB_BLOCK FOR 13  LINES.
  SELECTION-SCREEN TAB (20) TAB1 USER-COMMAND COMM1 DEFAULT SCREEN 110.
  SELECTION-SCREEN TAB (20) TAB2 USER-COMMAND COMM2 DEFAULT SCREEN 120.
SELECTION-SCREEN END OF BLOCK TAB_BLOCK.

INITIALIZATION.
  TAB1 = 'Dados Vôo'.
  TAB2 = 'Dados Cliente'.
  TAB_BLOCK-ACTIVETAB = 'COMM1'.
  TAB_BLOCK-DYNNR = '110'.

START-OF-SELECTION.
SELECT CARRID, CONNID, AGENCYNUM, PASSNAME
      FROM SBOOK
      INTO TABLE @DATA(LT_SBOOK)
      WHERE CARRID IN @s_carrid
      AND   CONNID IN @s_connid
      AND   agencynum IN @s_agency
      AND   passname IN @s_psname.

CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table   = DATA(lo_alv)                          " Basis Class Simple ALV Tables
  CHANGING
    t_table        = lt_sbook[].

DATA(LO_FUNCTIONS) = LO_ALV->get_functions( ).
lo_functions->set_all( ).
LO_ALV->display( ).
