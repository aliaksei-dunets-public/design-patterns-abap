CLASS zcl_pattern_observer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_observer IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_subject) = NEW lcl_subject( ).

    lo_subject->attach_observer( NEW lcl_concrete_observer( ) ).
    lo_subject->attach_observer( NEW lcl_concrete_observer( ) ).

    out->write( lo_subject->raise_event( ) ).
  ENDMETHOD.
ENDCLASS.
