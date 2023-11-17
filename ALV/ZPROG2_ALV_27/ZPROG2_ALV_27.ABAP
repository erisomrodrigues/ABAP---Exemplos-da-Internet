*&---------------------------------------------------------------------*
*& Report ZPROG1_ALV_27
*& https://www.youtube.com/watch?v=tznlvKT4EvY&list=PLM3lhmHjSeIRNlA0K56xO9_GTbzj3_T80&index=6
*&
*&---------------------------------------------------------------------*
REPORT ZPROG2_ALV_27.

TYPES: BEGIN OF TY_vbak,
         VBELN    TYPE  VBELN_VA,
         ERDAT    TYPE  ERDAT,
         ERZET    TYPE  ERZET,
         ERNAM    TYPE  ERNAM,
         VBTYP    TYPE  VBTYP,
        END OF ty_vbak,

       BEGIN OF TY_VBAP,
         VBELN    TYPE VBELN_VA,
         POSNR    TYPE POSNR_VA,
         MATNR    TYPE MATNR,
        END OF ty_vbap.


DATA:   IT_VBAK     TYPE TABLE OF ty_vbak,
        WA_VBAK     TYPE          TY_VBAK,
        IT_VBAP     TYPE TABLE OF TY_VBAP,
        WA_VBAP     TYPE          TY_VBAP,
        IT_FIELDCAT TYPE TABLE OF SLIS_T_FIELDCAT_ALV,
        IT_FINAL    TYPE TABLE OF ZSTR_FINAL,
        WA_FINAL    TYPE          ZSTR_FINAL.

DATA:   LV_VBELN  TYPE  VBELN_VA.

SELECT-OPTIONS: SO_VBELN  FOR LV_VBELN.

SELECT  VBELN ERDAT ERZET ERNAM VBTYP
        FROM VBAK
        INTO TABLE it_vbak
        WHERE VBELN IN so_vbeln.

IF wa_vbak IS NOT INITIAL.
  SELECT VBELN POSNR MATNR
          FROM VBAP
          INTO TABLE IT_VBAP
          FOR ALL ENTRIES IN IT_VBAK
          WHERE VBELN = it_vbak-vbeln.

ENDIF.

LOOP AT IT_VBAK INTO wa_vbak.
  LOOP AT IT_VBAP INTO wa_vbap WHERE VBELN = wa_vbak-vbeln.
    wa_final-VBELN = wa_vbak-VBELN.
    wa_final-ERDAT = wa_vbak-ERDAT.
    wa_final-ERZET = wa_vbak-ERZET.
    wa_final-ERNAM = wa_vbak-ERNAM.
    wa_final-VBTYP = wa_vbak-VBTYP.
    wa_final-POSNR = wa_vbap-POSNR.
    wa_final-MATNR = wa_vbap-MATNR.
    APPEND wa_final TO IT_FINAL.
    CLEAR wa_final.
  ENDLOOP.
ENDLOOP.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
   IT_FIELDCAT                        = it_fieldcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = it_final
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
