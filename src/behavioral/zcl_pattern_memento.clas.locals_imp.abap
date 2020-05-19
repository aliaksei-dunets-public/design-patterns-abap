*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_originator DEFINITION DEFERRED.

CLASS lcl_momento DEFINITION FRIENDS lcl_originator.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_state TYPE string.
  PRIVATE SECTION.
    METHODS:
      get_state RETURNING VALUE(rv_state) TYPE string.
    DATA:
        mv_state TYPE string.
ENDCLASS.       "lcl_momento DEFINITION

CLASS lcl_caretaker DEFINITION.
  PUBLIC SECTION.
    DATA:
        mo_state TYPE REF TO lcl_momento.
ENDCLASS.       "lcl_caretaker DEFINITION

CLASS lcl_originator DEFINITION.
  PUBLIC SECTION.
    METHODS:
      create_memento RETURNING VALUE(ro_memento) TYPE REF TO lcl_momento,
      set_memento IMPORTING io_memento TYPE REF TO lcl_momento,
      set_state IMPORTING iv_state TYPE string,
      get_state RETURNING VALUE(rv_state) TYPE string.
  PRIVATE SECTION.
    DATA:
    mv_state TYPE string.
ENDCLASS.       "lcl_originator DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_momento IMPLEMENTATION.
  METHOD constructor.
    mv_state = iv_state.
  ENDMETHOD.

  METHOD get_state.
    rv_state = mv_state.
  ENDMETHOD.
ENDCLASS.       "lcl_momento IMPLEMENTATION

CLASS lcl_originator IMPLEMENTATION.
  METHOD create_memento.
    ro_memento = NEW lcl_momento( mv_state ).
  ENDMETHOD.

  METHOD get_state.
    rv_state = mv_state.
  ENDMETHOD.

  METHOD set_memento.
    mv_state = io_memento->get_state( ).
  ENDMETHOD.

  METHOD set_state.
    mv_state = iv_state.
  ENDMETHOD.
ENDCLASS.       "lcl_originator IMPLEMENTATION
