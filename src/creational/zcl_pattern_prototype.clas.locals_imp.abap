*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

INTERFACE lif_clonable.
  METHODS:
    clone RETURNING VALUE(ro_clone) TYPE REF TO lif_clonable.
ENDINTERFACE.

CLASS lcl_request DEFINITION.

  PUBLIC SECTION.
    INTERFACES: lif_clonable.
    ALIASES clone FOR lif_clonable~clone.

    TYPES:
      BEGIN OF ty_request_state,
        request_id   TYPE i,
        entity_id    TYPE i,
        request_data TYPE string,
      END OF ty_request_state.

    METHODS:
      constructor
        IMPORTING iv_entity_id TYPE i
                  is_state     TYPE ty_request_state OPTIONAL,
      get_state RETURNING VALUE(rs_state) TYPE ty_request_state.

  PRIVATE SECTION.
    DATA:
            ms_request_data TYPE ty_request_state.
ENDCLASS.       "lcl_request DEFINITION

CLASS lcl_request IMPLEMENTATION.

  METHOD constructor.
    " If state is SUPPLIED -> initialize by state
    IF is_state IS SUPPLIED.
      ms_request_data = is_state.
      RETURN.
    ENDIF.

    "Simulate long processing
    "CALL RFC or other

    ms_request_data-entity_id = iv_entity_id.
    ms_request_data-request_id = 1.
    ms_request_data-request_data = 'Sample data'.

  ENDMETHOD.

  METHOD get_state.
    rs_state = ms_request_data.
  ENDMETHOD.

  METHOD lif_clonable~clone.
    ro_clone = NEW lcl_request( iv_entity_id = 0 is_state = me->get_state( ) ).
  ENDMETHOD.

ENDCLASS.
