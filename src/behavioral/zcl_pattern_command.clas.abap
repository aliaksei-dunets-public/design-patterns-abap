CLASS zcl_pattern_command DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PATTERN_COMMAND IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lo_light) = NEW lcl_light( ).
    DATA(lo_tv) = NEW lcl_tv( ).

    DATA(lo_light_off_command) = NEW lcl_light_off_command( io_light = lo_light ).
    DATA(lo_tv_on_command) = NEW lcl_tv_on_command( io_tv = lo_tv ).

    DATA(lo_switch) = NEW lcl_switch(
      io_on  = lo_tv_on_command
      io_off = lo_light_off_command
    ).

    out->write( lo_switch->flip_up( ) ).
    out->write( lo_switch->flip_down( ) ).

  ENDMETHOD.
ENDCLASS.
