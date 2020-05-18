CLASS zcl_pattern_singleton DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PATTERN_SINGLETON IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lo_singleton TYPE REF TO lcl_singleton.

    " Создание инстанции класса "LCL_SINGLETON" вне класса не разрешено - CREATE OBJECT lo_singleton.
    lo_singleton = lcl_singleton=>get_instance( ).
  ENDMETHOD.
ENDCLASS.
