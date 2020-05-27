CLASS zcl_pattern_bridge DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_bridge IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_report_one) = NEW lcl_report_one( io_printer = NEW lcl_printer_pdf( ) ).
    DATA(lo_report_two) = NEW lcl_report_two( io_printer = NEW lcl_printer_doc( ) ).

    out->write( lo_report_one->print_report( ) ).
    out->write( lo_report_two->print_report( ) ).

  ENDMETHOD.
ENDCLASS.
