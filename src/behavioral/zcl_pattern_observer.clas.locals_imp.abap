*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_observer DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      update ABSTRACT
        IMPORTING iv_data          TYPE string
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.       "lcl_observer DEFINITION

CLASS lcl_concrete_observer DEFINITION INHERITING FROM lcl_observer.
  PUBLIC SECTION.
    METHODS:
      update REDEFINITION.
ENDCLASS.       "lcl_concrete_observer DEFINITION

CLASS lcl_subject DEFINITION.
  PUBLIC SECTION.
    METHODS:
      attach_observer IMPORTING io_observer TYPE REF TO lcl_observer,
      raise_event RETURNING VALUE(rv_result) TYPE string.
  PRIVATE SECTION.
    DATA:
    mt_observers TYPE STANDARD TABLE OF REF TO lcl_observer.
ENDCLASS.       "lcl_subject DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_concrete_observer IMPLEMENTATION.
  METHOD update.
    rv_result = 'Update' && iv_data.
  ENDMETHOD.
ENDCLASS.       "lcl_concrete_observer IMPLEMENTATION

CLASS lcl_subject IMPLEMENTATION.
  METHOD attach_observer.
    APPEND io_observer TO mt_observers.
  ENDMETHOD.

  METHOD raise_event.
    LOOP AT mt_observers INTO DATA(lo_observer).
      rv_result = rv_result && lo_observer->update( iv_data = CONV #( sy-tabix ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.       "lcl_subject IMPLEMENTATION
