*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_singleton DEFINITION CREATE PRIVATE.
  PUBLIC SECTION.
    CLASS-METHODS:
      get_instance RETURNING VALUE(ro_singleton) TYPE REF TO lcl_singleton.
  PRIVATE SECTION.
    CLASS-DATA:
        go_instance TYPE REF TO lcl_singleton.
ENDCLASS.

CLASS lcl_singleton IMPLEMENTATION.

  METHOD get_instance.
    IF go_instance IS NOT BOUND.
      go_instance = NEW #( ).
    ENDIF.

    ro_singleton = go_instance.
  ENDMETHOD.

ENDCLASS.
