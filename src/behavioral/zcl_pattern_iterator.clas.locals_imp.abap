*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

INTERFACE lif_iterator.
  METHODS:
    first RETURNING VALUE(rs_airport) TYPE /dmo/airport,
    next RETURNING VALUE(rs_airport) TYPE /dmo/airport,
    is_done RETURNING VALUE(rv_done) TYPE abap_boolean,
    current RETURNING VALUE(rs_airport) TYPE /dmo/airport.
ENDINTERFACE.

CLASS lcl_aggregate DEFINITION FRIENDS lif_iterator.
  PUBLIC SECTION.
    METHODS:
      cretate_iterator RETURNING VALUE(ro_iterator) TYPE REF TO lif_iterator,
      constructor.
  PRIVATE SECTION.
    DATA:
            mt_data TYPE STANDARD TABLE OF /dmo/airport.
ENDCLASS.       "lcl_aggregate DEFINITION

CLASS lcl_iterator DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_iterator.
    ALIASES:
    first FOR lif_iterator~first,
    next FOR lif_iterator~next,
    is_done FOR lif_iterator~is_done,
    current FOR lif_iterator~current.
    METHODS:
      constructor IMPORTING io_aggregate TYPE REF TO lcl_aggregate.
  PRIVATE SECTION.
    DATA:
      mv_position  TYPE i,
      mv_lines     TYPE i,
      mo_aggregate TYPE REF TO lcl_aggregate.
ENDCLASS.       "lcl_iterator DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_aggregate IMPLEMENTATION.
  METHOD constructor.
    SELECT * FROM /dmo/airport
        INTO TABLE @mt_data.
  ENDMETHOD.

  METHOD cretate_iterator.
    ro_iterator = NEW lcl_iterator( io_aggregate = me ).
  ENDMETHOD.
ENDCLASS.       "lcl_aggregate IMPLEMENTATION

CLASS lcl_iterator IMPLEMENTATION.
  METHOD constructor.
    mo_aggregate = io_aggregate.
    mv_lines = lines( mo_aggregate->mt_data ).
  ENDMETHOD.

  METHOD lif_iterator~current.
*    TRY.
    rs_airport = mo_aggregate->mt_data[ mv_position ].
*      CATCH cx_sy_itab_line_not_found INTO DATA(cx).
*    ENDTRY.
  ENDMETHOD.

  METHOD lif_iterator~first.
    mv_position = 1.
    rs_airport = mo_aggregate->mt_data[ mv_position ].
  ENDMETHOD.

  METHOD lif_iterator~is_done.
    IF ( mv_position + 1 ) > mv_lines.
      rv_done = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD lif_iterator~next.
    mv_position += 1.

    IF mv_position > mv_lines.
      mv_position -= 1.
      RETURN.
    ENDIF.

    rs_airport = mo_aggregate->mt_data[ mv_position ].
  ENDMETHOD.

ENDCLASS.       "lcl_iterator IMPLEMENTATION
