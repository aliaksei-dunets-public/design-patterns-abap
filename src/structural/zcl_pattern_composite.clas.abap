CLASS zcl_pattern_composite DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pattern_composite IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_root) = NEW lcl_composite( iv_name = 'ROOT' ).

    DATA(lo_branch1) = NEW lcl_composite( iv_name = 'BR1' ).
    DATA(lo_branch2) = NEW lcl_composite( iv_name = 'BR2' ).

    DATA(lo_leaf1) = NEW lcl_leaf( iv_name = 'LF1' ).
    DATA(lo_leaf2) = NEW lcl_leaf( iv_name = 'LF2' ).

    lo_branch1->add( lo_leaf1 ).
    lo_branch1->add( lo_leaf2 ).

    lo_root->add( lo_branch1 ).
    lo_root->add( lo_branch2 ).

    out->write( lo_root->operation( ) ).

  ENDMETHOD.
ENDCLASS.
