CLASS zcl_chain_of_responsibility DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CHAIN_OF_RESPONSIBILITY IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_email_handler) = NEW lcl_email_handler(
        iv_mask = lcl_message_handler=>gc_error_msg
    ).

    DATA(lo_log_handler) = NEW lcl_log_handler(
      io_next = lo_email_handler
      iv_mask = lcl_message_handler=>gc_warning_msg
    ).

    DATA(lo_write_handler) = NEW lcl_write_handler(
      io_next = lo_log_handler
      iv_mask = lcl_message_handler=>gc_notice_msg
    ).

    out->write( lo_write_handler->write_message(
                  iv_message  = 'The error will be performed by all of the handlers'
                  iv_priority = lcl_write_handler=>gc_error_msg
                ) ).

    out->write( lo_write_handler->write_message(
                  iv_message  = 'The error will be performed only by the Write handler'
                  iv_priority = lcl_write_handler=>gc_notice_msg
                ) ).

    out->write( lo_write_handler->write_message(
                      iv_message  = 'The error will be performed by the Write and Log handlers'
                      iv_priority = lcl_write_handler=>gc_warning_msg
                    ) ).

  ENDMETHOD.
ENDCLASS.
