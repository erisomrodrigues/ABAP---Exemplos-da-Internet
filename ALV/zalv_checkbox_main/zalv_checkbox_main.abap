REPORT ZALV_CHECKBOX_MAIN.

TYPES: BEGIN OF ty_data,
         checkbox TYPE abap_bool,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data,
      gr_container TYPE REF TO cl_gui_custom_container,
      gr_grid TYPE REF TO cl_gui_alv_grid,
      gr_events TYPE REF TO cl_gui_alv_grid_event,
      gv_checkbox_col TYPE salv_s_col,
      gv_checkbox_value TYPE abap_bool.

START-OF-SELECTION.

  PERFORM initialize_data.

  PERFORM create_alv_grid.

  CALL SCREEN 100.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
  ENDIF.

  IF gr_grid IS NOT INITIAL.
    CALL METHOD gr_grid->set_frontend_fieldcatalog
      EXPORTING
        it_fieldcatalog = gt_fieldcat[].

    CALL METHOD gr_grid->set_table_for_first_display
      EXPORTING
        is_layout = gs_layout
      CHANGING
        it_outtab = gt_data[].

    SET HANDLER grid_click_event FOR gr_events.
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'BACK' OR 'EXIT'.
      LEAVE TO SCREEN 0.

    WHEN OTHERS.
      PERFORM handle_user_command.

  ENDCASE.

ENDMODULE.                    " USER_COMMAND_0100  INPUT

*&---------------------------------------------------------------------*
*&      Form  INITIALIZE_DATA
*&---------------------------------------------------------------------*
FORM initialize_data.
  CLEAR: gs_data, gt_data.

  gs_data-checkbox = abap_false.
  gs_data-carrid = 'AA'.
  gs_data-connid = '001'.
  APPEND gs_data TO gt_data.

  gs_data-checkbox = abap_true.
  gs_data-carrid = 'BA'.
  gs_data-connid = '002'.
  APPEND gs_data TO gt_data.

  gs_data-checkbox = abap_false.
  gs_data-carrid = 'CA'.
  gs_data-connid = '003'.
  APPEND gs_data TO gt_data.

  gs_data-checkbox = abap_true.
  gs_data-carrid = 'DA'.
  gs_data-connid = '004'.
  APPEND gs_data TO gt_data.
ENDFORM.                    " INITIALIZE_DATA

*&---------------------------------------------------------------------*
*&      Form  HANDLE_USER_COMMAND
*&---------------------------------------------------------------------*
FORM handle_user_command.
  DATA: lt_selected_rows TYPE TABLE OF salv_s_row.

  CASE gr_events->mv_event_id.
    WHEN if_salv_c_grid_event=>g_event_id_checkbox.
      CLEAR lt_selected_rows.
      CALL METHOD gr_grid->get_selected_rows
        RECEIVING
          et_index_rows = lt_selected_rows.

      LOOP AT lt_selected_rows INTO DATA(ls_selected_row).
        READ TABLE gt_data INTO gs_data INDEX ls_selected_row-index.
        IF sy-subrc = 0.
          gv_checkbox_value = gs_data-checkbox.
          " Do something with the checkbox value (gv_checkbox_value)
          WRITE: / 'Checkbox Value:', gv_checkbox_value.
        ENDIF.
      ENDLOOP.

      " Call the second report with the selected values
      PERFORM call_second_report USING gv_checkbox_value.

  ENDCASE.
ENDFORM.                    " HANDLE_USER_COMMAND

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,
        gr_layout TYPE REF TO cl_salv_layout.

  CREATE OBJECT gr_container
    EXPORTING
      container_name = 'CONTAINER'.

  CREATE OBJECT gr_grid
    EXPORTING
      i_parent = gr_container.

  CREATE OBJECT gr_events
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  SET HANDLER grid_click_event FOR gr_events.

  " Add checkbox column
  CLEAR gv_checkbox_col.
  gv_checkbox_col-checkbox_fieldname = 'CHECKBOX'.
  gr_columns->add_checkbox_column( gv_checkbox_col ).

  " Add other columns as needed
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).

  " Add data to ALV
  CALL METHOD gr_grid->set_table_for_first_display
    EXPORTING
      is_layout = gs_layout
    CHANGING
      it_outtab = gt_data[].

ENDFORM.                    " CREATE_ALV_GRID

*&---------------------------------------------------------------------*
*&      Form  CALL_SECOND_REPORT
*&---------------------------------------------------------------------*
FORM call_second_report USING pv_checkbox_value TYPE abap_bool.
  DATA: lv_filter_carrid TYPE s_carr_id,
        lv_filter_connid TYPE s_conn_id.

  " Use the checkbox value as a filter
  IF pv_checkbox_value = abap_true.
    lv_filter_carrid = 'BA'.
  ELSE.
    lv_filter_carrid = 'AA'.
  ENDIF.

  " Pass the filter values to the second report
  SUBMIT ZALV_CHECKBOX_SECOND
    WITH carrid = lv_filter_carrid
    WITH connid = lv_filter_connid
    AND RETURN.
ENDFORM.                    " CALL_SECOND_REPORT
