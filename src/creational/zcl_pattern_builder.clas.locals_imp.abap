*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_product DEFINITION.
  PUBLIC SECTION.
    DATA:
      mv_header TYPE string,
      mv_footer TYPE string,
      mv_text   TYPE string.
    METHODS:
      write RETURNING VALUE(rv_value) TYPE string.
ENDCLASS.       "lcl_product DEFINITION

CLASS lcl_builder DEFINITION.
  PUBLIC SECTION.
    METHODS:
      init_product RETURNING VALUE(ro_builder) TYPE REF TO lcl_builder,
      set_header
        IMPORTING iv_header         TYPE string
        RETURNING VALUE(ro_builder) TYPE REF TO lcl_builder,
      set_footer
        IMPORTING iv_footer         TYPE string
        RETURNING VALUE(ro_builder) TYPE REF TO lcl_builder,
      set_text
        IMPORTING iv_text           TYPE string
        RETURNING VALUE(ro_builder) TYPE REF TO lcl_builder,
      get_product RETURNING VALUE(ro_product) TYPE REF TO lcl_product.
  PRIVATE SECTION.
    DATA:
      mo_product TYPE REF TO lcl_product.
ENDCLASS.       "lcl_builder DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_product IMPLEMENTATION.
  METHOD write.
    rv_value = 'HDR: ' && mv_header && ' FTR: ' && mv_footer && ' TXT: ' && mv_text.
  ENDMETHOD.
ENDCLASS.       "lcl_product IMPLEMENTATION

CLASS lcl_builder IMPLEMENTATION.
  METHOD init_product.
    mo_product = NEW #( ).
    ro_builder = me.
  ENDMETHOD.

  METHOD set_header.
    IF mo_product IS NOT BOUND.
      init_product( ).
    ENDIF.

    mo_product->mv_header = iv_header.
    ro_builder = me.
  ENDMETHOD.

  METHOD set_footer.
    IF mo_product IS NOT BOUND.
      init_product( ).
    ENDIF.

    mo_product->mv_footer = iv_footer.
    ro_builder = me.
  ENDMETHOD.

  METHOD set_text.
    IF mo_product IS NOT BOUND.
      init_product( ).
    ENDIF.

    mo_product->mv_text = iv_text.
    ro_builder = me.
  ENDMETHOD.

  METHOD get_product.
    ro_product = mo_product.
  ENDMETHOD.
ENDCLASS.       "lcl_builder IMPLEMENTATION
