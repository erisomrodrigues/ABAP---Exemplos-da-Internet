*&---------------------------------------------------------------------*
*& Report ZTESTE00
*&--https://www.youtube.com/watch?v=9gWF635pPZ0
*&
*&---------------------------------------------------------------------*
REPORT ZTESTE00.

TABLES: EKKO.

SELECT-OPTIONS: S_EBELN FOR EKKO-ebeln.

START-OF-SELECTION.

SELECT a~ebeln, a~lifnr, a~aedat,
       b~ebelp, b~matnr, b~txz01, b~menge, b~netpr
        FROM EKKO AS A INNER JOIN EKPO AS B ON A~ebeln = B~ebeln
        INTO TABLE @DATA(GT_PO) UP TO 30 ROWS
        WHERE MATNR NE ''.

  LOOP AT GT_PO ASSIGNING FIELD-SYMBOL(<FS1>) GROUP BY <FS1>-ebeln ASCENDING.

    WRITE:/ <FS1>-EBELN COLOR 5.

    LOOP AT GROUP <FS1> ASSIGNING FIELD-SYMBOL(<FS2>).
      WRITE:/ '', <FS2>-ebelp, <FS2>-matnr, <FS2>-txz01, <FS2>-netpr.
    ENDLOOP.
    ULINE.
    ENDLOOP.
