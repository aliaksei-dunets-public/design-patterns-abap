CLASS zcl_pattern_builder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_builder IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_buider) = NEW lcl_builder( ).

    DATA(lo_roduct) = lo_buider->init_product( )->set_header( 'Header 1' )->set_footer( 'Footer 1' )->set_text( 'Text 1' )->get_product( ).
    out->write( lo_roduct->write( ) ).

    lo_roduct = lo_buider->set_footer( 'Footer 2' )->set_header( 'Header 2' )->get_product( ).
    out->write( lo_roduct->write( ) ).

    lo_roduct = lo_buider->init_product( )->set_footer( 'Footer 3' )->set_header( 'Header 3' )->get_product( ).
    out->write( lo_roduct->write( ) ).

  ENDMETHOD.

ENDCLASS.
