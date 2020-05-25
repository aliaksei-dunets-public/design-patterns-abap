CLASS zcl_pattern_adapter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_adapter IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( NEW lcl_adapter(  )->request( ) ).
  ENDMETHOD.
ENDCLASS.
