*"* use this source file for your ABAP unit test classes

CLASS ltc_data DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS data_is_complete FOR TESTING.
ENDCLASS.


CLASS ltc_data IMPLEMENTATION.
  METHOD data_is_complete.
    DATA document_types TYPE SORTED TABLE OF zbs_demo_list-doc_type WITH UNIQUE KEY table_line.
    DATA currencies     TYPE SORTED TABLE OF zbs_demo_list-currency WITH UNIQUE KEY table_line.

    DATA(test_data) = zcl_bs_demo_list_data=>get_test_data( ).

    cl_abap_unit_assert=>assert_equals( exp = 30
                                        act = lines( test_data ) ).

    LOOP AT test_data ASSIGNING FIELD-SYMBOL(<item>).
      INSERT <item>-doc_type INTO TABLE document_types.
      INSERT <item>-currency INTO TABLE currencies.

      cl_abap_unit_assert=>assert_equals( exp = to_upper( <item>-key_value )
                                          act = <item>-key_value ).
      cl_abap_unit_assert=>assert_not_initial( <item>-description ).
      cl_abap_unit_assert=>assert_not_initial( <item>-doc_description ).
      cl_abap_unit_assert=>assert_not_initial( <item>-sell_info ).
      cl_abap_unit_assert=>assert_true( xsdbool( <item>-amount > 0 ) ).
      cl_abap_unit_assert=>assert_true( xsdbool( <item>-persons > 0 ) ).
    ENDLOOP.

    cl_abap_unit_assert=>assert_equals( exp = 5
                                        act = lines( document_types ) ).
    cl_abap_unit_assert=>assert_true( xsdbool( lines( currencies ) > 3 ) ).
  ENDMETHOD.
ENDCLASS.

