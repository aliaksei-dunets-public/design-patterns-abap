*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_component DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_name TYPE string,
      operation ABSTRACT RETURNING VALUE(rv_result) TYPE string,
      add ABSTRACT IMPORTING io_component TYPE REF TO lcl_component,
      remove ABSTRACT IMPORTING IO_component TYPE REF TO lcl_component,
      get_child ABSTRACT
        IMPORTING iv_index            TYPE i
        RETURNING VALUE(ro_component) TYPE REF TO lcl_component.
  PROTECTED SECTION.
    DATA:
        mv_name TYPE string.
ENDCLASS.       "lcl_component DEFINITION

CLASS lcl_leaf DEFINITION INHERITING FROM lcl_component.
  PUBLIC SECTION.
    METHODS:
      operation REDEFINITION,
      add REDEFINITION,
      remove REDEFINITION,
      get_child REDEFINITION.
ENDCLASS.       "lcl_leaf DEFINITION

CLASS lcl_composite DEFINITION INHERITING FROM lcl_component.
  PUBLIC SECTION.
    METHODS:
      operation REDEFINITION,
      add REDEFINITION,
      remove REDEFINITION,
      get_child REDEFINITION.
  PRIVATE SECTION.
    DATA:
            mt_childrens TYPE STANDARD TABLE OF REF TO lcl_component.
ENDCLASS.       "lcl_composite DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_component IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.
  ENDMETHOD.
ENDCLASS.       "lcl_component IMPLEMENTATION

CLASS lcl_leaf IMPLEMENTATION.
  METHOD add.
  ENDMETHOD.

  METHOD get_child.
  ENDMETHOD.

  METHOD operation.
    rv_result = mv_name.
  ENDMETHOD.

  METHOD remove.
  ENDMETHOD.
ENDCLASS.       "lcl_leaf IMPLEMENTATION

CLASS lcl_composite IMPLEMENTATION.
  METHOD add.
    APPEND io_component TO mt_childrens.
  ENDMETHOD.

  METHOD get_child.
    ro_component = mt_childrens[ iv_index ].
  ENDMETHOD.

  METHOD operation.
    rv_result = mv_name.

    LOOP AT mt_childrens INTO DATA(lo_child).
      rv_result = rv_result && lo_child->operation( ).
    ENDLOOP.
  ENDMETHOD.

  METHOD remove.
    DELETE mt_childrens WHERE table_line = io_component.
  ENDMETHOD.
ENDCLASS.
