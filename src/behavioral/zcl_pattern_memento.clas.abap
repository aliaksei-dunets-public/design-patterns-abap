CLASS zcl_pattern_memento DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_memento IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_originator) = NEW lcl_originator( ).
    lo_originator->set_state( 'ON' ).

    DATA(lo_caretaker) = NEW lcl_caretaker( ).
    lo_caretaker->mo_state = lo_originator->create_memento( ).

    lo_originator->set_state( 'OFF' ).
    out->write( lo_originator->get_state( ) ).

    lo_originator->set_memento( io_memento = lo_caretaker->mo_state ).
    out->write( lo_originator->get_state( ) ).
  ENDMETHOD.
ENDCLASS.
