*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_message_handler DEFINITION ABSTRACT.
  PUBLIC SECTION.
    TYPES: ty_priority TYPE i.
    CONSTANTS:
      gc_error_msg   TYPE ty_priority VALUE 1,
      gc_warning_msg TYPE ty_priority VALUE 2,
      gc_notice_msg  TYPE ty_priority VALUE 3.
    DATA:
      mv_task TYPE ty_priority,
      mo_next TYPE REF TO  lcl_message_handler.
    METHODS:
      constructor IMPORTING io_next TYPE REF TO lcl_message_handler OPTIONAL
                            iv_mask TYPE ty_priority,
      write_message IMPORTING iv_message       TYPE string
                              iv_priority      TYPE ty_priority
                    RETURNING VALUE(rv_result) TYPE string.
  PROTECTED SECTION.
    METHODS:
      write_message_int ABSTRACT
        IMPORTING iv_message       TYPE string
        RETURNING VALUE(rv_result) TYPE string.
ENDCLASS.       "lcl_message_handler DEFINITION

CLASS lcl_write_handler DEFINITION INHERITING FROM lcl_message_handler.
  PROTECTED SECTION.
    METHODS:
      write_message_int REDEFINITION.
ENDCLASS.       "lcl_write_handler DEFINITION

CLASS lcl_log_handler DEFINITION INHERITING FROM lcl_message_handler.
  PROTECTED SECTION.
    METHODS:
      write_message_int REDEFINITION.
ENDCLASS.       "lcl_log_handler DEFINITION

CLASS lcl_email_handler DEFINITION INHERITING FROM lcl_message_handler.
  PROTECTED SECTION.
    METHODS:
      write_message_int REDEFINITION.
ENDCLASS.       "lcl_email_handler DEFINITION


*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_message_handler IMPLEMENTATION.
  METHOD constructor.
    mo_next = io_next.
    mv_task = iv_mask.
  ENDMETHOD.

  METHOD write_message.
    IF iv_priority <= mv_task.
      rv_result = write_message_int( iv_message ).
    ENDIF.

    CHECK mo_next IS BOUND.
    rv_result = rv_result && mo_next->write_message(
      EXPORTING
        iv_message  = iv_message
        iv_priority = iv_priority
    ).

  ENDMETHOD.
ENDCLASS.       "lcl_message_handler IMPLEMENTATION

CLASS lcl_write_handler IMPLEMENTATION.
  METHOD write_message_int.
    rv_result = `Write notice: ` && iv_message.
  ENDMETHOD.
ENDCLASS.       "lcl_write_handler IMPLEMENTATION

CLASS lcl_log_handler IMPLEMENTATION.
  METHOD write_message_int.
    rv_result = `Write to log: ` && iv_message.
  ENDMETHOD.
ENDCLASS.       "lcl_log_handler IMPLEMENTATION

CLASS lcl_email_handler IMPLEMENTATION.
  METHOD write_message_int.
    rv_result = `Send to email: ` && iv_message.
  ENDMETHOD.
ENDCLASS.       "lcl_email_handler IMPLEMENTATION
