*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_character DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      dispay RETURNING VALUE(rv_result) TYPE string,
      constructor IMPORTING iv_character TYPE c.
  PROTECTED SECTION.
    DATA:
      mv_char   TYPE c,
      mv_width  TYPE i,
      mv_height TYPE i.
ENDCLASS.       "lcl_character DEFINITION

CLASS lcl_character_a DEFINITION INHERITING FROM lcl_character.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_character TYPE c.
ENDCLASS.       "lcl_character_a DEFINITION

CLASS lcl_character_b DEFINITION INHERITING FROM lcl_character.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_character TYPE c.
ENDCLASS.       "lcl_character_b DEFINITION

CLASS lcl_character_z DEFINITION INHERITING FROM lcl_character.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_character TYPE c.
ENDCLASS.       "lcl_character_z DEFINITION

CLASS lcl_character_factory DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      get_character
        IMPORTING iv_char             TYPE c
        RETURNING VALUE(ro_character) TYPE REF TO lcl_character.
  PRIVATE SECTION.
    TYPES:BEGIN OF ty_char,
            char TYPE c LENGTH 1,
            ref  TYPE REF TO lcl_character,
          END OF ty_char.
    CLASS-DATA:
        mt_characters TYPE STANDARD TABLE OF ty_char.
ENDCLASS.       "lcl_character_factory DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_character IMPLEMENTATION.
  METHOD constructor.
    mv_char = iv_character.
  ENDMETHOD.

  METHOD dispay.
    rv_result = 'Char:' && mv_char && ', Width:' && mv_width && ', Height: ' && mv_height.
  ENDMETHOD.
ENDCLASS.       "lcl_character IMPLEMENTATION

CLASS lcl_character_a IMPLEMENTATION.
  METHOD constructor.
    super->constructor( iv_character = iv_character ).
    mv_height = 100.
    mv_width = 100.
  ENDMETHOD.
ENDCLASS.       "lcl_character_a IMPLEMENTATION

CLASS lcl_character_b IMPLEMENTATION.
  METHOD constructor.
    super->constructor( iv_character = iv_character ).
    mv_height = 200.
    mv_width = 200.
  ENDMETHOD.
ENDCLASS.       "lcl_character_b IMPLEMENTATION

CLASS lcl_character_z IMPLEMENTATION.
  METHOD constructor.
    super->constructor( iv_character = iv_character ).
    mv_height = 300.
    mv_width = 300.
  ENDMETHOD.
ENDCLASS.       "lcl_character_z IMPLEMENTATION

CLASS lcl_character_factory IMPLEMENTATION.
  METHOD get_character.
    TRY.
        ro_character = mt_characters[ char = iv_char ]-ref.
      CATCH cx_sy_itab_line_not_found INTO DATA(lx_error).

        APPEND INITIAL LINE TO mt_characters ASSIGNING FIELD-SYMBOL(<ls_line>).
        <ls_line>-char = iv_char.
        CASE <ls_line>-char.
          WHEN 'A'.
            <ls_line>-ref = NEW lcl_character_a( iv_char ).
          WHEN 'B'.
            <ls_line>-ref = NEW lcl_character_b( iv_char ).
          WHEN OTHERS.
            <ls_line>-ref = NEW lcl_character_z( iv_char ).
        ENDCASE.

        ro_character = <ls_line>-ref.

    ENDTRY.
  ENDMETHOD.
ENDCLASS.
