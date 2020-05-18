CLASS zcl_abstract_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABSTRACT_FACTORY IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "&---------------------------------------------------------------------*
    "&  Работа с фабриками
    "&---------------------------------------------------------------------*

    DATA:
      lo_factory   TYPE REF TO lcl_abstract_factory,
      lo_product_a TYPE REF TO lcl_abstract_product_a,
      lo_product_b TYPE REF TO lcl_abstract_product_b.

    lo_factory = NEW lcl_concrete_factory_1( ).
    lo_product_a = lo_factory->create_product_a( ).
    lo_product_b = lo_factory->create_product_b( ).

    out->write( lo_product_a->run( ) ).
    out->write( lo_product_b->run( ) ).

    out->write( NEW lcl_concrete_factory_2( )->create_product_a( )->run( ) ).

  ENDMETHOD.
ENDCLASS.
