*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*&---------------------------------------------------------------------*
*&  Definition of classes
*&---------------------------------------------------------------------*

CLASS lcl_mediator DEFINITION DEFERRED.

CLASS lcl_invoker DEFINITION.
  PUBLIC SECTION.
    METHODS:
      receive_message IMPORTING iv_message      TYPE string
                                iv_from         TYPE string
                      RETURNING VALUE(rv_resul) TYPE string,
      constructor IMPORTING iv_name     TYPE string
                            io_mediator TYPE REF TO lcl_mediator,
      send_message IMPORTING iv_message      TYPE string
                   RETURNING VALUE(rv_resul) TYPE string,
      get_name RETURNING VALUE(rv_name) TYPE string.

  PRIVATE SECTION.
    DATA:
      mv_name     TYPE string,
      mo_mediator TYPE REF TO lcl_mediator.
ENDCLASS.       "lcl_invoker DEFINITION

CLASS lcl_mediator DEFINITION.
  PUBLIC SECTION.
    METHODS:
      add_client IMPORTING io_client TYPE REF TO lcl_invoker,
      send_message IMPORTING iv_message      TYPE string
                             io_sender       TYPE REF TO lcl_invoker
                   RETURNING VALUE(rv_resul) TYPE string.
  PRIVATE SECTION.
    DATA: mt_receivers TYPE TABLE OF REF TO lcl_invoker.
ENDCLASS.       "lcl_mediator DEFINITION

*&---------------------------------------------------------------------*
*&  Implementation of the classes
*&---------------------------------------------------------------------*

CLASS lcl_mediator IMPLEMENTATION.
  METHOD add_client.
    APPEND io_client TO mt_receivers.
  ENDMETHOD.

  METHOD send_message.
    DATA lo_receiver TYPE REF TO lcl_invoker.

    LOOP AT mt_receivers INTO lo_receiver
        WHERE table_line <> io_sender.

      rv_resul = rv_resul && lo_receiver->receive_message( iv_message  = iv_message iv_from = io_sender->get_name( ) ).

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.       "lcl_mediator IMPLEMENTATION

CLASS lcl_invoker IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.
    mo_mediator = io_mediator.
  ENDMETHOD.

  METHOD get_name.
    rv_name = mv_name.
  ENDMETHOD.

  METHOD receive_message.
    rv_resul = mv_name && ` receive message:` && iv_message && ` from:` && iv_from.
  ENDMETHOD.

  METHOD send_message.
    rv_resul = mo_mediator->send_message( iv_message = iv_message io_sender  = me ).
  ENDMETHOD.
ENDCLASS.       "lcl_invoker IMPLEMENTATION
