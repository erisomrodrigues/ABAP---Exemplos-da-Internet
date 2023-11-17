*&---------------------------------------------------------------------*
*& Report ZPROG1_ALV_27
*& https://www.youtube.com/watch?v=GcLiZ7_7Ls0&list=PLM3lhmHjSeIRNlA0K56xO9_GTbzj3_T80&index=2
*&
*&---------------------------------------------------------------------*
REPORT ZPROG1_ALV_27.

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

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
 EXPORTING
*   I_PROGRAM_NAME               =
*   I_INTERNAL_TABNAME           =
   I_STRUCTURE_NAME              = 'ZSTR_FINAL'
*   I_CLIENT_NEVER_DISPLAY       = 'X'
*   I_INCLNAME                   =
*   I_BYPASSING_BUFFER           =
*   I_BUFFER_ACTIVE              =
  CHANGING
    ct_fieldcat                  = IT_FIELDCAT
 EXCEPTIONS
   INCONSISTENT_INTERFACE       = 1
   PROGRAM_ERROR                = 2
   OTHERS                       = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
