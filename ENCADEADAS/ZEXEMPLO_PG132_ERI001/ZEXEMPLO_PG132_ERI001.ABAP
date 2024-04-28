*&---------------------------------------------------------------------*
*& Report ZEXEMPLO_PG132_ERI001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEXEMPLO_PG132_ERI001.

*DATA V_NAME(20) TYPE C.
*DATA: V_AGE TYPE I.
*DATA: V_TOTAL TYPE C.

"Também pode ser escrito
DATA: V_NAME(20) TYPE C,
      V_AGE       TYPE I,
      V_TOTAL     TYPE I.

*V_TOTAL = V_TOTAL + 1.
*V_TOTAL = V_TOTAL + 2.
*V_TOTAL = V_TOTAL + 3.
*V_TOTAL = V_TOTAL + 4.

"Também pode ser escrito
V_Total = v_total + : 1,2,3,4.
WRITE:/ 'O TOTAL É: ', v_total.
