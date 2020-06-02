CLASS zcl_pattern_proxy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_proxy IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lo_subject TYPE REF TO lcl_subject.

    lo_subject = NEW lcl_real_subject( ).
    out->write( lo_subject->get_data( ) ).

  ENDMETHOD.
ENDCLASS.
