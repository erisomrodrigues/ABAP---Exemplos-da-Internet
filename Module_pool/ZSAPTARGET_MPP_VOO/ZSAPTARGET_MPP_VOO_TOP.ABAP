*&---------------------------------------------------------------------*
*& Include ZSAPTARGET_MPP_VOO_TOP                   - Module Pool      ZSAPTARGET_MPP_VOO
*&---------------------------------------------------------------------*
PROGRAM ZSAPTARGET_MPP_VOO.

TYPES: BEGIN OF TY_SFLIGHT,
        CARRID    TYPE SFLIGHT-carrid,
        CONNID    TYPE SFLIGHT-connid,
        FLDATE    TYPE SFLIGHT-fldate,
        PRICE     TYPE SFLIGHT-PRICE,
        CURRENCY  TYPE SFLIGHT-currency,
       END OF ty_sflight.

DATA: ST_SFLIGHT  TYPE ty_sflight,
      IN_CARRID   TYPE SFLIGHT-CARRID,
      IN_CONNID   TYPE SFLIGHT-CONNID.
