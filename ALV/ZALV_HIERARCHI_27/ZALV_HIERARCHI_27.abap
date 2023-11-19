*&---------------------------------------------------------------------*
*& Report ZALV_HIERARCHI_27
*&https://www.youtube.com/watch?v=TyTWgY0x2Bw&list=PLM3lhmHjSeIRNlA0K56xO9_GTbzj3_T80&index=9
*&
*&---------------------------------------------------------------------*
REPORT zalv_hierarchi_27.

TYPES: BEGIN OF ty_vbak,
         vbeln TYPE vbeln_va,
         erdat TYPE erdat,
         erzet TYPE erzet,
         ernam TYPE ernam,
         vbtyp TYPE vbtyp,
       END OF ty_vbak,

       BEGIN OF ty_vbap,
         vbeln TYPE vbeln_va,
         posnr TYPE posnr,
         matnr TYPE matnr,
       END OF ty_vbap.

DATA: it_vbak     TYPE TABLE OF ty_vbak,
      wa_vbak     TYPE          ty_vbak,
      it_vbap     TYPE TABLE OF ty_vbap,
      wa_vbap     TYPE          ty_vbap,
      it_fieldcat TYPE TABLE OF slis_t_fieldcat_alv,
      wa_fieldcat TYPE          slis_fieldcat_alv,
      lv_vbeln    TYPE          vbeln_va.

SELECT-OPTIONS: so_vbeln FOR lv_vbeln.

SELECT vbeln erdat erzet ernam vbtyp
        FROM vbak
        INTO TABLE it_vbak
        WHERE vbeln IN so_vbeln.
IF it_vbak IS NOT INITIAL.
  SELECT vbeln posnr matnr
          FROM vbap
          INTO TABLE it_vbap
          FOR ALL ENTRIES IN it_vbak
          WHERE vbeln = it_vbak-vbeln.
ENDIF.


wa_fieldcat-col_pos = '1'.
wa_fieldcat-fieldname = 'VBELN'.
wa_fieldcat-tabname = 'IT_VBAK'.
wa_fieldcat-seltext_l = 'Sales Document Number'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '2'.
wa_fieldcat-fieldname = 'Verdat'.
wa_fieldcat-tabname = 'IT_VBAK'.
wa_fieldcat-seltext_l = 'Creation Date'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '3'.
wa_fieldcat-fieldname = 'erzet'.
wa_fieldcat-tabname = 'IT_VBAK'.
wa_fieldcat-seltext_l = 'Time'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '4'.
wa_fieldcat-fieldname = 'ernam'.
wa_fieldcat-tabname = 'IT_VBAK'.
wa_fieldcat-seltext_l = 'User'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '5'.
wa_fieldcat-fieldname = 'vbtyp'.
wa_fieldcat-tabname = 'IT_VBAK'.
wa_fieldcat-seltext_l = 'Category'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '1'.
wa_fieldcat-fieldname = 'VBELN'.
wa_fieldcat-tabname = 'IT_VBAP'.
wa_fieldcat-seltext_l = 'Sales Document Number'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '2'.
wa_fieldcat-fieldname = 'posnr'.
wa_fieldcat-tabname = 'IT_VBAP'.
wa_fieldcat-seltext_l = 'Item Number'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.

wa_fieldcat-col_pos = '3'.
wa_fieldcat-fieldname = 'matnr'.
wa_fieldcat-tabname = 'IT_VBAP'.
wa_fieldcat-seltext_l = 'Material Number'.
APPEND wa_fieldcat TO it_fieldcat.
CLEAR: wa_fieldcat.
