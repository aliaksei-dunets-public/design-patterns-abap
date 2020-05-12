*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

INTERFACE lif_strategy.
  METHODS:
    execute IMPORTING iv_a             TYPE i
                      iv_b             TYPE i
            RETURNING VALUE(rv_result) TYPE i.
ENDINTERFACE.

CLASS lcl_strategy_multiply DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_strategy.
    ALIASES: execute FOR lif_strategy~execute.
ENDCLASS.       "lcl_strategy_multiply DEFINITION

CLASS lcl_strategy_sum DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_strategy.
    ALIASES: execute FOR lif_strategy~execute.
ENDCLASS.       "lcl_strategy_sum DEFINITION

CLASS lcl_strategy_sub DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lif_strategy.
    ALIASES: execute FOR lif_strategy~execute.
ENDCLASS.       "lcl_strategy_sub DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_strategy_multiply IMPLEMENTATION.
  METHOD lif_strategy~execute.
    rv_result = iv_a * iv_b.
  ENDMETHOD.
ENDCLASS.       "lcl_strategy_multiply IMPLEMENTATION

CLASS lcl_strategy_sum IMPLEMENTATION.
  METHOD lif_strategy~execute.
    rv_result = iv_a + iv_b.
  ENDMETHOD.
ENDCLASS.       "lcl_strategy_sum IMPLEMENTATION

CLASS lcl_strategy_sub IMPLEMENTATION.
  METHOD lif_strategy~execute.
    rv_result = iv_a - iv_b.
  ENDMETHOD.
ENDCLASS.       "lcl_strategy_sub IMPLEMENTATION
