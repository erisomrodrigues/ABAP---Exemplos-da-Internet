*&---------------------------------------------------------------------*
*& Report ZRELATORIO_01
*&https://www.youtube.com/watch?v=jAqCFrkaFK0&t=403s
*&
*&---------------------------------------------------------------------*
REPORT zrelatorio_01.

* Declaração
DATA: lt_scarr       TYPE TABLE OF scarr,
      ls_scarr       TYPE          scarr,
      lt_scarr_final TYPE TABLE OF scarr,
      ls_scarr_final TYPE          scarr.

* Selecção dos dados

SELECT *
        FROM SCARR
        INTO TABLE LT_SCARR.


* Leitura e tratamento dos dados
loop at lt_scarr into ls_scarr.
ls_scarr_final-carrid = ls_scarr-carrid.
ls_scarr_final-carrname = ls_scarr-carrname.
ls_scarr_final-currcode = ls_scarr-currcode.
ls_scarr_final-url = ls_scarr-url.
append ls_scarr_final to lt_scarr_final.
endloop.


* Apresentação dos dados na tela
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING

   I_STRUCTURE_NAME                   = 'SCARR'

  TABLES
    t_outtab                          = lt_scarr_final.
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc = 0.
* Implement suitable error handling here
  MESSAGE 'SEM DADOS' TYPE 'E'.
ENDIF.
