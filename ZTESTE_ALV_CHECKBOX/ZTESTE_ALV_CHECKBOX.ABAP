TYPES: BEGIN OF ty_produto,
         codigo TYPE string,
         referencia TYPE string,
         grupo_mercadoria TYPE string,
         agrupador TYPE string,
       END OF ty_produto.

TYPES: BEGIN OF ty_fornecedor,
         fornecedor_id TYPE string,
         nome TYPE string,
       END OF ty_fornecedor.

DATA: lt_produtos TYPE TABLE OF ty_produto,
      lt_fornecedores TYPE TABLE OF ty_fornecedor,
      lt_fornecedores_selecionados TYPE TABLE OF ty_fornecedor,
      lt_dados_filtrados TYPE TABLE OF ty_dados_filtrados.

DATA: lv_produto_codigo TYPE string,
      lv_produto_referencia TYPE string,
      lv_produto_grupo TYPE string,
      lv_produto_agrupador TYPE string.

DATA: lv_fornecedor1 TYPE string,
      lv_fornecedor2 TYPE string,
      lv_fornecedor3 TYPE string.
