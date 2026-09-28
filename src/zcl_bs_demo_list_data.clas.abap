CLASS zcl_bs_demo_list_data DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES data_table TYPE STANDARD TABLE OF zbs_demo_list WITH EMPTY KEY.

    CLASS-METHODS get_test_data
      RETURNING VALUE(result) TYPE data_table.
ENDCLASS.


CLASS zcl_bs_demo_list_data IMPLEMENTATION.
  METHOD get_test_data.
    DATA(test_data) = VALUE data_table( validated = abap_true
                                        ( key_value       = 'LAPTOP'
                                          description     = 'Business laptop with 14-inch display'
                                          doc_type        = 'OR'
                                          doc_description = 'Customer sales order'
                                          amount          = '1299.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Online store, Germany'
                                          persons         = 2 )
                                        ( key_value       = 'MONITOR'
                                          description     = '27-inch UHD office monitor'
                                          doc_type        = 'OR'
                                          doc_description = 'Customer sales order'
                                          amount          = '549.00'
                                          currency        = 'USD'
                                          sell_info       = 'Corporate account, United States'
                                          persons         = 4 )
                                        ( key_value       = 'KEYBOARD'
                                          description     = 'Wireless mechanical keyboard'
                                          doc_type        = 'IN'
                                          doc_description = 'Issued customer invoice'
                                          amount          = '149.00'
                                          currency        = 'GBP'
                                          sell_info       = 'Retail partner, United Kingdom'
                                          persons         = 1 )
                                        ( key_value       = 'MOUSE'
                                          description     = 'Ergonomic wireless mouse'
                                          doc_type        = 'IN'
                                          doc_description = 'Issued customer invoice'
                                          amount          = '89.00'
                                          currency        = 'CHF'
                                          sell_info       = 'Direct sale, Switzerland'
                                          persons         = 1 )
                                        ( key_value       = 'HEADSET'
                                          description     = 'Noise-cancelling office headset'
                                          doc_type        = 'CR'
                                          doc_description = 'Customer credit memo'
                                          amount          = '179.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Service adjustment, France'
                                          persons         = 2 )
                                        ( key_value       = 'DOCK'
                                          description     = 'USB-C docking station with power delivery'
                                          doc_type        = 'CR'
                                          doc_description = 'Customer credit memo'
                                          amount          = '229.00'
                                          currency        = 'USD'
                                          sell_info       = 'Price correction, United States'
                                          persons         = 2 )
                                        ( key_value       = 'WEBCAM'
                                          description     = '4K webcam with dual microphones'
                                          doc_type        = 'RT'
                                          doc_description = 'Customer return'
                                          amount          = '129.00'
                                          currency        = 'GBP'
                                          sell_info       = 'Returned by online customer'
                                          persons         = 1 )
                                        ( key_value       = 'PRINTER'
                                          description     = 'Color laser printer for workgroups'
                                          doc_type        = 'RT'
                                          doc_description = 'Customer return'
                                          amount          = '699.00'
                                          currency        = 'CHF'
                                          sell_info       = 'Returned by corporate customer'
                                          persons         = 3 )
                                        ( key_value       = 'TABLET'
                                          description     = '11-inch tablet with stylus'
                                          doc_type        = 'QT'
                                          doc_description = 'Customer quotation'
                                          amount          = '89900.00'
                                          currency        = 'JPY'
                                          sell_info       = 'Quotation for Tokyo branch'
                                          persons         = 3 )
                                        ( key_value       = 'PHONE'
                                          description     = 'Dual-SIM business smartphone'
                                          doc_type        = 'QT'
                                          doc_description = 'Customer quotation'
                                          amount          = '799.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Quotation for enterprise rollout'
                                          persons         = 5 )
                                        ( key_value       = 'SERVER'
                                          description     = 'Rack server with redundant power supplies'
                                          doc_type        = 'OR'
                                          doc_description = 'Customer sales order'
                                          amount          = '6499.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Data center project, Germany'
                                          persons         = 8 )
                                        ( key_value       = 'ROUTER'
                                          description     = 'Enterprise router with secure VPN gateway'
                                          doc_type        = 'OR'
                                          doc_description = 'Customer sales order'
                                          amount          = '1899.00'
                                          currency        = 'USD'
                                          sell_info       = 'Branch office rollout, United States'
                                          persons         = 4 )
                                        ( key_value       = 'SCANNER'
                                          description     = 'High-speed duplex document scanner'
                                          doc_type        = 'OR'
                                          doc_description = 'Customer sales order'
                                          amount          = '759.00'
                                          currency        = 'GBP'
                                          sell_info       = 'Legal office order, United Kingdom'
                                          persons         = 3 )
                                        ( key_value       = 'PROJECTOR'
                                          description     = 'Laser projector for large meeting rooms'
                                          doc_type        = 'OR'
                                          doc_description = 'Customer sales order'
                                          amount          = '3299.00'
                                          currency        = 'CHF'
                                          sell_info       = 'Conference room upgrade, Switzerland'
                                          persons         = 6 )
                                        ( key_value       = 'SPEAKER'
                                          description     = 'Portable conference speakerphone'
                                          doc_type        = 'IN'
                                          doc_description = 'Issued customer invoice'
                                          amount          = '249.00'
                                          currency        = 'JPY'
                                          sell_info       = 'Consulting team purchase, Japan'
                                          persons         = 2 )
                                        ( key_value       = 'MICROPHONE'
                                          description     = 'USB studio microphone for presentations'
                                          doc_type        = 'IN'
                                          doc_description = 'Issued customer invoice'
                                          amount          = '189.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Training department, Austria'
                                          persons         = 2 )
                                        ( key_value       = 'SSD'
                                          description     = 'Two-terabyte encrypted solid-state drive'
                                          doc_type        = 'IN'
                                          doc_description = 'Issued customer invoice'
                                          amount          = '219.00'
                                          currency        = 'USD'
                                          sell_info       = 'Engineering team, United States'
                                          persons         = 5 )
                                        ( key_value       = 'MEMORY'
                                          description     = 'Thirty-two gigabyte workstation memory kit'
                                          doc_type        = 'IN'
                                          doc_description = 'Issued customer invoice'
                                          amount          = '139.00'
                                          currency        = 'GBP'
                                          sell_info       = 'Design studio upgrade, United Kingdom'
                                          persons         = 4 )
                                        ( key_value       = 'CHARGER'
                                          description     = 'Universal 100-watt USB-C travel charger'
                                          doc_type        = 'CR'
                                          doc_description = 'Customer credit memo'
                                          amount          = '79.00'
                                          currency        = 'CHF'
                                          sell_info       = 'Duplicate billing correction, Switzerland'
                                          persons         = 1 )
                                        ( key_value       = 'ADAPTER'
                                          description     = 'Multiport USB-C video and network adapter'
                                          doc_type        = 'CR'
                                          doc_description = 'Customer credit memo'
                                          amount          = '99.00'
                                          currency        = 'JPY'
                                          sell_info       = 'Promotional rebate, Japan'
                                          persons         = 1 )
                                        ( key_value       = 'CABLE'
                                          description     = 'Three-meter certified HDMI cable'
                                          doc_type        = 'CR'
                                          doc_description = 'Customer credit memo'
                                          amount          = '35.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Shipping issue adjustment, Spain'
                                          persons         = 1 )
                                        ( key_value       = 'BATTERY'
                                          description     = 'High-capacity laptop replacement battery'
                                          doc_type        = 'CR'
                                          doc_description = 'Customer credit memo'
                                          amount          = '159.00'
                                          currency        = 'USD'
                                          sell_info       = 'Warranty allowance, United States'
                                          persons         = 2 )
                                        ( key_value       = 'CAMERA'
                                          description     = 'Mirrorless camera for corporate media'
                                          doc_type        = 'RT'
                                          doc_description = 'Customer return'
                                          amount          = '1499.00'
                                          currency        = 'GBP'
                                          sell_info       = 'Returned after evaluation, United Kingdom'
                                          persons         = 2 )
                                        ( key_value       = 'TRIPOD'
                                          description     = 'Carbon-fiber professional camera tripod'
                                          doc_type        = 'RT'
                                          doc_description = 'Customer return'
                                          amount          = '349.00'
                                          currency        = 'CHF'
                                          sell_info       = 'Returned due to specification mismatch'
                                          persons         = 1 )
                                        ( key_value       = 'DRONE'
                                          description     = 'Compact inspection drone with 4K camera'
                                          doc_type        = 'RT'
                                          doc_description = 'Customer return'
                                          amount          = '119000.00'
                                          currency        = 'JPY'
                                          sell_info       = 'Returned by survey team, Japan'
                                          persons         = 3 )
                                        ( key_value       = 'SMARTWATCH'
                                          description     = 'Rugged smartwatch for field employees'
                                          doc_type        = 'RT'
                                          doc_description = 'Customer return'
                                          amount          = '399.00'
                                          currency        = 'EUR'
                                          sell_info       = 'Returned after field trial, Italy'
                                          persons         = 2 )
                                        ( key_value       = 'TV'
                                          description     = 'Sixty-five inch commercial display'
                                          doc_type        = 'QT'
                                          doc_description = 'Customer quotation'
                                          amount          = '2199.00'
                                          currency        = 'USD'
                                          sell_info       = 'Quotation for hotel lobby displays'
                                          persons         = 7 )
                                        ( key_value       = 'CONSOLE'
                                          description     = 'Current-generation training game console'
                                          doc_type        = 'QT'
                                          doc_description = 'Customer quotation'
                                          amount          = '479.00'
                                          currency        = 'GBP'
                                          sell_info       = 'Quotation for recreation center'
                                          persons         = 3 )
                                        ( key_value       = 'CHAIR'
                                          description     = 'Adjustable ergonomic office chair'
                                          doc_type        = 'QT'
                                          doc_description = 'Customer quotation'
                                          amount          = '849.00'
                                          currency        = 'CHF'
                                          sell_info       = 'Quotation for new office floor'
                                          persons         = 12 )
                                        ( key_value       = 'DESK'
                                          description     = 'Electric height-adjustable office desk'
                                          doc_type        = 'QT'
                                          doc_description = 'Customer quotation'
                                          amount          = '98000.00'
                                          currency        = 'JPY'
                                          sell_info       = 'Quotation for Osaka branch office'
                                          persons         = 10 ) ).

    result = test_data.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA(test_data) = get_test_data( ).

    DELETE FROM zbs_demo_list.
    INSERT zbs_demo_list FROM TABLE @test_data.

    out->write( |Inserted { lines( test_data ) } sold items.| ).
  ENDMETHOD.
ENDCLASS.
