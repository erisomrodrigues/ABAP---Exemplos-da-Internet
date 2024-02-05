*&---------------------------------------------------------------------*
*& Report zpktest
* https://www.youtube.com/watch?v=YtFptRQZz_s -------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpktest.

TYPES: BEGIN OF ts_sbook,
        CARRID TYPE SBOOK-carrid,
        BOOKID  TYPE SBOOK-bookid,
        CUSTOMID    TYPE SBOOK-CUSTOMID,
        PASSNAME    TYPE SBOOK-passname,
       END OF ts_sbook.

*DATA: IT_DK TYPE TABLE OF TS_SBOOK WITH DEFAULT KEY.
DATA: IT_EK TYPE TABLE OF TS_SBOOK WITH EMPTY KEY.

*SELECT CARRID, BOOKID, CUSTOMID, PASSNAME
*         FROM SBOOK
*         INTO TABLE @IT_DK.

SELECT CARRID, BOOKID, CUSTOMID, PASSNAME
         FROM SBOOK
         INTO TABLE @IT_EK.

SORT IT_EK.
BREAK-POINT.
