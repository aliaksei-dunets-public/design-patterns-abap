CLASS zcl_pattern_state DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_state IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    data(lo_water) = new lcl_water( new lcl_liquid_water_state( ) ).

    out->write( lo_water->heat( ) ).
    out->write( lo_water->heat( ) ).
    out->write( lo_water->frost( ) ).
    out->write( lo_water->frost( ) ).
    out->write( lo_water->frost( ) ).
  ENDMETHOD.
ENDCLASS.
