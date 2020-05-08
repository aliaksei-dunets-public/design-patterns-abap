CLASS zcl_pattern_prototype DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_prototype IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lo_clone TYPE REF TO lcl_request.

    DATA(lo_request) = NEW lcl_request( iv_entity_id = 1 ).
    DATA(ls_state) = lo_request->get_state( ).

    out->write( ls_state-entity_id && ls_state-request_id && ls_state-request_data ).

    lo_clone = CAST #( lo_request->clone( ) ).
    ls_state = lo_clone->get_state( ).

    out->write( ls_state-entity_id && ls_state-request_id && ls_state-request_data ).

  ENDMETHOD.

ENDCLASS.
