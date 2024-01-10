*&---------------------------------------------------------------------*
*& Report  ZPOOL_PROGRAMA
*&---------------------------------------------------------------------*
REPORT ZPOOL_PROGRAMA.

TYPES: BEGIN OF ty_data,
         selected TYPE abap_bool,
         field1   TYPE string,
         field2   TYPE string,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

MODULE STATUS_0100 OUTPUT.

  SET PF-STATUS 'ALV_PF_STATUS'.

ENDMODULE.

MODULE USER_COMMAND_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.
  ENDCASE.

ENDMODULE.

MODULE alv_output OUTPUT.

  DATA: lr_salv_table TYPE REF TO cl_salv_table,
        lt_columns    TYPE TABLE OF salv_developer_column,
        lt_layout     TYPE salv_s_layout_info,
        lv_rc         TYPE salv_s_layout_variant,
        lv_subrc      TYPE subrc.

  " Popula a tabela de dados para o ALV
  gs_data-field1 = 'Valor1'.
  APPEND gs_data TO gt_data.

  gs_data-field1 = 'Valor2'.
  APPEND gs_data TO gt_data.

  gs_data-field1 = 'Valor3'.
  APPEND gs_data TO gt_data.

  " Cria a instância do CL_SALV_TABLE
  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lr_salv_table
    CHANGING
      t_table      = gt_data.

  " Adiciona uma coluna para os checkboxes
  CLEAR lt_columns.
  lt_columns-fieldname = 'SELECTED'.
  lt_columns-col_pos   = 1.
  APPEND lt_columns TO lt_columns.

  " Adiciona outras colunas conforme necessário
  CLEAR lt_columns.
  lt_columns-fieldname = 'FIELD1'.
  lt_columns-col_pos   = 2.
  APPEND lt_columns TO lt_columns.

  CLEAR lt_columns.
  lt_columns-fieldname = 'FIELD2'.
  lt_columns-col_pos   = 3.
  APPEND lt_columns TO lt_columns.

  " Define o layout da tabela
  CALL METHOD lr_salv_table->get_layout
    RECEIVING
      layout = lt_layout.

  " Ajusta a largura da coluna com os checkboxes
  LOOP AT lt_layout-colinfo INTO DATA(ls_colinfo).
    IF ls_colinfo-col_pos = 1.
      ls_colinfo-width = 5.
      MODIFY lt_layout-colinfo FROM ls_colinfo TRANSPORTING width WHERE col_pos = 1.
      EXIT.
    ENDIF.
  ENDLOOP.

  " Exibe o ALV
  CALL METHOD lr_salv_table->display.

ENDMODULE.













*&---------------------------------------------------------------------*
*& Report  ZSELECAO_PROGRAMA
*&---------------------------------------------------------------------*
REPORT ZSELECAO_PROGRAMA.

TYPES: BEGIN OF ty_selected,
         selected TYPE abap_bool,
         field1   TYPE string,
       END OF ty_selected.

TYPES: BEGIN OF ty_data,
         field1 TYPE string,
         field2 TYPE string,
       END OF ty_data.

DATA: gt_selected TYPE TABLE OF ty_selected,
      gs_selected TYPE ty_selected,
      gt_data      TYPE TABLE OF ty_data,
      gs_data      TYPE ty_data,
      gv_field1    TYPE string.

PARAMETERS: pv_field1 TYPE string.

START-OF-SELECTION.

  " Popula a tabela de dados para o segundo ALV
  gs_data-field1 = 'Valor1'.
  gs_data-field2 = 'Outro Valor1'.
  APPEND gs_data TO gt_data.

  gs_data-field1 = 'Valor2'.
  gs_data-field2 = 'Outro Valor2'.
  APPEND gs_data TO gt_data.

  gs_data-field1 = 'Valor3'.
  gs_data-field2 = 'Outro Valor3'.
  APPEND gs_data TO gt_data.

  " Popula a tabela com os valores selecionados
  LOOP AT gt_data INTO gs_data WHERE field1 = pv_field1 AND selected = abap_true.
    MOVE-CORRESPONDING gs_data TO gs_selected.
    APPEND gs_selected TO gt_selected.
  ENDLOOP.

  " Exibe o segundo ALV
  PERFORM display_second_alv USING gt_selected.

FORM display_second_alv USING pt_data TYPE TABLE OF ty_selected.

  DATA: lr_salv_table TYPE REF TO cl_salv_table,
        lt_columns    TYPE TABLE OF salv_developer_column,
        lt_layout     TYPE salv_s_layout_info.

  " Cria a instância do CL_SALV_TABLE para o segundo ALV
  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = lr_salv_table
    CHANGING
      t_table      = pt_data.

  " Adiciona colunas conforme necessário
  CLEAR lt_columns.
  lt_columns-fieldname = 'FIELD1'.
  lt_columns-col_pos   = 1.
  APPEND lt_columns TO lt_columns.

  CLEAR lt_columns.
  lt_columns-fieldname = 'FIELD2'.
  lt_columns-col_pos   = 2.
  APPEND lt_columns TO lt_columns.

  " Define o layout da tabela
  CALL METHOD lr_salv_table->get_layout
    RECEIVING
      layout = lt_layout.

  " Exibe o segundo ALV
  CALL METHOD lr_salv_table->display.

ENDFORM.
