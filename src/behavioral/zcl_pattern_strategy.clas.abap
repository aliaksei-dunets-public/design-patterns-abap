CLASS zcl_pattern_strategy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_strategy IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:
      lo_strategy TYPE REF TO lif_strategy,
      lv_result   TYPE i.

    lo_strategy = NEW lcl_strategy_multiply( ).
    lv_result = lo_strategy->execute( iv_a = 10 iv_b = 5 ).
    out->write( lv_result ).

    lo_strategy = NEW lcl_strategy_sum( ).
    out->write( lo_strategy->execute( iv_a = 10 iv_b = 5 ) ).

    out->write( NEW lcl_strategy_sub( )->execute( iv_a = 10 iv_b = 5 ) ).

  ENDMETHOD.

ENDCLASS.
