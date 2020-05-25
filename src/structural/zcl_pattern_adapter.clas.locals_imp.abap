*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

INTERFACE lif_target.
  METHODS:
    request RETURNING VALUE(rv_value) TYPE string.
ENDINTERFACE.

CLASS lcl_adaptee DEFINITION.
  PUBLIC SECTION.
    METHODS:
      specialRequest RETURNING VALUE(rv_value) TYPE string.
ENDCLASS.       "lcl_adaptee DEFINITION

CLASS lcl_adapter DEFINITION INHERITING FROM lcl_adaptee.
  PUBLIC SECTION.
    INTERFACES: lif_target.
    ALIASES request FOR lif_target~request.
ENDCLASS.       "lcl_adapter DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_adaptee IMPLEMENTATION.
  METHOD specialrequest.
    rv_value = 'Adaptee Call'.
  ENDMETHOD.
ENDCLASS.       "lcl_adaptee IMPLEMENTATION

CLASS lcl_adapter IMPLEMENTATION.
  METHOD lif_target~request.
    rv_value = me->specialrequest( ).
  ENDMETHOD.
ENDCLASS.       "lcl_adapter IMPLEMENTATION
