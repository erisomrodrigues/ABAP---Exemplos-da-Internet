*&---------------------------------------------------------------------*
*& Report ZDEMO_NEW_ABAP_SYNTAX
*&https://www.youtube.com/watch?v=cWHHNvKF9Uo
*&
*&---------------------------------------------------------------------*
REPORT ZDEMO_NEW_ABAP_SYNTAX.

TABLES: BKPF.

SELECTION-SCREEN BEGIN OF BLOCK BL1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: SO_BUKRS FOR BKPF-bukrs,
                  SO_BELNR FOR BKPF-belnr,
                  SO_GJAHR FOR BKPF-gjahr.
SELECTION-SCREEN END OF BLOCK BL1.


START-OF-SELECTION.

SELECT *
        FROM BKPF
        INTO TABLE @DATA(LT_BKPF)
        WHERE bukrs IN @so_bukrs
        AND   belnr IN @so_belnr
        AND   gjahr IN @so_gjahr.

  SORT lt_bkpf BY bukrs belnr gjahr.

" Exemplo abaixo equivale ao read table
*  TRY.
*    DATA(GV_BUKRS) = LT_BKPF[ 1 ]-bukrs.
*    CATCH CX_ROOT.
*  ENDTRY.
*
*  WRITE: / gv_bukrs.

  IF lt_bkpf[] IS NOT INITIAL.
  "LINE ITEMS DATA
  SELECT *
          FROM BSEG
          INTO TABLE @DATA(LT_BSEG)
          FOR ALL ENTRIES IN @lt_bkpf
          WHERE bukrs = @lt_bkpf-bukrs
          AND   BELNR = @lt_bkpf-belnr
          AND   GJAHR = @lt_bkpf-gjahr.


  LOOP AT lt_bkpf INTO DATA(LS_BKPF).

  TRY.
     DATA(LS_BSEG) = lt_bseg[ bukrs = LS_BKPF-bukrs
                              BELNR = LS_BKPF-BELNR
                              gjahr = LS_BKPF-gjahr ].
  CATCH CX_ROOT.
  ENDTRY.

  CLEAR: ls_bkpf.
  ENDLOOP.
  ENDIF.
