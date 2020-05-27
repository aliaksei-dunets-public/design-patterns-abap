*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_printer DEFINITION DEFERRED.

CLASS lcl_report DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      print_report RETURNING VALUE(rv_result) TYPE string,
      constructor IMPORTING io_printer TYPE REF TO lcl_printer.
  PROTECTED SECTION.
    DATA:
      mv_data    TYPE string,
      mo_printer TYPE REF TO lcl_printer.
    METHODS:
      get_data ABSTRACT,
      write_data ABSTRACT
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.       "lcl_report DEFINITION

CLASS lcl_printer DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      write_data ABSTRACT
        IMPORTING iv_data          TYPE string
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.

CLASS lcl_report_one DEFINITION INHERITING FROM lcl_report.
  PROTECTED SECTION.
    METHODS:
      get_data REDEFINITION,
      write_data REDEFINITION.
ENDCLASS.       "lcl_report_one DEFINITION

CLASS lcl_report_two DEFINITION INHERITING FROM lcl_report.
  PROTECTED SECTION.
    METHODS:
      get_data REDEFINITION,
      write_data REDEFINITION.
ENDCLASS.       "lcl_report_two DEFINITION

CLASS lcl_printer_pdf DEFINITION INHERITING FROM lcl_printer.
  PUBLIC SECTION.
    METHODS:
      write_data REDEFINITION.
ENDCLASS.       "lcl_printer_pdf DEFINITION

CLASS lcl_printer_xml DEFINITION INHERITING FROM lcl_printer.
  PUBLIC SECTION.
    METHODS:
      write_data REDEFINITION.
ENDCLASS.       "lcl_printer_xml DEFINITION

CLASS lcl_printer_doc DEFINITION INHERITING FROM lcl_printer.
  PUBLIC SECTION.
    METHODS:
      write_data REDEFINITION.
ENDCLASS.       "lcl_printer_doc DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_report IMPLEMENTATION.
  METHOD constructor.
    mo_printer = io_printer.
  ENDMETHOD.

  METHOD print_report.
    me->get_data( ).
    rv_result = me->write_data( ).
  ENDMETHOD.
ENDCLASS.       "lcl_report IMPLEMENTATION

CLASS lcl_report_one IMPLEMENTATION.
  METHOD get_data.
    mv_data = 'Report 1 DATA'.
  ENDMETHOD.

  METHOD write_data.
    rv_result = mo_printer->write_data( iv_data = mv_data ).
  ENDMETHOD.
ENDCLASS.       "lcl_report_one IMPLEMENTATION

CLASS lcl_report_two IMPLEMENTATION.
  METHOD get_data.
    mv_data = 'Report 2 DATA'.
  ENDMETHOD.

  METHOD write_data.
    rv_result = mo_printer->write_data( iv_data = mv_data ).
  ENDMETHOD.
ENDCLASS.

CLASS lcl_printer_pdf IMPLEMENTATION.
  METHOD write_data.
    rv_result = 'PDF' && iv_data.
  ENDMETHOD.
ENDCLASS.       "lcl_printer_pdf IMPLEMENTATION

CLASS lcl_printer_xml IMPLEMENTATION.
  METHOD write_data.
    rv_result = 'XML' && iv_data.
  ENDMETHOD.
ENDCLASS.       "lcl_printer_xml IMPLEMENTATION

CLASS lcl_printer_doc IMPLEMENTATION.
  METHOD write_data.
    rv_result = 'DOC' && iv_data.
  ENDMETHOD.
ENDCLASS.       "lcl_printer_doc IMPLEMENTATION
