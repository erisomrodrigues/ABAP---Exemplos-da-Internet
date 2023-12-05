*&---------------------------------------------------------------------*
*& Report zlc_oo_ex01_classe
*&https://www.youtube.com/watch?v=KyiqHjS-Ou0
*&
*&---------------------------------------------------------------------*
REPORT zlc_oo_ex01_classe.

CLASS lcl_animais DEFINITION.
  PUBLIC SECTION.
    DATA: zespecie TYPE string,
          ztamanho TYPE c.

    METHODS: fazer_barrulho IMPORTING ZESPECIE TYPE STRING,
      correr IMPORTING ZTAMANHO TYPE C.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_animais IMPLEMENTATION.

  METHOD fazer_barrulho.
    WRITE: zespecie , 'FEZ O BARRULHO DELA'.
  ENDMETHOD.
  METHOD correr.
    WRITE: 'ESTÁ CORRENDO E É', ztamanho.
  ENDMETHOD.


ENDCLASS.

START-OF-SELECTION.
  DATA: og_cachorro TYPE REF TO lcl_animais,
        og_gato     TYPE REF TO lcl_animais.

  og_cachorro = NEW lcl_animais( ).
  og_gato = NEW lcl_animais( ).

  og_cachorro->fazer_barrulho( zespecie = 'CACHORRO' ).
  new-LINE.
  og_cachorro->correr( ZTAMANHO = 'G' ).
