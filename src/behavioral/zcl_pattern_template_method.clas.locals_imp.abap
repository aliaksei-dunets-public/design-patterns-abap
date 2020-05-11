*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_template_discount DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      calc_discount IMPORTING iv_product         TYPE string
                              iv_customer        TYPE string
                    RETURNING VALUE(rv_discount) TYPE i.
  PROTECTED SECTION.
    METHODS:
      calc_product_discount ABSTRACT
        IMPORTING iv_product         TYPE string
        RETURNING VALUE(rv_discount) TYPE i,

      calc_customer_discount ABSTRACT
        IMPORTING iv_customer        TYPE string
        RETURNING VALUE(rv_discount) TYPE i.
ENDCLASS.       "lcl_template_discount DEFINITION

CLASS lcl_workday_discount DEFINITION INHERITING FROM lcl_template_discount.
  PROTECTED SECTION.
    METHODS:
      calc_product_discount REDEFINITION,
      calc_customer_discount REDEFINITION.
ENDCLASS.       "lcl_workday_discount DEFINITION

CLASS lcl_template_discount IMPLEMENTATION.
  METHOD calc_discount.
    DATA(lv_product_discount) = calc_product_discount( iv_product ).
    DATA(lv_customer_discount) = calc_customer_discount( iv_customer ).

    IF lv_product_discount > lv_customer_discount.
      rv_discount = lv_product_discount.
    ELSE.
      rv_discount = lv_customer_discount.
    ENDIF.
  ENDMETHOD.
ENDCLASS.       "lcl_template_discount IMPLEMENTATION

CLASS lcl_workday_discount IMPLEMENTATION.
  METHOD calc_customer_discount.
    CASE iv_customer.
      WHEN 'Jonh'.
        rv_discount = 10.
      WHEN OTHERS.
        rv_discount = 5.
    ENDCASE.
  ENDMETHOD.

  METHOD calc_product_discount.
    CASE iv_product.
      WHEN 'Milk'.
        rv_discount = 10.
      WHEN OTHERS.
        rv_discount = 5.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.       "lcl_workday_discount IMPLEMENTATION
