CLASS zcl_factory_method DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FACTORY_METHOD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lo_writer TYPE REF TO lcl_base_writer.
    DATA lo_writer_pdf TYPE REF TO lcl_base_writer.
    DATA lo_writer_alv TYPE REF TO lcl_base_writer.

    lo_writer = lcl_base_writer=>get_writer( ).
    out->write( lo_writer->write_data( ) ).

    lo_writer_pdf = lcl_base_writer=>get_writer( lcl_base_writer=>gc_report_pdf ).
    out->write( lo_writer_pdf->write_data( ) ).

    lo_writer_alv = lcl_base_writer=>get_writer( lcl_base_writer=>gc_report_alv ).
    out->write( lo_writer_alv->write_data( ) ).

  ENDMETHOD.
ENDCLASS.
