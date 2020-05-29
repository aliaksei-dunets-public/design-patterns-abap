CLASS zcl_pattern_decorator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_decorator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lo_component) = NEW lcl_concrete_component( ).
    DATA(lo_logged_component) = NEW lcl_log_decorator( lo_component ).
    DATA(lo_auth_logged_comp) = NEW lcl_log_decorator( NEW lcl_auth_decorator( lo_component ) ).

    TRY.
        out->write( lo_component->get_data( ) ).
        out->write( lo_logged_component->get_data( ) ).
        out->write( lo_auth_logged_comp->get_data( ) ).
      CATCH lcx_error INTO DATA(lo_ex).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
