*&---------------------------------------------------------------------*
*& Include ZSAPTARGET_MPP1_VOO_TOP                  - Module Pool      ZSAPTARGET_MPP1_VOO
*&---------------------------------------------------------------------*
PROGRAM ZSAPTARGET_MPP1_VOO.

TYPES: BEGIN OF TY_SFLIGHT,
        CARRID TYPE SFLIGHT-carrid,
        CONNID TYPE SFLIGHT-connid,
        FLDATE TYPE SFLIGHT-FLDATE,
        PRICE TYPE SFLIGHT-PRICE,
        CURRENCY TYPE SFLIGHT-currency,
       END OF ty_sflight.

DATA: ST_SFLIGHT TYPE ty_sflight,
      LT_SFLIGHT TYPE TABLE OF ty_sflight.
