*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Описание абстракций
*&---------------------------------------------------------------------*

CLASS lcl_abstract_product_a DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: run ABSTRACT RETURNING VALUE(rv_value) TYPE string.
ENDCLASS.

CLASS lcl_abstract_product_b DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: run ABSTRACT RETURNING VALUE(rv_value) TYPE string.
ENDCLASS.

CLASS lcl_abstract_factory DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      create_product_a ABSTRACT RETURNING VALUE(ro_product_a) TYPE REF TO lcl_abstract_product_a,
      create_product_b ABSTRACT RETURNING VALUE(ro_product_b) TYPE REF TO lcl_abstract_product_b.
ENDCLASS.

*&---------------------------------------------------------------------*
*&  Описание конкретных реализаций - фабрик
*&---------------------------------------------------------------------*

CLASS lcl_concrete_factory_1 DEFINITION INHERITING FROM lcl_abstract_factory.
  PUBLIC SECTION.
    METHODS:
      create_product_a REDEFINITION,
      create_product_b REDEFINITION.
ENDCLASS.

CLASS lcl_concrete_factory_2 DEFINITION INHERITING FROM lcl_abstract_factory.
  PUBLIC SECTION.
    METHODS:
      create_product_a REDEFINITION,
      create_product_b REDEFINITION.
ENDCLASS.

*&---------------------------------------------------------------------*
*&  Описание конкретных реализаций - продуктов
*&---------------------------------------------------------------------*

CLASS lcl_concrete_product_a_1 DEFINITION INHERITING FROM lcl_abstract_product_a.
  PUBLIC SECTION.
    METHODS run REDEFINITION.
ENDCLASS.

CLASS lcl_concrete_product_a_2 DEFINITION INHERITING FROM lcl_abstract_product_a.
  PUBLIC SECTION.
    METHODS run REDEFINITION.
ENDCLASS.

CLASS lcl_concrete_product_b_1 DEFINITION INHERITING FROM lcl_abstract_product_b.
  PUBLIC SECTION.
    METHODS run REDEFINITION.
ENDCLASS.

CLASS lcl_concrete_product_b_2 DEFINITION INHERITING FROM lcl_abstract_product_b.
  PUBLIC SECTION.
    METHODS run REDEFINITION.
ENDCLASS.

*&---------------------------------------------------------------------*
*&  Реализация конкретных фабрик
*&---------------------------------------------------------------------*

CLASS lcl_concrete_factory_1 IMPLEMENTATION.
  METHOD create_product_a.
    ro_product_a = NEW lcl_concrete_product_a_1( ).
  ENDMETHOD.

  METHOD create_product_b.
    ro_product_b = NEW lcl_concrete_product_b_1(  ).
  ENDMETHOD.
ENDCLASS.

CLASS lcl_concrete_factory_2 IMPLEMENTATION.
  METHOD create_product_a.
    ro_product_a = NEW lcl_concrete_product_a_2( ).
  ENDMETHOD.

  METHOD create_product_b.
    ro_product_b = NEW lcl_concrete_product_b_2(  ).
  ENDMETHOD.
ENDCLASS.

*&---------------------------------------------------------------------*
*&  Реализация конкретных продуктов
*&---------------------------------------------------------------------*

CLASS lcl_concrete_product_a_1 IMPLEMENTATION.
  METHOD run.
    rv_value = 'Run with product A-1'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_concrete_product_a_2 IMPLEMENTATION.
  METHOD run.
    rv_value = 'Run with product A-2'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_concrete_product_b_1 IMPLEMENTATION.
  METHOD run.
    rv_value = 'Run with product B-1'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_concrete_product_b_2 IMPLEMENTATION.
  METHOD run.
    rv_value = 'Run with product B-2'.
  ENDMETHOD.
ENDCLASS.
