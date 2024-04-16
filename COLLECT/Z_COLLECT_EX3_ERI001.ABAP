*&---------------------------------------------------------------------*
*& Report Z_COLLECT_EX3_ERI001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_collect_ex3_eri001.

TYPES:
  BEGIN OF ty_soma_a,
    carrid TYPE sflight-carrid,
    connid TYPE sflight-connid,
    fldate TYPE sflight-fldate,
    price  TYPE sflight-price,
  END OF ty_soma_a,

  BEGIN OF ty_soma_b,
    carrid TYPE sflight-carrid,
    connid TYPE sflight-connid,
    price  TYPE sflight-price,
  END OF ty_soma_b.


DATA: it_sflight TYPE TABLE OF sflight,
      it_sfsomaa TYPE TABLE OF ty_soma_a,
      it_sfsomab TYPE TABLE OF ty_soma_b.

DATA: st_sflight TYPE sflight,
      st_sfsomaa TYPE ty_soma_a,
      st_sfsomab TYPE ty_soma_b.

SELECT *
  FROM sflight
  INTO TABLE it_sflight
  UP TO 10 ROWS.

SORT  it_sflight BY carrid ASCENDING
                    connid ASCENDING
                    fldate ASCENDING.

LOOP AT it_sflight INTO st_sflight.
  MOVE-CORRESPONDING st_sflight TO st_sfsomaa.
  COLLECT st_sfsomaa INTO it_sfsomaa.
  MOVE-CORRESPONDING st_sflight TO ST_sfsomab.
  COLLECT st_sfsomab INTO it_sfsomab.
ENDLOOP.

SORT: it_sfsomaa,
      it_sfsomab.

cl_demo_output=>display( it_sfsomaB ).
