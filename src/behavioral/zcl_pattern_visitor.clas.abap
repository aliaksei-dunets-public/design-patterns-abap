CLASS zcl_pattern_visitor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_visitor IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lo_structure) = NEW lcl_structure( ).

    lo_structure->add_element( io_element = NEW lcl_element_one( ) ).
    lo_structure->add_element( io_element = NEW lcl_element_two( ) ).

    out->write( lo_structure->accept( io_visitor = NEW lcl_visitor_one( ) ) ).
    out->write( lo_structure->accept( io_visitor = NEW lcl_visitor_two( ) ) ).

  ENDMETHOD.
ENDCLASS.
