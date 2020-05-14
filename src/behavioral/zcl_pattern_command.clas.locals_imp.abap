*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

INTERFACE lif_command.
  METHODS:
    execute RETURNING VALUE(rv_result) TYPE string.
ENDINTERFACE.

INTERFACE lif_thing.
  METHODS:
    turn_on RETURNING VALUE(rv_result) TYPE string,
    tunr_off RETURNING VALUE(rv_result) TYPE string.
ENDINTERFACE.

CLASS lcl_light DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_thing.
ENDCLASS.

CLASS lcl_tv DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_thing.
ENDCLASS.

CLASS lcl_switch DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING io_on  TYPE REF TO lif_command
                            io_off TYPE REF TO lif_command,
      flip_up RETURNING VALUE(rv_result) TYPE string,
      flip_down RETURNING VALUE(rv_result) TYPE string.
  PRIVATE SECTION.
    DATA:
      mo_on_command  TYPE REF TO lif_command,
      mo_off_command TYPE REF TO lif_command.
ENDCLASS.       "lcl_switch DEFINITION

CLASS lcl_tv_on_command DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_command.
    METHODS:
      constructor IMPORTING io_tv TYPE REF TO lif_thing.

  PRIVATE SECTION.
    DATA:
        mo_tv TYPE REF TO lif_thing.
ENDCLASS.       "lcl_tv_on_command DEFINITION

CLASS lcl_light_off_command DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_command.
    METHODS:
      constructor IMPORTING io_light TYPE REF TO lif_thing.

  PRIVATE SECTION.
    DATA:
        mo_light TYPE REF TO lif_thing.
ENDCLASS.       "lcl_light_off_command DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_light IMPLEMENTATION.
  METHOD lif_thing~tunr_off.
    rv_result = 'Light OFF'.
  ENDMETHOD.

  METHOD lif_thing~turn_on.
    rv_result = 'Light ON'.
  ENDMETHOD.
ENDCLASS.       "lcl_light IMPLEMENTATION

CLASS lcl_tv IMPLEMENTATION.
  METHOD lif_thing~tunr_off.
    rv_result = 'TV OFF'.
  ENDMETHOD.

  METHOD lif_thing~turn_on.
    rv_result = 'TV ON'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_switch IMPLEMENTATION.
  METHOD constructor.
    mo_on_command = io_on.
    mo_off_command = io_off.
  ENDMETHOD.

  METHOD flip_down.
    rv_result = mo_on_command->execute( ).
  ENDMETHOD.

  METHOD flip_up.
    rv_result = mo_off_command->execute( ).
  ENDMETHOD.
ENDCLASS.       "lcl_switch IMPLEMENTATION

CLASS lcl_tv_on_command IMPLEMENTATION.
  METHOD constructor.
    mo_tv = io_tv .
  ENDMETHOD.

  METHOD lif_command~execute.
    rv_result = mo_tv->turn_on( ).
  ENDMETHOD.
ENDCLASS.       "lcl_tv_on_command IMPLEMENTATION

CLASS lcl_light_off_command IMPLEMENTATION.
  METHOD constructor.
    mo_light = io_light.
  ENDMETHOD.

  METHOD lif_command~execute.
    rv_result = mo_light->tunr_off( ).
  ENDMETHOD.
ENDCLASS.
