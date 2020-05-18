CLASS zcl_pattern_template_method DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PATTERN_TEMPLATE_METHOD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:
      lo_discounter TYPE REF TO lcl_template_discount,
      lv_discount   TYPE i.

    lo_discounter = NEW lcl_workday_discount( ).
    lv_discount = lo_discounter->calc_discount( iv_product  = 'Milk'
                                                iv_customer = 'John' ).
    out->write( lv_discount ).
  ENDMETHOD.
ENDCLASS.
