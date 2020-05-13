CLASS zcl_pattern_mediator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_mediator IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_mediator) = NEW lcl_mediator( ).
    DATA(lo_invoker1) = NEW lcl_invoker( iv_name     = 'John'
                                         io_mediator = lo_mediator ).
    DATA(lo_invoker2) = NEW lcl_invoker( iv_name     = 'Mike'
                                         io_mediator = lo_mediator ).

    lo_mediator->add_client( lo_invoker1 ).
    lo_mediator->add_client( lo_invoker2 ).

    out->write( lo_invoker1->send_message( 'Hi to all!' ) ).

  ENDMETHOD.

ENDCLASS.
