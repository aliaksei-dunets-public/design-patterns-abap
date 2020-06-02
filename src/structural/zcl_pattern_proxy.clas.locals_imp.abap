*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_subject DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      get_data ABSTRACT
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.

CLASS lcl_real_subject DEFINITION INHERITING FROM lcl_subject.
  PUBLIC SECTION.
    METHODS:
      get_data REDEFINITION,
      constructor.
  PRIVATE SECTION.
    DATA:
        mv_data TYPE string.
ENDCLASS.       "lcl_real_subject DEFINITION

CLASS lcl_proxy DEFINITION INHERITING FROM lcl_subject.
  PUBLIC SECTION.
    METHODS:
      get_data REDEFINITION.
  PRIVATE SECTION.
    DATA:
        mo_subject TYPE REF TO lcl_real_subject.
ENDCLASS.       "lcl_proxy DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_real_subject IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_data = 'Get data from Source'.
  ENDMETHOD.

  METHOD get_data.
    rv_result = mv_data.
  ENDMETHOD.
ENDCLASS.       "lcl_real_subject IMPLEMENTATION

CLASS lcl_proxy IMPLEMENTATION.
  METHOD get_data.
    IF mo_subject IS NOT BOUND.
      mo_subject = NEW lcl_real_subject( ).
    ENDIF.

    rv_result = mo_subject->get_data( ).
  ENDMETHOD.
ENDCLASS.       "lcl_proxy IMPLEMENTATION
