*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcx_error DEFINITION INHERITING FROM cx_static_check.
  PUBLIC SECTION.
    CONSTANTS:
      gc_no_data TYPE string VALUE 'Data not found',
      gc_no_auth TYPE string VALUE 'No authorization'.
    METHODS:
      get_text REDEFINITION.
    CLASS-METHODS:
      raise IMPORTING iv_text TYPE string
            RAISING   lcx_error.
  PRIVATE SECTION.
    DATA:
        mv_text TYPE string.
ENDCLASS.       "lcx_error DEFINITION

CLASS lcl_component DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      get_data ABSTRACT
        RETURNING VALUE(rv_value) TYPE string
        RAISING   lcx_error.
ENDCLASS.       "lcl_component DEFINITION

CLASS lcl_concrete_component DEFINITION INHERITING FROM lcl_component.
  PUBLIC SECTION.
    METHODS:
      get_data REDEFINITION.
ENDCLASS.       "lcl_concrete_component DEFINITION

CLASS lcl_decorator DEFINITION ABSTRACT INHERITING FROM lcl_concrete_component.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING io_component TYPE REF TO lcl_concrete_component.
  PROTECTED SECTION.
    DATA:
    mo_component TYPE REF TO lcl_concrete_component.
ENDCLASS.       "lcl_decorator DEFINITION

CLASS lcl_log_decorator DEFINITION INHERITING FROM lcl_decorator.
  PUBLIC SECTION.
    METHODS:
      get_data REDEFINITION.
ENDCLASS.       "lcl_log_decorator DEFINITION

CLASS lcl_auth_decorator DEFINITION INHERITING FROM lcl_decorator.
  PUBLIC SECTION.
    METHODS:
      get_data REDEFINITION.
ENDCLASS.       "lcl_auth_decorator DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcx_error IMPLEMENTATION.
  METHOD get_text.
    IF mv_text IS NOT INITIAL.
      result = mv_text.
    ELSE.
      result = super->get_text( ).
    ENDIF.
  ENDMETHOD.

  METHOD raise.
    DATA(lo_exception) = NEW lcx_error( ).
    lo_exception->mv_text = iv_text.
    RAISE EXCEPTION lo_exception.
  ENDMETHOD.
ENDCLASS.       "lcx_error IMPLEMENTATION

CLASS lcl_concrete_component IMPLEMENTATION.
  METHOD get_data.
    rv_value = 'Concrete Component'.
    IF rv_value IS INITIAL.
      lcx_error=>raise( iv_text = lcx_error=>gc_no_data ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.       "lcl_concrete_component IMPLEMENTATION

CLASS lcl_decorator IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mo_component = io_component.
  ENDMETHOD.
ENDCLASS.       "lcl_decorator IMPLEMENTATION

CLASS lcl_log_decorator IMPLEMENTATION.
  METHOD get_data.
    rv_value = 'Logging - ' && mo_component->get_data( ).
  ENDMETHOD.
ENDCLASS.       "lcl_log_decorator IMPLEMENTATION

CLASS lcl_auth_decorator IMPLEMENTATION.
  METHOD get_data.
    rv_value = 'Check Auth - ' && mo_component->get_data( ).
  ENDMETHOD.
ENDCLASS.       "lcl_auth_decorator IMPLEMENTATION
