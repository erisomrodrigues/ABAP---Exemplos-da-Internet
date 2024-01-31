Para criar um exemplo passo a passo de um ALV Grid com caixa de seleção, permitindo a seleção de até 3 linhas e, em seguida, processando essas linhas em outro ALV usando a tabela SBOOK como exemplo, você pode seguir os passos abaixo. Vou apresentar o código de maneira estruturada para facilitar a compreensão.

Definir Tabelas e Variáveis Globais:

abap
Copy code
DATA: gt_data_sbook TYPE TABLE OF sbook,
      gt_selected_rows TYPE TABLE OF i,
      gt_selected_books TYPE TABLE OF sbook,
      gv_processing_done TYPE abap_bool VALUE abap_false.
Criar o Primeiro ALV Grid (Seleção):

abap
Copy code
DATA: lr_container TYPE REF TO cl_gui_container,
      lr_alv_grid   TYPE REF TO cl_gui_alv_grid.

" Preencha gt_data_sbook com dados de exemplo (se necessário)
" ...

" Crie uma instância do contêiner GUI
CREATE OBJECT lr_container
  EXPORTING
    container_name = 'CONTAINER'.

" Crie uma instância do ALV Grid
CALL METHOD cl_gui_alv_grid=>factory
  EXPORTING
    i_parent      = lr_container
  RECEIVING
    r_grid        = lr_alv_grid.

" Defina o layout para adicionar a coluna de seleção
DATA(lo_layout) = lr_alv_grid->get_layout( ).
lo_layout->set_checkbox_mode( abap_true ).

" Preencha o ALV Grid com os dados
CALL METHOD lr_alv_grid->set_table_for_first_display
  EXPORTING
    is_layout   = lo_layout
  CHANGING
    it_outtab   = gt_data_sbook.

" Registre o evento de seleção de linhas
SET HANDLER on_selection_event FOR lr_alv_grid.
Manipular o Evento de Seleção de Linhas:

abap
Copy code
METHOD on_selection_event.
  " Obtenha as linhas selecionadas
  CALL METHOD lr_alv_grid->get_selected_rows
    IMPORTING
      et_index_rows = gt_selected_rows.

  " Limite a seleção a no máximo 3 linhas
  IF lines( gt_selected_rows ) > 3.
    CLEAR gt_selected_rows.
    MESSAGE 'Selecione no máximo 3 linhas.' TYPE 'I'.
  ENDIF.
ENDMETHOD.
Criar o Segundo ALV Grid (Processamento):

abap
Copy code
DATA: lr_alv_grid2 TYPE REF TO cl_gui_alv_grid.

" Crie uma instância do segundo ALV Grid
CALL METHOD cl_gui_alv_grid=>factory
  EXPORTING
    i_parent      = lr_container
  RECEIVING
    r_grid        = lr_alv_grid2.

" Preencha o segundo ALV Grid com os dados processados
CALL METHOD lr_alv_grid2->set_table_for_first_display
  EXPORTING
    is_layout   = lo_layout
  CHANGING
    it_outtab   = gt_selected_books.

" Exiba o contêiner GUI
CALL METHOD lr_container->set_display_mode( EXPORTING display_mode = 2 ).
Criar um Botão para Processar Seleção:

abap
Copy code
DATA: lr_button TYPE REF TO cl_gui_button.

" Crie um botão para processar a seleção
CREATE OBJECT lr_button
  EXPORTING
    text    = 'Processar Seleção'
    parent  = lr_container
  EXCEPTIONS
    others  = 1.

" Registre o evento de clique do botão
SET HANDLER on_button_click_event FOR lr_button.
Manipular o Evento de Clique do Botão:

abap
Copy code
METHOD on_button_click_event.
  " Processar a seleção
  PERFORM process_selected_books.

  " Atualizar o segundo ALV Grid com os dados processados
  CALL METHOD lr_alv_grid2->refresh_table_display.
ENDMETHOD.
Método para Processar Livros Selecionados:

abap
Copy code
METHOD process_selected_books.
  DATA: lt_selected_books TYPE TABLE OF sbook.

  " Obtenha os dados dos livros selecionados
  LOOP AT gt_selected_rows INTO DATA(lv_row) WHERE lv_row <= 3.
    READ TABLE gt_data_sbook INDEX lv_row INTO DATA(ls_selected_book).
    IF sy-subrc = 0.
      APPEND ls_selected_book TO lt_selected_books.
    ENDIF.
  ENDLOOP.

  " Realize o processamento dos livros (exemplo: exibir na lista de seleção)
  LOOP AT lt_selected_books INTO DATA(ls_book).
    WRITE: / 'Book ID:', ls_book-bookid, 'Title:', ls_book-title.
  ENDLOOP.

  " Atualizar a tabela global com os livros selecionados
  gt_selected_books = lt_selected_books.

  " Indicar que o processamento foi concluído
  gv_processing_done = abap_true.
ENDMETHOD.
Este exemplo ilustra como criar dois ALV Grids, o primeiro para seleção e o segundo para exibir os dados processados. O número de linhas selecionadas é limitado a 3. O código pode ser adaptado conforme necessário para atender aos requisitos específicos do seu aplicativo. Certifique-se de ajustar as estruturas de dados conforme a tabela SBOOK no seu sistema.

User
ALV grid com Caixa de seleção para selecionar no máximo 3 linhas para serem processadas em outro ALV com factory com a tabela sbook usando modularização e declarações inline do abap moderno passo a passo com 
ChatGPT
Vamos criar um exemplo passo a passo de um ALV Grid com caixa de seleção, permitindo a seleção de no máximo 3 linhas. Os dados selecionados serão processados em outro ALV usando modularização e declarações inline do ABAP moderno. Vou apresentar o código com as práticas mais modernas do ABAP.

Declaração de Tabelas e Variáveis Globais:

abap
Copy code
TYPES: BEGIN OF ty_sbook,
         bookid TYPE sbook-bookid,
         title  TYPE sbook-title,
       END OF ty_sbook.

DATA: gt_data_sbook TYPE TABLE OF ty_sbook,
      gt_selected_rows TYPE TABLE OF i,
      gv_processing_done TYPE abap_bool VALUE abap_false,
      gv_max_selection TYPE i VALUE 3.
Criar o Primeiro ALV Grid (Seleção):

abap
Copy code
DATA(lr_container) = cl_gui_container=>new( id = 'CONTAINER' ).

DATA(lr_alv_grid) = cl_gui_alv_grid=>factory(
                     EXPORTING
                       i_parent = lr_container ).

DATA(lo_layout) = VALUE #( BASE lo_layout
                  ( colname = 'BOOKID' sel_mode = 'X' )
                  ( colname = 'TITLE' ) ).

DATA(lr_grid_settings) = VALUE #( BASE lr_grid_settings
                         ( is_layout = lo_layout ) ).

lr_alv_grid->set_table_for_first_display(
  EXPORTING
    i_structure_name = 'TY_SBOOK'
  CHANGING
    it_outtab        = gt_data_sbook
    it_fieldcatalog  = lt_fieldcatalog
    it_sort           = lt_sort
    it_toolbar_excluding = VALUE #( ( 'EXPORT' ) )
  EXCEPTIONS
    others           = 1 ).

" Registre o evento de seleção de linhas
DATA(lo_events) = lr_alv_grid->get_event( ).
DATA(lo_event) = VALUE #( BASE lo_event
                   ( id = cl_gui_alv_grid=>mc_evt_checkbox_select
                     for_program = sy-repid
                     for_handler  = 'ON_SELECT_EVENT' ) ).
APPEND lo_event TO lo_events.
Método para Manipular o Evento de Seleção:

abap
Copy code
METHOD on_select_event.

  " Obtenha as linhas selecionadas
  DATA(lt_selected_rows) = VALUE #( BASE gt_selected_rows ).

  LOOP AT lt_selected_rows INTO DATA(lv_row) WHERE lv_row <= gv_max_selection.
    READ TABLE gt_data_sbook INDEX lv_row INTO DATA(ls_selected_row).
    IF sy-subrc = 0.
      APPEND ls_selected_row TO gt_selected_books.
    ENDIF.
  ENDLOOP.

  " Limite a seleção a no máximo 3 linhas
  IF lines( gt_selected_books ) > gv_max_selection.
    CLEAR gt_selected_books.
    MESSAGE 'Selecione no máximo 3 linhas.' TYPE 'I'.
  ENDIF.

ENDMETHOD.
Criar o Segundo ALV Grid (Processamento):

abap
Copy code
DATA(lr_alv_grid2) = cl_gui_alv_grid=>factory(
                      EXPORTING
                        i_parent = lr_container ).

DATA(lr_grid_settings2) = VALUE #( BASE lr_grid_settings
                          ( is_layout = lo_layout ) ).

" Preencha o segundo ALV Grid com os dados processados
lr_alv_grid2->set_table_for_first_display(
  EXPORTING
    i_structure_name = 'TY_SBOOK'
  CHANGING
    it_outtab        = gt_selected_books
    it_fieldcatalog  = lt_fieldcatalog
    it_sort           = lt_sort
    it_toolbar_excluding = VALUE #( ( 'EXPORT' ) )
  EXCEPTIONS
    others           = 1 ).

" Exiba o contêiner GUI
DATA(lr_container_settings) = VALUE #( BASE lr_container_settings
                               ( parent = lr_container
                                 set_display_mode = 2 ) ).

lr_container->set_display_mode( lr_container_settings ).
Processar Seleção em um Botão:

abap
Copy code
DATA(lr_button) = cl_gui_button=>new( id = 'BUTTON'
                                       text = 'Processar Seleção'
                                       parent = lr_container ).

" Registre o evento de clique do botão
DATA(lo_button_events) = lr_button->get_event( ).
DATA(lo_button_event) = VALUE #( BASE lo_button_event
                        ( id = cl_gui_button=>mc_evt_click
                          for_program = sy-repid
                          for_handler = 'ON_BUTTON_CLICK_EVENT' ) ).
APPEND lo_button_event TO lo_button_events.
Método para Manipular o Evento de Clique do Botão:

abap
Copy code
METHOD on_button_click_event.

  " Processar a seleção
  DATA(lo_process) = VALUE #( BASE lo_process
                      ( id = 'PROCESS_SELECTED_BOOKS'
                        for_program = sy-repid
                        for_method = 'PROCESS_SELECTED_BOOKS' ) ).

  gt_selected_books = VALUE #( BASE gt_selected_books ).

  PERFORM process_selected_books.

  " Atualizar o segundo ALV Grid com os dados processados
  CALL METHOD lr_alv_grid2->refresh_table_display( ).

ENDMETHOD.
Método para Processar Livros Selecionados (Chamada Inline):

abap
Copy code
METHOD process_selected_books CHANGING ct_selected_books TYPE TABLE OF ty_sbook.

  " Realizar o processamento dos livros (exemplo: exibir na lista de seleção)
  LOOP AT ct_selected_books INTO DATA(ls_book).
    WRITE: / 'Book ID:', ls_book-bookid, 'Title:', ls_book-title.
  ENDLOOP.

  " Indicar que o processamento foi concluído
  gv_processing_done = abap_true.

ENDMETHOD.
Este exemplo utiliza declarações inline e práticas modernas do ABAP.
 Certifique-se de ajustar as estruturas de dados conforme a tabela SBOOK no seu sistema. Essa abordagem simplificada visa fornecer um exemplo claro do uso de modularização e recursos modernos do ABAP.
