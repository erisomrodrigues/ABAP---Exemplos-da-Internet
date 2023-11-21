*&---------------------------------------------------------------------
*& Report ZR0001MCK
*&---------------------------------------------------------------------
*&
*&---------------------------------------------------------------------
REPORT zr0001mck NO STANDARD PAGE HEADING.

" Definir variáveis e selecionar os dados; OK
" Fazer um select options para ter os criterios de pesquisa e conseguir filtrar os dados; OK
" Fazer IF para o idioma que o usuario estiver usando; OK
" Consultar os dados em cada tabela; OK
" Fazer selects para cada tabela; OK
" Criar uma IT pra receber os dados armazenados; OK
" Filtrar dados; OK
" Exibir os dados usando ALV Grid; OK
" Fazer if para mensagem de erro depois do select;OK
" Corrigir possíveis erros colocando mensagem de erro neles e voltando para a tela de preencher os campos;OK

* Definindo tipo de dados;
TYPES: BEGIN OF lt_mara,
         lv_salvar TYPE abap_bool,
         lv_wgbez  TYPE t023t-wgbez,
         lv_maktx  TYPE makt-maktx,
         lv_mtbez  TYPE t134t-mtbez,
         lv_matnr  TYPE mara-matnr,
         lv_matkl  TYPE mara-matkl,
         lv_mtart  TYPE mara-mtart,
       END OF lt_mara.

"Declaração de uma tabela interna (ltz_mara);
DATA: ltz_mara TYPE TABLE OF mara,
      lv_matnr TYPE mara-matnr,
      lv_matkl TYPE mara-matkl,
      lv_mtart TYPE mara-mtart,
      lv_wgbez TYPE t023t-wgbez,
      lv_maktx TYPE makt-maktx,
      lv_mtbez TYPE t134t-mtbez.

DATA: it_fieldcat TYPE slis_t_fieldcat_alv, " Tabela de campos de catálogo para ALV Grid
      wa_fieldcat TYPE slis_fieldcat_alv. " Estrutura para um campo de catálogo

DATA: ls_ztab1mck TYPE ztab1mck.
DATA: ls_mara TYPE mara. "Estrutura ls_mara com base nos dados da mara.
DATA: ls_mara_alv TYPE lt_mara. "Variável ls_mara_alv com base no tipo de dados da lt_mara.
DATA: it_mara_alv TYPE TABLE OF lt_mara. " variável it_mara_alv que é do tipo tabela interna (table of) com base na estrutura de dados da lt_mara.

* Declaração de select-options;
SELECT-OPTIONS: s_matnr FOR lv_matnr,
                s_matkl FOR lv_matkl,
                s_mtart FOR lv_mtart.

START-OF-SELECTION.
  IF s_matnr[] IS INITIAL AND s_matkl[] IS INITIAL AND s_mtart[] IS INITIAL. " Verifica se s_matnr está vazia. Se estiver vazia, o resultado dessa condição será verdadeiro.
    IF sy-langu = 'P'.
      MESSAGE 'Preencha os campos corretamente' TYPE 'S' DISPLAY LIKE 'E'.
    ELSE.
      MESSAGE 'Fill in the fields correctly' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.
  ELSE.

    " Filtra os materiais com base nos critérios definidos pelos valores em s_matnr, s-matkl e mtart.
    SELECT * FROM mara INTO TABLE ltz_mara WHERE
      matnr IN s_matnr AND
      matkl IN s_matkl AND
      mtart IN s_mtart.

    IF ltz_mara[] IS INITIAL. "verifica se a estrutura está vazia (INITIAL) e, se estiver vazia, executa a mensagem de erro.
      IF sy-langu = 'P'.
        MESSAGE 'Nenhum dado encontrado com os critérios de pesquisa.' TYPE 'S' DISPLAY LIKE 'E'.
      ELSE.
        MESSAGE 'No data found with the search criteria.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
    ELSE.

      LOOP AT ltz_mara INTO ls_mara. "Esse loop é usado para passar por todos os registros que foram selecionados da tabela mara e armazenados na tabela interna ltz_mara.
        SELECT SINGLE wgbez FROM t023t INTO lv_wgbez WHERE matkl = ls_mara-matkl AND spras = sy-langu. "Seleciona a descrição de um grupo de mercadorias com base no grupo de mercadorias da
        SELECT SINGLE mtbez FROM t134t INTO lv_mtbez WHERE mtart = ls_mara-mtart AND spras = sy-langu.
        SELECT SINGLE maktx FROM makt INTO lv_maktx WHERE matnr = ls_mara-matnr AND spras = sy-langu.

        ls_mara_alv-lv_matnr = |{ ls_mara-matnr ALPHA = OUT }|.
        ls_mara_alv-lv_mtart = ls_mara-mtart.
        ls_mara_alv-lv_matkl = ls_mara-matkl.
        ls_mara_alv-lv_wgbez = lv_wgbez.
        ls_mara_alv-lv_mtbez = lv_mtbez.
        ls_mara_alv-lv_maktx = lv_maktx.
        ls_mara_alv-lv_salvar = abap_true.

        SELECT SINGLE 
IF sy-subrc = 0.
  ls_mara_alv-lv_salvar = abap_true.
ELSE.
  ls_mara_alv-lv_salvar = abap_false.
ENDIF.

        IF sy-subrc = 0.
        ELSE.

        ENDIF.

        " Adicionar os valores à tabela interna
        APPEND ls_mara_alv TO it_mara_alv.

      ENDLOOP.

      PERFORM f_preenchefieldcat.

      " Filtra os materiais com base nos critérios definidos pelos valores em s_matnr, s_matkl e mtart.
      SELECT * FROM mara INTO TABLE ltz_mara WHERE
        matnr IN s_matnr AND
        matkl IN s_matkl AND
      mtart IN s_mtart.

      " Exibir os dados usando ALV Grid.
      CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
        EXPORTING
          i_callback_pf_status_set = 'F_SET_PF_STATUS'
          i_callback_user_command  = 'F_USER_COMMAND'
          i_callback_program       = sy-repid
          it_fieldcat              = it_fieldcat
        TABLES
          t_outtab                 = it_mara_alv.
    ENDIF.
  ENDIF.

FORM f_set_pf_status USING xt_excluding_merged.

  SET PF-STATUS 'STANDARD'.

ENDFORM.

FORM f_USER_COMMAND USING r_ucomm   LIKE sy-ucomm
                          rs_selfield TYPE slis_selfield.

  DATA: ls_ztab1mck TYPE ztab1mck. "declarando variável, ela é do tipo ztab1mck.
  DATA: it_ztab1mck TYPE TABLE OF ztab1mck.

  CASE r_ucomm. "usa o case para verificar o valor de r_ucomm(um comando do usuário).
    WHEN 'SAVE'. "quando o comando do usuário for 'SAVE', o código entra neste bloco.
      LOOP AT it_mara_alv INTO ls_mara_alv. "Inicia um loop sobre a it_mara_alv.
        ls_ztab1mck-matnr = ls_mara_alv-lv_matnr. " os valores da tabela it_mara_alv são atribuídos a campos da estrutura ls_ztab1mck.
        ls_ztab1mck-matkl = ls_mara_alv-lv_matkl.
        ls_ztab1mck-mtart = ls_mara_alv-lv_mtart.
        ls_ztab1mck-wgbez = ls_mara_alv-lv_wgbez.
        ls_ztab1mck-maktx = ls_mara_alv-lv_maktx.
        ls_ztab1mck-mtbez = ls_mara_alv-lv_mtbez.

        MODIFY ztab1mck FROM TABLE it_ztab1mck. "a tabela ztab1mck é modificada com os dados da estrutura ls_ztab1mck.

        IF sy-subrc = 0. "se o status da operação for = 0, significa que funcionou.
          IF sy-langu = 'P'.
            MESSAGE 'Dados salvos com sucesso' TYPE 'S'. "exibe uma mensagem de sucesso, mostrando que os dados foram salvos.
          ELSE .
            MESSAGE 'Data saved successfully' TYPE 'S'. "exibe uma mensagem de sucesso, mostrando que os dados foram salvos.
          ENDIF.

        ENDIF.
      ENDLOOP.
MODIFY ztab1mck FROM TABLE it_ztab1mck.

      CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
        EXPORTING
          i_callback_pf_status_set = 'F_SET_PF_STATUS'
          i_callback_user_command  = 'F_USER_COMMAND'
          i_callback_program       = sy-repid
          it_fieldcat              = it_fieldcat
        TABLES
          t_outtab                 = it_mara_alv.

  ENDCASE.
ENDFORM.

FORM f_preenchefieldcat.
  IF sy-langu = 'P'.

    "configurando uma série de campos de catálogo (wa_fieldcat) que serão usados em um relatório/exibição de dados em português.
    wa_fieldcat-fieldname = 'LV_MATNR'.
    wa_fieldcat-seltext_m = 'Nº Material'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MAKTX'.
    wa_fieldcat-seltext_m = 'Descrição Material'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MATKL'.
    wa_fieldcat-seltext_m = 'Grupo Mercadorias'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_WGBEZ'.
    wa_fieldcat-seltext_m = 'Desc. Grupo Merc.'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MTART'.
    wa_fieldcat-seltext_m = 'Tipo Material'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MTBEZ'.
    wa_fieldcat-seltext_m = 'Desc. Tipo Material'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_SAVED'.
    wa_fieldcat-seltext_m = 'Salvo'.
    wa_fieldcat-outputlen = 1.
    APPEND wa_fieldcat TO it_fieldcat.

  ELSE.

    "configurando uma série de campos de catálogo (wa_fieldcat) que serão usados em um relatório/exibição de dados em inglês.
    wa_fieldcat-fieldname = 'LV_MATNR'.
    wa_fieldcat-seltext_m = 'Material No.'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MAKTX'.
    wa_fieldcat-seltext_m = 'Material Description'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MATKL'.
    wa_fieldcat-seltext_m = 'Merchandise Group'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_WGBEZ'.
    wa_fieldcat-seltext_m = 'Merchandise Group Description.'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MTART'.
    wa_fieldcat-seltext_m = 'Material Type'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_MTBEZ'.
    wa_fieldcat-seltext_m = 'Description Type Material'.
    APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LV_SAVED'.
    wa_fieldcat-seltext_m = 'Saved'.
    wa_fieldcat-outputlen = 1.
    APPEND wa_fieldcat TO it_fieldcat.

  ENDIF.
ENDFORM.
