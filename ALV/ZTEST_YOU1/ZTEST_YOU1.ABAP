*&---------------------------------------------------------------------*
*& Report ZTEST_YOU1
*& https://www.youtube.com/watch?v=uHNk46I-viM
*&
*&---------------------------------------------------------------------*
REPORT ztest_you1.
PARAMETERS: p_ebeln TYPE ekko-ebeln.

TYPES: BEGIN OF ty_final,
         ebeln TYPE  ekko-ebeln,
         bukrs TYPE  ekko-bukrs,
         bstyp TYPE  ekko-bstyp,
         bsart TYPE  ekko-bsart,
         lifnr TYPE  ekko-lifnr,
         ebelp TYPE  ekpo-ebelp,
         matnr TYPE  ekpo-matnr,
         werks TYPE  ekpo-werks,
         lgort TYPE  ekpo-lgort,
         matkl TYPE  ekpo-matkl,
         netwr TYPE  ekpo-netwr,
         maktx TYPE  makt-maktx,
         name1 TYPE  t001w-name1,
         lgobe TYPE  t001l-lgobe,

       END OF ty_final.

TYPE-POOLS slis.
DATA: it_ekko     TYPE TABLE OF ekko,
      wa_ekko     TYPE          ekko,
      it_ekpo     TYPE TABLE OF ekpo,
      wa_ekpo     TYPE          ekpo,
      it_makt     TYPE TABLE OF makt,
      wa_makt     TYPE          makt,
      it_t001w    TYPE TABLE OF t001w,
      wa_t001w    TYPE          t001w,
      it_t001l    TYPE TABLE OF t001l,
      wa_t001l    TYPE          t001l,
      it_final    TYPE TABLE OF ty_final,
      wa_final    TYPE          ty_final,
      it_fieldcat TYPE TABLE OF slis_fieldcat_alv,
      wa_fieldcat TYPE          slis_fieldcat_alv.

SELECT *
        FROM ekko
        INTO TABLE it_ekko
        WHERE ebeln = p_ebeln.

IF it_ekko IS NOT INITIAL.
  SORT it_ekko  BY  ebeln.

  SELECT *
           FROM ekpo
           INTO TABLE it_ekpo
           FOR ALL ENTRIES IN it_ekko
           WHERE ebeln = it_ekko-ebeln.

  IF it_ekpo IS NOT INITIAL.
    SORT it_ekpo BY matnr.

    SELECT *
            FROM makt
            INTO TABLE it_makt
            FOR ALL ENTRIES IN it_ekpo
            WHERE matnr = it_ekpo-matnr.

    SORT it_ekpo BY WERKS LGORT.

    SELECT *
            FROM t001l
            INTO TABLE it_t001l
            FOR ALL ENTRIES IN it_ekpo
            WHERE werks = it_ekpo-werks
            AND lgort = it_ekpo-lgort.

   SELECT *
            FROM T001W
     INTO TABLE it_t001w
     FOR ALL ENTRIES IN IT_EKPO
     WHERE WERKS = IT_EKPO-werks.

  ENDIF.

ENDIF.
LOOP AT it_ekpo INTO wa_ekpo.
  CLEAR wa_ekko.
  READ TABLE it_ekko INTO wa_ekko WITH KEY ebeln = wa_ekpo-ebeln.
  CLEAR wa_makt.
  READ TABLE it_makt INTO wa_makt WITH KEY matnr = wa_ekpo-matnr.
  CLEAR wa_t001l.
  READ TABLE it_t001l INTO wa_t001l WITH KEY werks = wa_ekpo-werks
                                            lgort = wa_ekpo-lgort.
  CLEAR WA_T001W.
  READ TABLE it_t001W INTO wa_t001W WITH KEY werks = wa_ekpo-werks.



  wa_final-ebeln = wa_ekko-ebeln.
  wa_final-matnr = wa_ekpo-matnr.
  wa_final-maktx = wa_makt-maktx.
  wa_final-bukrs = wa_ekko-bukrs.
  wa_final-bstyp = wa_ekko-bstyp.
  wa_final-bsart = wa_ekko-bsart.
  wa_final-lifnr = wa_ekko-lifnr.
  wa_final-ebelp = wa_ekpo-ebelp.
  wa_final-werks = wa_ekpo-werks.
  wa_final-lgort = wa_ekpo-lgort.
  wa_final-netwr = wa_ekpo-netwr.
  wa_final-matkl = wa_ekpo-matkl.
  wa_final-lgobe = wa_t001l-lgobe.
  wa_final-NAME1 = WA_T001W-NAME1.


  APPEND wa_final TO it_final.
  CLEAR wa_final.
ENDLOOP.

wa_fieldcat-fieldname = 'EBELN'.
wa_fieldcat-seltext_l = 'PURCHASING ORDER NUMR'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'BUKRS'.
wa_fieldcat-seltext_l = 'COMPANY CODE'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'BSTYP'.
wa_fieldcat-seltext_l = 'PURCHASING DOCUMENT CATEGORY'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'BSARTS'.
wa_fieldcat-seltext_l = 'PURCHASING DOCUMENT TYPE'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'LIFNR'.
wa_fieldcat-seltext_l = 'PURCHASING DOCUMENT TYPE'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'MATNR'.
wa_fieldcat-seltext_l = 'VENDOR ACCOUNT NUMBER'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'MAKTX'.
wa_fieldcat-seltext_l = 'MATERIAL DISCRPTION'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'EBELP'.
wa_fieldcat-seltext_l = 'ITEM NUMBER OF PURSHASING DOCUMENT'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'WERKS'.
wa_fieldcat-seltext_l = 'PALNT'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'NAM1'.
wa_fieldcat-seltext_l = 'PALNT DESCRPTIN'.
APPEND wa_fieldcat TO it_fieldcat.


wa_fieldcat-fieldname = 'LGORT'.
wa_fieldcat-seltext_l = 'STORAGE LOCATION'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'LGOBE'.
wa_fieldcat-seltext_l = 'STORAGE LOCATION DESCRIPTION'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'NETWR'.
wa_fieldcat-seltext_l = 'NET ORDER VALUE'.
APPEND wa_fieldcat TO it_fieldcat.


wa_fieldcat-fieldname = 'MATKL'.
wa_fieldcat-seltext_l = 'MATERIAL GROUP'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'NAME1'.
wa_fieldcat-seltext_l = 'NAME '.
APPEND wa_fieldcat TO it_fieldcat.


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
*     I_CALLBACK_PROGRAM                = ' '
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
*     IS_LAYOUT                         =
it_fieldcat                        = it_fieldcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           =
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
*     IT_EVENTS                         =
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
TABLES
t_outtab                                = it_final.
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
*            .
  IF sy-subrc <> 0.
  MESSAGE 'WITHOUT REGISTS' TYPE 'E'.
* Implement suitable error handling here
  ENDIF.
