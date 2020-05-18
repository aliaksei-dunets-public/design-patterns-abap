CLASS zcl_pattern_iterator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_iterator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lo_iterator) = NEW lcl_iterator( NEW lcl_aggregate( ) ).

    WHILE lo_iterator->is_done( ) <> abap_true.
      out->write( lo_iterator->next(  ) ).
    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
