REPORT zbs_demo_list_report.

DATA key_value TYPE zbs_demo_list-key_value.
DATA doc_type  TYPE zbs_demo_list-doc_type.
DATA persons   TYPE zbs_demo_list-persons.

SELECTION-SCREEN BEGIN OF BLOCK selection WITH FRAME TITLE TEXT-sel.
  SELECT-OPTIONS key FOR key_value.
  PARAMETERS doctype TYPE zbs_demo_list-doc_type.
  SELECT-OPTIONS per FOR persons.
  PARAMETERS valid AS CHECKBOX DEFAULT abap_true.
SELECTION-SCREEN END OF BLOCK selection.

SELECTION-SCREEN BEGIN OF BLOCK options WITH FRAME TITLE TEXT-opt.
  PARAMETERS variant TYPE slis_vari.
SELECTION-SCREEN END OF BLOCK options.

CLASS lcl_report DEFINITION INHERITING FROM zcl_ca_report_salv FINAL.
  PUBLIC SECTION.
    TYPES:
      "! Selection criteria for reading the demo list
      BEGIN OF ts_selection,
        key_values TYPE RANGE OF zbs_demo_list-key_value,
        doctype    TYPE zbs_demo_list-doc_type,
        persons    TYPE RANGE OF zbs_demo_list-persons,
        valid      TYPE abap_boolean,
        variant    TYPE slis_vari,
      END OF ts_selection.

    METHODS
      main REDEFINITION.

  PROTECTED SECTION.
    METHODS
      modify_additional_alv_settings REDEFINITION.

  PRIVATE SECTION.
    "! Function identifier for the custom ALV action
    CONSTANTS c_function_refresh TYPE salv_de_function VALUE 'ZCUST'.

    "! Data displayed in the ALV
    DATA mt_data TYPE STANDARD TABLE OF zbs_demo_list WITH EMPTY KEY.

    "! Reads demo list entries matching the selection criteria
    "! @parameter selection | Selection criteria
    METHODS select_data
      IMPORTING !selection TYPE ts_selection.

    "! Provides the field attributes for the ALV output
    "! @parameter result | Field attributes for all output columns
    METHODS get_field_attributes
      RETURNING VALUE(result) TYPE tt_attribute.

    "! Handles execution of an additional ALV function
    "! @parameter e_salv_function | Executed ALV function
    METHODS on_added_function
      FOR EVENT added_function OF cl_salv_events_table
      IMPORTING e_salv_function.
ENDCLASS.


CLASS lcl_report IMPLEMENTATION.
  METHOD main.
    DATA selection TYPE ts_selection.

    selection = CORRESPONDING #( is_selection ).
    select_data( selection ).

    TRY.
        output_data( ir_data             = REF #( mt_data )
                     id_title            = 'Demo List Report'
                     id_vari             = selection-variant
                     it_field_attributes = get_field_attributes( )
                     io_container        = cl_gui_container=>screen0 ).

      CATCH zcx_ca_report_error INTO DATA(error).
        MESSAGE error TYPE 'S' DISPLAY LIKE 'E'.
    ENDTRY.

    " Triggers Output
    WRITE 'TEST'.
  ENDMETHOD.


  METHOD select_data.
    SELECT FROM zbs_demo_list
      FIELDS *
      WHERE     key_value IN @selection-key_values
            AND doc_type   = @selection-doctype
            AND persons   IN @selection-persons
            AND validated  = @selection-valid
      INTO TABLE @mt_data.
  ENDMETHOD.


  METHOD get_field_attributes.
    result = VALUE #(
        ( field = 'CLIENT'          all_texts = 'Client' hide = abap_true )
        ( field = 'KEY_VALUE'       short = 'Key'        medium = 'Key Value'             long = 'Key Value' )
        ( field = 'DESCRIPTION'     short = 'Desc.'      medium = 'Description'           long = 'Description' )
        ( field = 'DOC_TYPE'        short = 'Doc. Type'  medium = 'Document Type'         long = 'Document Type' )
        ( field = 'DOC_DESCRIPTION' short = 'Doc. Desc.' medium = 'Document Description'  long = 'Document Description' )
        ( field = 'AMOUNT'          short = 'Amount'     medium = 'Amount'                 long = 'Amount' )
        ( field = 'CURRENCY'        short = 'Currency'   medium = 'Currency'               long = 'Currency' )
        ( field = 'SELL_INFO'       short = 'Sell Info'  medium = 'Selling Information'   long = 'Selling Information' )
        ( field = 'PERSONS'         short = 'Persons'    medium = 'Number of Persons'      long = 'Number of Persons' )
        ( field = 'VALIDATED'         short = 'Validated'    medium = 'Validated position'      long = 'Validated position' ) ).
  ENDMETHOD.


  METHOD modify_additional_alv_settings.
    DATA(functions) = mo_alv->get_functions( ).

    TRY.
        functions->add_function( name     = c_function_refresh
                                 icon     = CONV #( icon_refresh )
                                 text     = 'Custom'
                                 tooltip  = 'Custom Function'
                                 position = if_salv_c_function_position=>left_of_salv_functions ).
      CATCH cx_salv_existing cx_salv_wrong_call.
        RETURN.
    ENDTRY.

    DATA(events) = mo_alv->get_event( ).
    SET HANDLER on_added_function FOR events.
  ENDMETHOD.


  METHOD on_added_function.
    IF e_salv_function = c_function_refresh.
      mo_alv->refresh( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

INITIALIZATION.
  DATA(report) = NEW lcl_report( ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR variant.
  report->f4help_alv_variant( CHANGING cd_vari = variant ).

START-OF-SELECTION.
  report->main( VALUE lcl_report=>ts_selection( key_values = key[]
                                                doctype    = doctype
                                                persons    = per[]
                                                valid      = valid
                                                variant    = variant ) ).