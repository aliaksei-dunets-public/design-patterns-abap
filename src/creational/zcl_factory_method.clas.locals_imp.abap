*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_base_writer DEFINITION.
  PUBLIC SECTION.
    TYPES:
        ty_report_type TYPE i.
    CONSTANTS:
      gc_report_pdf   TYPE ty_report_type VALUE 1,
      gc_report_write TYPE ty_report_type VALUE 2,
      gc_report_alv   TYPE ty_report_type VALUE 3.
    CLASS-METHODS:
      get_writer
        IMPORTING iv_type          TYPE ty_report_type DEFAULT gc_report_write
        RETURNING VALUE(ro_writer) TYPE REF TO lcl_base_writer.
    METHODS:
      write_data RETURNING VALUE(rv_data) TYPE string.
ENDCLASS.       "lcl_base_writer DEFINITION

CLASS lcl_write_writer DEFINITION INHERITING FROM lcl_base_writer.
  PUBLIC SECTION.
    METHODS: write_data REDEFINITION.
ENDCLASS.       "lcl_write_writer DEFINITION

CLASS lcl_alv_writer DEFINITION INHERITING FROM lcl_base_writer.
  PUBLIC SECTION.
    METHODS: write_data REDEFINITION.
ENDCLASS.       "lcl_alv_writer DEFINITION

CLASS lcl_pdf_writer DEFINITION INHERITING FROM lcl_base_writer.
  PUBLIC SECTION.
    METHODS: write_data REDEFINITION.
ENDCLASS.       "lcl_pdf_writer DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_base_writer IMPLEMENTATION.
  METHOD get_writer.
    CASE iv_type.
      WHEN gc_report_alv.
        ro_writer = NEW lcl_alv_writer( ).
      WHEN gc_report_pdf.
        ro_writer = NEW lcl_pdf_writer( ).
      WHEN gc_report_write.
        ro_writer = NEW lcl_write_writer( ).
      WHEN OTHERS.
        "RAISE EXCEPTION.
    ENDCASE.
  ENDMETHOD.    "get_writer

  METHOD write_data.
    "RAISE EXCEPTION.
    rv_data = 'Use factory method!'.
  ENDMETHOD.
ENDCLASS.       "lcl_base_writer IMPLEMENTATION

CLASS lcl_write_writer IMPLEMENTATION.
  METHOD write_data.
    rv_data = 'Write with write'.
  ENDMETHOD.
ENDCLASS.       "lcl_write_writer IMPLEMENTATION

CLASS lcl_alv_writer IMPLEMENTATION.
  METHOD write_data.
    rv_data = 'Write with alv'.
  ENDMETHOD.
ENDCLASS.       "lcl_alv_writer IMPLEMENTATION

CLASS lcl_pdf_writer IMPLEMENTATION.
  METHOD write_data.
    rv_data = 'Write with pdf'.
  ENDMETHOD.
ENDCLASS.       "lcl_pdf_writer IMPLEMENTATION
