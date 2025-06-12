CLASS lhc_MainModules DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR MainModules RESULT result.
    METHODS generate_data FOR MODIFY
      IMPORTING keys FOR ACTION mainmodules~generate_data.

ENDCLASS.

CLASS lhc_MainModules IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD generate_data.
    DATA: lt_created_module   TYPE TABLE OF ykpi_t_module,
          lt_created_modulex  TYPE TABLE OF ykpi_t_modulex,
          lt_created_process  TYPE TABLE OF ykpi_t_process,
          lt_created_processx TYPE TABLE OF ykpi_t_processx,
          lt_created_source   TYPE TABLE OF ykpi_t_source,
          lt_created_sourcex  TYPE TABLE OF ykpi_t_sourcex.

    lt_created_module = VALUE #( ( main_module = 'MM' )
                                 ( main_module = 'SD' )
                                 ( main_module = 'PP' )
                                 ( main_module = 'FI' )
                                 ( main_module = 'CO' )
                                 ( main_module = 'PM' )
                                 ( main_module = 'QM' ) ).

    lt_created_modulex = VALUE #( ( language = 'T'
                                    main_module = 'MM'
                                    description = 'Malzeme Yönetimi' )
                                  ( language = 'T'
                                    main_module = 'SD'
                                    description = 'Satış & Dağıtım' )
                                  ( language = 'T'
                                    main_module = 'PP'
                                    description = 'Üretim Planlama' )
                                  ( language = 'T'
                                    main_module = 'FI'
                                    description = 'Finans Muhasebesi' )
                                  ( language = 'T'
                                    main_module = 'CO'
                                    description = 'Finans Kontrol' )
                                  ( language = 'T'
                                    main_module = 'PM'
                                    description = 'İşletme Bakım' )
                                  ( language = 'T'
                                    main_module = 'QM'
                                    description = 'Kalite Kontrol' )

                                  ( language = 'E'
                                    main_module = 'MM'
                                    description = 'Material Management' )
                                  ( language = 'E'
                                    main_module = 'SD'
                                    description = 'Sales & Distribution' )
                                  ( language = 'E'
                                    main_module = 'PP'
                                    description = 'Production Planning' )
                                  ( language = 'E'
                                    main_module = 'FI'
                                    description = 'Financial Accounting' )
                                  ( language = 'E'
                                    main_module = 'CO'
                                    description = 'Financial Controlling' )
                                  ( language = 'E'
                                    main_module = 'PM'
                                    description = 'Plant Maintenance' )
                                  ( language = 'E'
                                    main_module = 'QM'
                                    description = 'Quality Management' ) ).

    lt_created_process = VALUE #( ( main_module = 'MM'
                                    business_process = 'GOODSMOV' )
                                  ( main_module = 'MM'
                                    business_process = 'MATERIAL' )
                                  ( main_module = 'MM'
                                    business_process = 'PURCHORD' )
                                  ( main_module = 'MM'
                                    business_process = 'PURCHREQ' )
                                  ( main_module = 'MM'
                                    business_process = 'INVREC' )
                                  ( main_module = 'MM'
                                    business_process = 'INBDLV' )
                                  ( main_module = 'SD'
                                    business_process = 'SALESORDER' )
                                  ( main_module = 'SD'
                                    business_process = 'OUTBDLV' )
                                  ( main_module = 'SD'
                                    business_process = 'BILLING' )
                                  ( main_module = 'PP'
                                    business_process = 'PRODORDER' )
                                  ( main_module = 'PP'
                                    business_process = 'ORDERCONF' )
                                  ( main_module = 'FI'
                                    business_process = 'PARTNER' )
                                  ( main_module = 'FI'
                                    business_process = 'ACCDOC' ) ).
*                                  ( main_module = 'CO' )
*                                  ( main_module = 'PM' )
*                                  ( main_module = 'QM' ) ).

    lt_created_processx = VALUE #( ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'GOODSMOV'
                                     description = 'Mal Hareketi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'MATERIAL'
                                     description = 'Malzeme Ana Verisi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'PURCHORD'
                                     description = 'Satınalma Siparişi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'PURCHREQ'
                                     description = 'Satınalma Talebi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'INVREC'
                                     description = 'Fatura' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'INBDLV'
                                     description = 'Gelen Teslimat' )
                                   ( language = 'T'
                                     main_module = 'SD'
                                     business_process = 'SALESORDER'
                                     description = 'Satış Siparişi' )
                                   ( language = 'T'
                                     main_module = 'SD'
                                     business_process = 'OUTBDLV'
                                     description = 'Gönderilen Teslimat' )
                                   ( language = 'T'
                                     main_module = 'SD'
                                     business_process = 'BILLING'
                                     description = 'Fatura' )
                                   ( language = 'T'
                                     main_module = 'PP'
                                     business_process = 'PRODORDER'
                                     description = 'Üretim Siparişi' )
                                   ( language = 'T'
                                     main_module = 'PP'
                                     business_process = 'ORDERCONF'
                                     description = 'Teyit' )
                                   ( language = 'T'
                                     main_module = 'FI'
                                     business_process = 'PARTNER'
                                     description = 'Muhatap Ana Verisi' )
                                   ( language = 'T'
                                     main_module = 'FI'
                                     business_process = 'ACCDOC'
                                     description = 'Muhasebe Belgesi' )

                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'GOODSMOV'
                                     description = 'Goods Movement' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'MATERIAL'
                                     description = 'Material Master' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'PURCHORD'
                                     description = 'Purchase Order' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'PURCHREQ'
                                     description = 'Purchase Requsition' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'INVREC'
                                     description = 'Invoice' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'INBDLV'
                                     description = 'Inbound Delivery' )
                                   ( language = 'E'
                                     main_module = 'SD'
                                     business_process = 'SALESORDER'
                                     description = 'Sales Order' )
                                   ( language = 'E'
                                     main_module = 'SD'
                                     business_process = 'OUTBDLV'
                                     description = 'Outbound Delivery' )
                                   ( language = 'E'
                                     main_module = 'SD'
                                     business_process = 'BILLING'
                                     description = 'Billing' )
                                   ( language = 'E'
                                     main_module = 'PP'
                                     business_process = 'PRODORDER'
                                     description = 'Production Order' )
                                   ( language = 'E'
                                     main_module = 'PP'
                                     business_process = 'ORDERCONF'
                                     description = 'Confirmation' )
                                   ( language = 'E'
                                     main_module = 'FI'
                                     business_process = 'PARTNER'
                                     description = 'Partner Master' )
                                   ( language = 'E'
                                     main_module = 'FI'
                                     business_process = 'ACCDOC'
                                     description = 'Accounting Document' ) ).

    lt_created_source = VALUE #( ( main_module = 'MM'
                                   business_process = 'GOODSMOV'
                                   data_source = 'I_MATERIALDOCUMENTHEADER_2'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'MM'
                                   business_process = 'MATERIAL'
                                   data_source = 'I_PRODUCT'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'MM'
                                   business_process = 'PURCHORD'
                                   data_source = 'I_PURCHASEORDERAPI01'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'MM'
                                   business_process = 'PURCHREQ'
                                   data_source = 'I_PURCHASEREQUISITIONITEMAPI01'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   group_by_fields = 'PURCHASEREQUISITION'
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'MM'
                                   business_process = 'INVREC'
                                   data_source = 'I_SUPPLIERINVOICEAPI01'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'MM'
                                   business_process = 'INBDLV'
                                   data_source = 'I_DELIVERYDOCUMENT'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = 'SDDOCUMENTCATEGORY = ''7'''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'SD'
                                   business_process = 'SALESORDER'
                                   data_source = 'I_SALESORDER'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = 'SDDOCUMENTCATEGORY = ''C'''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'SD'
                                   business_process = 'OUTBDLV'
                                   data_source = 'I_DELIVERYDOCUMENT'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = 'SDDOCUMENTCATEGORY = ''J'''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'SD'
                                   business_process = 'BILLING'
                                   data_source = 'I_BILLINGDOCUMENT'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'FI'
                                   business_process = 'PARTNER'
                                   data_source = 'I_BUSINESSPARTNER'
                                   created_by_field = 'CREATEDBYUSER'
                                   create_date_field = 'CREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 )
                                 ( main_module = 'FI'
                                   business_process = 'ACCDOC'
                                   data_source = 'I_JOURNALENTRY'
                                   created_by_field = 'ACCOUNTINGDOCCREATEDBYUSER'
                                   create_date_field = 'ACCOUNTINGDOCUMENTCREATIONDATE'
                                   additional_filter = ''
                                   lower_limit = 5
                                   upper_limit = 10 ) ).

    lt_created_sourcex = VALUE #( ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'GOODSMOV'
                                     data_source = 'I_MATERIALDOCUMENTHEADER_2'
                                     description = 'Mal Hareketi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'MATERIAL'
                                     data_source = 'I_PRODUCT'
                                     description = 'Malzeme Ana Verisi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'PURCHORD'
                                     data_source = 'I_PURCHASEORDERAPI01'
                                     description = 'Satınalma Siparişi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'PURCHREQ'
                                     data_source = 'I_PURCHASEREQUISITIONITEMAPI01'
                                     description = 'Satınalma Talebi' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'INVREC'
                                     data_source = 'I_SUPPLIERINVOICEAPI01'
                                     description = 'Fatura' )
                                   ( language = 'T'
                                     main_module = 'MM'
                                     business_process = 'INBDLV'
                                     data_source = 'I_DELIVERYDOCUMENT'
                                     description = 'Gelen Teslimat' )
                                   ( language = 'T'
                                     main_module = 'SD'
                                     business_process = 'SALESORDER'
                                     data_source = 'I_SALESORDER'
                                     description = 'Satış Siparişi' )
                                   ( language = 'T'
                                     main_module = 'SD'
                                     business_process = 'OUTBDLV'
                                     data_source = 'I_DELIVERYDOCUMENT'
                                     description = 'Gönderilen Teslimat' )
                                   ( language = 'T'
                                     main_module = 'SD'
                                     business_process = 'BILLING'
                                     data_source = 'I_BILLINGDOCUMENT'
                                     description = 'Fatura' )
                                   ( language = 'T'
                                     main_module = 'FI'
                                     business_process = 'PARTNER'
                                     data_source = 'I_BUSINESSPARTNER'
                                     description = 'Muhatap Ana Verisi' )
                                   ( language = 'T'
                                     main_module = 'FI'
                                     business_process = 'ACCDOC'
                                     data_source = 'I_JOURNALENTRY'
                                     description = 'Muhasebe Belgesi' )

                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'GOODSMOV'
                                     data_source = 'I_MATERIALDOCUMENTHEADER_2'
                                     description = 'Goods Movement' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'MATERIAL'
                                     data_source = 'I_PRODUCT'
                                     description = 'Material Master' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'PURCHORD'
                                     data_source = 'I_PURCHASEORDERAPI01'
                                     description = 'Purchase Order' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'PURCHREQ'
                                     data_source = 'I_PURCHASEREQUISITIONITEMAPI01'
                                     description = 'Purchase Requsition' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'INVREC'
                                     data_source = 'I_SUPPLIERINVOICEAPI01'
                                     description = 'Invoice' )
                                   ( language = 'E'
                                     main_module = 'MM'
                                     business_process = 'INBDLV'
                                     data_source = 'I_DELIVERYDOCUMENT'
                                     description = 'Inbound Delivery' )
                                   ( language = 'E'
                                     main_module = 'SD'
                                     business_process = 'SALESORDER'
                                     data_source = 'I_SALESORDER'
                                     description = 'Sales Order' )
                                   ( language = 'E'
                                     main_module = 'SD'
                                     business_process = 'OUTBDLV'
                                     data_source = 'I_DELIVERYDOCUMENT'
                                     description = 'Outbound Delivery' )
                                   ( language = 'E'
                                     main_module = 'SD'
                                     business_process = 'BILLING'
                                     data_source = 'I_BILLINGDOCUMENT'
                                     description = 'Billing' )
                                   ( language = 'E'
                                     main_module = 'FI'
                                     business_process = 'PARTNER'
                                     data_source = 'I_BUSINESSPARTNER'
                                     description = 'Partner Master' )
                                   ( language = 'E'
                                     main_module = 'FI'
                                     business_process = 'ACCDOC'
                                     data_source = 'I_JOURNALENTRY'
                                     description = 'Accounting Document' ) ).

    IF lt_created_module IS NOT INITIAL.
      DELETE ykpi_t_module FROM TABLE @lt_created_module.
      INSERT ykpi_t_module FROM TABLE @lt_created_module.
    ENDIF.
    IF lt_created_modulex IS NOT INITIAL.
      DELETE ykpi_t_modulex FROM TABLE @lt_created_modulex.
      INSERT ykpi_t_modulex FROM TABLE @lt_created_modulex.
    ENDIF.
    IF lt_created_process IS NOT INITIAL.
      DELETE ykpi_t_process FROM TABLE @lt_created_process.
      INSERT ykpi_t_process FROM TABLE @lt_created_process.
    ENDIF.
    IF lt_created_processx IS NOT INITIAL.
      DELETE ykpi_t_processx FROM TABLE @lt_created_processx.
      INSERT ykpi_t_processx FROM TABLE @lt_created_processx.
    ENDIF.
    IF lt_created_source IS NOT INITIAL.
      DELETE ykpi_t_source FROM TABLE @lt_created_source.
      INSERT ykpi_t_source FROM TABLE @lt_created_source.
    ENDIF.
    IF lt_created_sourcex IS NOT INITIAL.
      DELETE ykpi_t_sourcex FROM TABLE @lt_created_sourcex.
      INSERT ykpi_t_sourcex FROM TABLE @lt_created_sourcex.
    ENDIF.

    APPEND VALUE #( %msg = new_message( id       = 'YKPI'
                                        number   = '001'
                                        severity = if_abap_behv_message=>severity-success ) ) TO reported-mainmodules.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_YKPI_I_MAIN_MODULES DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_YKPI_I_MAIN_MODULES IMPLEMENTATION.

  METHOD save_modified.
    DATA: lt_created_module   TYPE TABLE OF ykpi_t_module,
          lt_created_modulex  TYPE TABLE OF ykpi_t_modulex,
          lt_created_process  TYPE TABLE OF ykpi_t_process,
          lt_created_processx TYPE TABLE OF ykpi_t_processx,
          lt_created_source   TYPE TABLE OF ykpi_t_source,
          lt_created_sourcex  TYPE TABLE OF ykpi_t_sourcex,
          lt_updated_modulex  TYPE TABLE OF ykpi_t_modulex,
          lt_updated_processx TYPE TABLE OF ykpi_t_processx,
          lt_updated_source   TYPE TABLE OF ykpi_t_source,
          lt_updated_sourcex  TYPE TABLE OF ykpi_t_sourcex,
          lt_deleted_module   TYPE TABLE OF ykpi_t_module,
          lt_deleted_modulex  TYPE TABLE OF ykpi_t_modulex,
          lt_deleted_process  TYPE TABLE OF ykpi_t_process,
          lt_deleted_processx TYPE TABLE OF ykpi_t_processx,
          lt_deleted_source   TYPE TABLE OF ykpi_t_source,
          lt_deleted_sourcex  TYPE TABLE OF ykpi_t_sourcex.

    IF delete-mainmodules IS NOT INITIAL.
      lt_deleted_module = VALUE #( FOR ls_delete_module IN delete-mainmodules
                                       ( main_module = ls_delete_module-MainModule ) ).
      SELECT *
        FROM ykpi_t_modulex
        FOR ALL ENTRIES IN @delete-mainmodules
        WHERE main_module = @delete-mainmodules-mainmodule
        INTO TABLE @lt_deleted_modulex.
    ENDIF.

    IF delete-businessprocesses IS NOT INITIAL.
      lt_deleted_process = VALUE #( FOR ls_delete_process IN delete-businessprocesses
                                       ( main_module = ls_delete_process-MainModule
                                         business_process = ls_delete_process-BusinessProcess ) ).

      SELECT *
        FROM ykpi_t_processx
        FOR ALL ENTRIES IN @delete-businessprocesses
        WHERE main_module = @delete-businessprocesses-mainmodule
          AND business_process = @delete-businessprocesses-businessprocess
        INTO TABLE @lt_deleted_processx.
    ENDIF.

    IF delete-datasources IS NOT INITIAL.
      lt_deleted_source = VALUE #( FOR ls_delete_source IN delete-datasources
                                       ( main_module = ls_delete_source-MainModule
                                         business_process = ls_delete_source-BusinessProcess
                                         data_source = ls_delete_source-DataSource ) ).

      SELECT *
        FROM ykpi_t_sourcex
        FOR ALL ENTRIES IN @delete-datasources
        WHERE main_module = @delete-datasources-mainmodule
          AND business_process = @delete-datasources-businessprocess
          AND data_source = @delete-datasources-DataSource
        INTO TABLE @lt_deleted_sourcex.
    ENDIF.

    IF update-mainmodules IS NOT INITIAL.
      SELECT *
        FROM ykpi_t_modulex
        FOR ALL ENTRIES IN @update-mainmodules
        WHERE language = @sy-langu
          AND main_module = @update-mainmodules-mainmodule
        INTO TABLE @lt_updated_modulex.

      LOOP AT update-mainmodules INTO DATA(ls_update_module).
        IF ls_update_module-%control-Description = if_abap_behv=>mk-on.
          lt_updated_modulex[  main_module = ls_update_module-MainModule ]-description = ls_update_module-Description.
        ENDIF.
      ENDLOOP.
    ENDIF.

    IF update-businessprocesses IS NOT INITIAL.
      SELECT *
        FROM ykpi_t_processx
        FOR ALL ENTRIES IN @update-businessprocesses
        WHERE language = @sy-langu
          AND main_module = @update-businessprocesses-mainmodule
          AND business_process = @update-businessprocesses-businessprocess
        INTO TABLE @lt_updated_processx.

      LOOP AT update-businessprocesses INTO DATA(ls_update_process).
        IF ls_update_process-%control-Description = if_abap_behv=>mk-on.
          lt_updated_processx[  main_module = ls_update_process-MainModule
                                business_process = ls_update_process-BusinessProcess ]-description = ls_update_process-Description.
        ENDIF.
      ENDLOOP.
    ENDIF.

    IF update-datasources IS NOT INITIAL.
      SELECT *
        FROM ykpi_t_sourcex
        FOR ALL ENTRIES IN @update-datasources
        WHERE language = @sy-langu
          AND main_module = @update-datasources-mainmodule
          AND business_process = @update-datasources-businessprocess
          AND data_source = @update-datasources-DataSource
        INTO TABLE @lt_updated_sourcex.

      SELECT *
        FROM ykpi_t_source
        FOR ALL ENTRIES IN @update-datasources
        WHERE main_module = @update-datasources-mainmodule
          AND business_process = @update-datasources-businessprocess
          AND data_source = @update-datasources-DataSource
        INTO TABLE @lt_updated_source.

      SORT lt_updated_source BY main_module business_process data_source.
      SORT lt_updated_sourcex BY main_module business_process data_source.

      LOOP AT update-datasources INTO DATA(ls_update_source).
        IF ls_update_source-%control-Description = if_abap_behv=>mk-on.
          lt_updated_sourcex[  main_module = ls_update_source-MainModule
                               business_process = ls_update_source-BusinessProcess
                               data_source = ls_update_source-DataSource ]-description = ls_update_source-Description.
        ENDIF.

        CHECK ls_update_source-%control-AdditionalFilter = if_abap_behv=>mk-on OR
              ls_update_source-%control-GroupByFields = if_abap_behv=>mk-on OR
              ls_update_source-%control-CreateDateField = if_abap_behv=>mk-on OR
              ls_update_source-%control-CreatedByField = if_abap_behv=>mk-on OR
              ls_update_source-%control-DataCollectionClass = if_abap_behv=>mk-on OR
              ls_update_source-%control-DataCollectionMethod = if_abap_behv=>mk-on OR
              ls_update_source-%control-LowerLimit = if_abap_behv=>mk-on OR
              ls_update_source-%control-UpperLimit = if_abap_behv=>mk-on.

        READ TABLE lt_updated_source
          ASSIGNING FIELD-SYMBOL(<fs_source>)
          WITH KEY main_module = ls_update_source-MainModule
                   business_process = ls_update_source-BusinessProcess
                   data_source = ls_update_source-DataSource
          BINARY SEARCH.
        CHECK sy-subrc = 0.
        IF ls_update_source-%control-AdditionalFilter = if_abap_behv=>mk-on.
          <fs_source>-additional_filter = ls_update_source-AdditionalFilter.
        ENDIF.
        IF ls_update_source-%control-GroupByFields = if_abap_behv=>mk-on.
          <fs_source>-group_by_fields = ls_update_source-GroupByFields.
        ENDIF.
        IF ls_update_source-%control-CreateDateField = if_abap_behv=>mk-on.
          <fs_source>-create_date_field = ls_update_source-CreateDateField.
        ENDIF.
        IF ls_update_source-%control-CreatedByField = if_abap_behv=>mk-on.
          <fs_source>-created_by_field = ls_update_source-CreatedByField.
        ENDIF.
        IF ls_update_source-%control-DataCollectionClass = if_abap_behv=>mk-on.
          <fs_source>-data_collection_class = ls_update_source-DataCollectionClass.
        ENDIF.
        IF ls_update_source-%control-DataCollectionMethod = if_abap_behv=>mk-on.
          <fs_source>-data_collection_method = ls_update_source-DataCollectionMethod.
        ENDIF.
        IF ls_update_source-%control-LowerLimit = if_abap_behv=>mk-on.
          <fs_source>-lower_limit = ls_update_source-LowerLimit.
        ENDIF.
        IF ls_update_source-%control-UpperLimit = if_abap_behv=>mk-on.
          <fs_source>-upper_limit = ls_update_source-UpperLimit.
        ENDIF.
      ENDLOOP.
    ENDIF.

    LOOP AT create-mainmodules INTO DATA(ls_create_module).
      APPEND VALUE #( main_module = ls_create_module-MainModule ) TO lt_created_module.
      APPEND VALUE #( language = sy-langu
                      main_module = ls_create_module-MainModule
                      description = ls_create_module-Description ) TO lt_created_modulex.
    ENDLOOP.

    LOOP AT create-businessprocesses INTO DATA(ls_create_process).
      APPEND VALUE #( main_module = ls_create_process-MainModule
                      business_process = ls_create_process-BusinessProcess ) TO lt_created_process.
      APPEND VALUE #( language = sy-langu
                      main_module = ls_create_process-MainModule
                      business_process = ls_create_process-BusinessProcess
                      description = ls_create_process-Description ) TO lt_created_processx.
    ENDLOOP.

    LOOP AT create-datasources INTO DATA(ls_create_source).
      APPEND VALUE #( main_module = ls_create_source-MainModule
                      business_process = ls_create_process-BusinessProcess
                      data_source = ls_create_source-DataSource
                      created_by_field        = ls_create_source-CreatedByField
                      create_date_field       = ls_create_source-CreateDateField
                      additional_filter       = ls_create_source-AdditionalFilter
                      group_by_fields         = ls_create_source-GroupByFields
                      data_collection_class   = ls_create_source-DataCollectionClass
                      data_collection_method  = ls_create_source-DataCollectionMethod
                      lower_limit             = ls_create_source-LowerLimit
                      upper_limit             = ls_create_source-upperLimit ) TO lt_created_source.
      APPEND VALUE #( language = sy-langu
                      main_module = ls_create_source-MainModule
                      business_process = ls_create_process-BusinessProcess
                      data_source = ls_create_source-DataSource
                      description = ls_create_source-Description ) TO lt_created_sourcex.
    ENDLOOP.

    IF lt_created_module IS NOT INITIAL.
      INSERT ykpi_t_module FROM TABLE @lt_created_module.
    ENDIF.
    IF lt_created_modulex IS NOT INITIAL.
      INSERT ykpi_t_modulex FROM TABLE @lt_created_modulex.
    ENDIF.
    IF lt_created_process IS NOT INITIAL.
      INSERT ykpi_t_process FROM TABLE @lt_created_process.
    ENDIF.
    IF lt_created_processx IS NOT INITIAL.
      INSERT ykpi_t_processx FROM TABLE @lt_created_processx.
    ENDIF.
    IF lt_created_source IS NOT INITIAL.
      INSERT ykpi_t_source FROM TABLE @lt_created_source.
    ENDIF.
    IF lt_created_sourcex IS NOT INITIAL.
      INSERT ykpi_t_sourcex FROM TABLE @lt_created_sourcex.
    ENDIF.

    IF lt_updated_modulex IS NOT INITIAL.
      UPDATE ykpi_t_modulex FROM TABLE @lt_updated_modulex.
    ENDIF.
    IF lt_updated_processx IS NOT INITIAL.
      UPDATE ykpi_t_processx FROM TABLE @lt_updated_processx.
    ENDIF.
    IF lt_updated_source IS NOT INITIAL.
      UPDATE ykpi_t_source FROM TABLE @lt_updated_source.
    ENDIF.
    IF lt_updated_sourcex IS NOT INITIAL.
      UPDATE ykpi_t_sourcex FROM TABLE @lt_updated_sourcex.
    ENDIF.

    IF lt_deleted_module IS NOT INITIAL.
      DELETE ykpi_t_module FROM TABLE @lt_deleted_module.
    ENDIF.
    IF lt_deleted_modulex IS NOT INITIAL.
      DELETE ykpi_t_modulex FROM TABLE @lt_deleted_modulex.
    ENDIF.
    IF lt_deleted_process IS NOT INITIAL.
      DELETE ykpi_t_process FROM TABLE @lt_deleted_process.
    ENDIF.
    IF lt_deleted_processx IS NOT INITIAL.
      DELETE ykpi_t_processx FROM TABLE @lt_deleted_processx.
    ENDIF.
    IF lt_deleted_source IS NOT INITIAL.
      DELETE ykpi_t_source FROM TABLE @lt_deleted_source.
    ENDIF.
    IF lt_deleted_sourcex IS NOT INITIAL.
      DELETE ykpi_t_sourcex FROM TABLE @lt_deleted_sourcex.
    ENDIF.

  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.