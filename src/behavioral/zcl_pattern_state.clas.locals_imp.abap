*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_water DEFINITION DEFERRED.

INTERFACE lif_water_state.
  CONSTANTS:
    gc_state_solid  TYPE i VALUE 1,
    gc_state_liquid TYPE i VALUE 2,
    gc_state_gaz    TYPE i VALUE 3.
  METHODS:
    heat IMPORTING io_water        TYPE REF TO lcl_water OPTIONAL
         RETURNING VALUE(rv_state) TYPE string,
    frost IMPORTING io_water        TYPE REF TO lcl_water OPTIONAL
          RETURNING VALUE(rv_state) TYPE string.
ENDINTERFACE.

CLASS lcl_water DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_water_state.
    ALIASES:    heat FOR lif_water_state~heat,
                frost FOR lif_water_state~frost.
    METHODS:
      constructor IMPORTING io_state TYPE REF TO lif_water_state,
      set_state IMPORTING  io_state TYPE REF TO lif_water_state.

  PRIVATE SECTION.
    DATA:
            mo_state TYPE REF TO lif_water_state.
ENDCLASS.       "lcl_water DEFINITION

CLASS lcl_liquid_water_state DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_water_state.
    ALIASES:    heat FOR lif_water_state~heat,
                frost FOR lif_water_state~frost.
ENDCLASS.       "lcl_liquid_water_state DEFINITION

CLASS lcl_solid_water_state DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_water_state.
    ALIASES:    heat FOR lif_water_state~heat,
                frost FOR lif_water_state~frost.
ENDCLASS.       "lcl_solid_water_state DEFINITION

CLASS lcl_gaz_water_state DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_water_state.
    ALIASES:    heat FOR lif_water_state~heat,
                frost FOR lif_water_state~frost.
ENDCLASS.       "lcl_gaz_water_state DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_water IMPLEMENTATION.
  METHOD constructor.
    set_state( io_state ).
  ENDMETHOD.

  METHOD lif_water_state~frost.
    rv_state = mo_state->frost( me ).
  ENDMETHOD.

  METHOD lif_water_state~heat.
    rv_state = mo_state->heat( me ).
  ENDMETHOD.

  METHOD set_state.
    mo_state = io_state.
  ENDMETHOD.
ENDCLASS.       "lcl_water IMPLEMENTATION

CLASS lcl_liquid_water_state IMPLEMENTATION.
  METHOD lif_water_state~frost.
    io_water->set_state( io_state = CAST #( NEW lcl_solid_water_state( ) ) ).
    rv_state = 'Ghange water to ice'.
  ENDMETHOD.

  METHOD lif_water_state~heat.
    io_water->set_state( io_state = CAST #( NEW lcl_gaz_water_state( ) ) ).
    rv_state = 'Ghange water to gaz'.
  ENDMETHOD.
ENDCLASS.       "lcl_liquid_water_state IMPLEMENTATION

CLASS lcl_solid_water_state IMPLEMENTATION.
  METHOD lif_water_state~frost.
    rv_state = 'Reduce temperature of ice'.
  ENDMETHOD.

  METHOD lif_water_state~heat.
    io_water->set_state( io_state = CAST #( NEW lcl_liquid_water_state( ) ) ).
    rv_state = 'Ghange ice to liquid'.
  ENDMETHOD.
ENDCLASS.       "lcl_solid_water_state IMPLEMENTATION

CLASS lcl_gaz_water_state IMPLEMENTATION.
  METHOD lif_water_state~frost.
    io_water->set_state( io_state = CAST #( NEW lcl_liquid_water_state( ) ) ).
    rv_state = 'Ghange gaz to water'.
  ENDMETHOD.

  METHOD lif_water_state~heat.
    rv_state = 'Increase temperature of gaz'.
  ENDMETHOD.
ENDCLASS.       "lcl_gaz_water_state IMPLEMENTATION
