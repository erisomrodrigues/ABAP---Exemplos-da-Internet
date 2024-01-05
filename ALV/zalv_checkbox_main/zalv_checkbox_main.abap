REPORT ZALV_CHECKBOX_SECOND.

TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add data to ALV
  CALL METHOD gr_grid->set_table_for_first_display
    EXPORTING
      is_layout = gs_layout
    CHANGING
      it_outtab = gt_data[].

ENDFORM.                    " CREATE_ALV_GRID


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add data to ALV
  CALL METHOD gr_grid->set_table_for_first_display
    EXPORTING
      is_layout = gs_layout
    CHANGING
      it_outtab = gt_data[].

ENDFORM.                    " CREATE_AL


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add data to ALV
  CALL METHOD gr_grid->set_table_for_first_display
    EXPORTING
      is_layout = gs_layout
    CHANGING
      it_out


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add data to ALV
  CALL METHOD gr_grid->set_table_for_first_display
    EXPORTING
      is_layout = gs


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add data to ALV
  CALL METHOD gr_grid->set_table_for_first_display


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add data to ALV
 


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE' ).

  " Add


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = 'PRICE


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column( iv_columnname = '


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FLDATE' ).
  gr_columns->add_column


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns->add_column( iv_columnname = 'FL


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname = 'CONNID' ).
  gr_columns


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr_columns->add_column( iv_columnname =


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname = 'CARRID' ).
  gr


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add_column( iv_columnname =


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns->add


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
  gr_columns


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid = gr_grid.

  " Add columns
 


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_layout
    EXPORTING
      i_grid


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORTING
      i_grid


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid.

  CREATE OBJECT gr_columns
    EXPORT


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING
      i_grid = gr_grid


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions
    EXPORTING


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT gr_functions


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

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

  CREATE OBJECT


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,
        gr_layout TYPE REF TO cl_salv_layout.

  CREATE OBJECT gr_container
    EXPORTING
      container_name =


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,
        gr_layout TYPE REF TO cl_salv_layout.

  CREATE OBJECT gr_container
   


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,
        gr_layout TYPE REF TO cl_salv_layout.

  CREATE


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,
        gr_layout TYPE REF TO cl_salv_layout.



TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,
        gr_layout TYPE REF


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF TO cl_salv_columns,


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions,
        gr_columns TYPE REF


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions TYPE REF TO cl_salv_functions


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.
  DATA: gr_functions


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*
FORM create_alv_grid.


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV_GRID
*&---------------------------------------------------------------------*


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&      Form  CREATE_ALV


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&---------------------------------------------------------------------*
*&     


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRIEVE_DATA

*&


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM.                    " RETRI


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = connid.
ENDFORM


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
    AND connid = conn


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid = carrid
   


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
    WHERE carrid =


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM sflight
   


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data
    FROM


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS OF TABLE gt_data


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING FIELDS


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING F


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESPONDING


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price
    INTO CORRESP


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate price


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carrid connid fldate


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
  SELECT carr


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*
FORM retrieve_data.
 


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&---------------------------------------------------------------------*


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA
*&----------------------------------------------------------------


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRIEVE_DATA


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Form  RETRI


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&     


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT

*&----------------------------------------------------------------


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_0100  OUTPUT


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_010


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                    " STATUS_


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

ENDMODULE.                   


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
  ENDIF.

END


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
        it_outtab = gt


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
        it_out


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
       


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
      CHANG


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
        is_layout =


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
       


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
      EXPORT


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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

    CALL METHOD gr_grid->set


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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

   


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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



TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
        it_fieldcatalog = gt_field


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
        it_fieldcatalog


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
       


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

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
      EXPORT


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
  ENDIF.

  IF gr_grid IS NOT INITIAL.
    CALL METHOD gr_grid->set_frontend_field


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
  ENDIF.

  IF gr_grid IS NOT INITIAL.
    CALL METHOD gr_grid->


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
  ENDIF.

  IF gr_grid IS NOT INITIAL.
    CALL METHOD


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
  ENDIF.

  IF gr_grid IS NOT INITIAL.


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
  ENDIF.

  IF gr_grid


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.
 


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid.


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
    PERFORM create_alv_grid


TABLES: sflight.

TYPES: BEGIN OF ty_data,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price TYPE s_price,
       END OF ty_data.

DATA: gt_data TYPE TABLE OF ty_data,
      gs_data TYPE ty_data.

PARAMETERS: carrid TYPE s_carr_id OBLIGATORY,
            connid TYPE s_conn_id OBLIGATORY.

START-OF-SELECTION.

  PERFORM retrieve_data.

  PERFORM create_alv_grid.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.

  SET PF-STATUS 'STANDARD'.

  IF gr_container IS INITIAL.
