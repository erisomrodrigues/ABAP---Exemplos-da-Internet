REPORT z_teste_alv_checkbox.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_data,
             checkbox TYPE c,
             field1   TYPE string,
             field2   TYPE string,
           END OF ty_data.

    TYPES: tt_data TYPE TABLE OF ty_data.

    METHODS: run.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  METHOD run.
    DATA: lt_data TYPE tt_data,
          lo_alv  TYPE REF TO cl_gui_alv_grid.

    " Preencher dados de exemplo
    APPEND VALUE #( checkbox = abap_true  field1 = 'Valor 1' field2 = 'Valor A' ) TO lt_data.
    APPEND VALUE #( checkbox = abap_false field1 = 'Valor 2' field2 = 'Valor B' ) TO lt_data.
    APPEND VALUE #( checkbox = abap_false field1 = 'Valor 3' field2 = 'Valor C' ) TO lt_data.

    " Criar instância do ALV Grid
    TRY.
        cl_gui_alv_grid=>factory(
          IMPORTING
            r_salv_grid = lo_alv
          CHANGING
            t_table      = lt_data ).
      CATCH cx_salv_error.
        RETURN.
    ENDTRY.

    " Adicionar coluna de checkbox
    DATA lo_column TYPE REF TO cl_salv_column_table.
    lo_alv->get_column( 'CHECKBOX' )->set_short_text( 'Select' ).
    lo_alv->get_column( 'CHECKBOX' )->set_short_text( 'Checkbox' ).

    " Exibir ALV Grid
    lo_alv->display( ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: lo_main TYPE REF TO lcl_main.
  CREATE OBJECT lo_main.
  lo_main->run( ).
