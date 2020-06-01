CLASS zcl_pattern_flyweight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_flyweight IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA:
      lv_message   TYPE string VALUE 'AZABAZZZZAABBBBB',
      lo_character TYPE REF TO lcl_character.

    DO strlen( lv_message ) - 1 TIMES.
      lo_character = lcl_character_factory=>get_character( iv_char = substring( val = lv_message off = sy-index len = 1 ) ).
      out->write( lo_character->dispay( ) ).
    ENDDO.

  ENDMETHOD.
ENDCLASS.
