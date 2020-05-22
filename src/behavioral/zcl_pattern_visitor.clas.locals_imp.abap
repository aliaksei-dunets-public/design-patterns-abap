*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_element DEFINITION DEFERRED.

CLASS lcl_visitor DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      visit ABSTRACT
        IMPORTING io_element       TYPE REF TO lcl_element
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.       "lcl_visitor DEFINITION

CLASS lcl_visitor_one DEFINITION INHERITING FROM lcl_visitor.
  PUBLIC SECTION.
    METHODS:
      visit REDEFINITION.
ENDCLASS.       "lcl_visitor_one DEFINITION

CLASS lcl_visitor_two DEFINITION INHERITING FROM lcl_visitor.
  PUBLIC SECTION.
    METHODS:
      visit REDEFINITION.
ENDCLASS.       "lcl_visitor_two DEFINITION

CLASS lcl_element DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      accept IMPORTING io_visitor       TYPE REF TO lcl_visitor
             RETURNING VALUE(rv_result) TYPE string,
      operation ABSTRACT
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.       "lcl_element DEFINITION

CLASS lcl_element_one DEFINITION INHERITING FROM lcl_element.
  PUBLIC SECTION.
    METHODS:
      operation REDEFINITION.
ENDCLASS.       "lcl_element_one DEFINITION

CLASS lcl_element_two DEFINITION INHERITING FROM lcl_element.
  PUBLIC SECTION.
    METHODS:
      operation REDEFINITION.
ENDCLASS.       "lcl_element_two DEFINITION

CLASS lcl_structure DEFINITION.
  PUBLIC SECTION.
    METHODS:
      add_element IMPORTING io_element TYPE REF TO lcl_element,
      accept IMPORTING io_visitor       TYPE REF TO lcl_visitor
             RETURNING VALUE(rv_result) TYPE string.
  PRIVATE SECTION.
    DATA:
        mt_elements TYPE STANDARD TABLE OF REF TO lcl_element.
ENDCLASS.       "lcl_structure DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_element IMPLEMENTATION.
  METHOD accept.
    io_visitor->visit( me ).
  ENDMETHOD.
ENDCLASS.       "lcl_element IMPLEMENTATION

CLASS lcl_element_one IMPLEMENTATION.
  METHOD operation.
    rv_result = 'Operation Element One'.
  ENDMETHOD.
ENDCLASS.       "lcl_element_one IMPLEMENTATION

CLASS lcl_element_two IMPLEMENTATION.
  METHOD operation.
    rv_result = 'Operation Element Two'.
  ENDMETHOD.
ENDCLASS.       "lcl_element_two IMPLEMENTATION

CLASS lcl_visitor_one IMPLEMENTATION.
  METHOD visit.
    rv_result = io_element->operation( ).
  ENDMETHOD.
ENDCLASS.       "lcl_visitor_one IMPLEMENTATION

CLASS lcl_visitor_two IMPLEMENTATION.
  METHOD visit.
    rv_result = io_element->operation( ).
  ENDMETHOD.
ENDCLASS.       "lcl_visitor_two IMPLEMENTATION

CLASS lcl_structure IMPLEMENTATION.
  METHOD accept.
    LOOP AT mt_elements INTO DATA(lo_element).
      rv_result = rv_result && io_visitor->visit( lo_element ).
    ENDLOOP.
  ENDMETHOD.

  METHOD add_element.
    APPEND io_element TO mt_elements.
  ENDMETHOD.
ENDCLASS.       "lcl_structure IMPLEMENTATION
