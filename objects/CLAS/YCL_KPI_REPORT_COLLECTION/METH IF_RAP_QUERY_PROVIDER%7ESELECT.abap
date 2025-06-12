  METHOD if_rap_query_provider~select.
    DATA: lt_output         TYPE STANDARD TABLE OF ykpi_i_kpi_report,
          lt_module         TYPE RANGE OF ykpi_e_module,
          lt_process        TYPE RANGE OF ykpi_e_process,
          lt_userid         TYPE RANGE OF sy-uname,
          lt_date           TYPE RANGE OF datum,
          lt_document_data  TYPE mty_document_data_list,
          lv_where_string   TYPE string,
          lv_groupby_string TYPE string,
          lv_field_list     TYPE string.
    TRY.
        DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lv_sql_filter) = io_request->get_filter( )->get_as_sql_string( ).
        DATA(lt_sort_elements) = io_request->get_sort_elements( ).
        DATA(lt_paging) = io_request->get_paging( ).
        LOOP AT lt_filter INTO DATA(ls_filter).
          CASE ls_filter-name.
            WHEN 'MAINMODULE'.
              lt_module = CORRESPONDING #( ls_filter-range ).
            WHEN 'BUSINESSPROCESS'.
              lt_process = CORRESPONDING #( ls_filter-range ).
            WHEN 'USERID'.
              lt_userid = CORRESPONDING #( ls_filter-range ).
            WHEN 'CREATIONDATE'.
              lt_date = CORRESPONDING #( ls_filter-range ).
          ENDCASE.
        ENDLOOP.

        SELECT MainModule,
               \_businessProcesses\_mainModules-Description AS MainModuleName,
               BusinessProcess,
               \_businessProcesses-Description AS BusinessProcessName,
               DataSource,
               Description AS DataSourceName,
               CreatedByField,
               CreateDateField,
               AdditionalFilter,
               GroupByFields,
               DataCollectionClass,
               DataCollectionMethod,
               LowerLimit,
               UpperLimit
           FROM ykpi_i_data_sources AS DataSources
           WHERE MainModule IN @lt_module
             AND BusinessProcess IN @lt_process
           INTO TABLE @DATA(lt_raw_data).
        CHECK sy-subrc = 0.

        SELECT UserID, PersonFullName AS username
          FROM I_BusinessUserBasic
          INTO TABLE @DATA(lt_user_data).
        SORT lt_user_data BY UserID.

        LOOP AT lt_raw_data INTO DATA(ls_raw_data).
          CLEAR: lt_document_data, lv_where_string, lv_field_list, lv_groupby_string.
          IF ls_raw_data-DataCollectionClass IS NOT INITIAL AND ls_raw_data-DataCollectionMethod IS NOT INITIAL.
            CALL METHOD (ls_raw_data-DataCollectionClass)=>(ls_raw_data-DataCollectionMethod)
              EXPORTING
                io_request       = io_request
                is_customizing   = CORRESPONDING ykpi_i_data_sources( ls_raw_data )
              CHANGING
                ct_document_data = lt_document_data.
          ELSEIF ls_raw_data-CreatedByField IS NOT INITIAL AND ls_raw_data-CreateDateField IS NOT INITIAL.
            IF lv_sql_filter IS NOT INITIAL.
              SPLIT lv_sql_filter AT 'AND' INTO TABLE DATA(lt_sql_filter).
              LOOP AT lt_sql_filter INTO DATA(lv_sql_element).
                CHECK lv_sql_element CS 'USERID' OR
                      lv_sql_element CS 'CREATIONDATE'.
                REPLACE ALL OCCURRENCES OF 'USERID' IN lv_sql_element WITH ls_raw_data-CreatedByField.
                REPLACE ALL OCCURRENCES OF 'CREATIONDATE' IN lv_sql_element WITH ls_raw_data-CreateDateField.
                IF lv_where_string IS INITIAL.
                  lv_where_string = lv_sql_element.
                ELSE.
                  CONCATENATE lv_where_string 'AND' lv_sql_element INTO lv_where_string SEPARATED BY space.
                ENDIF.
              ENDLOOP.
            ENDIF.
            lv_field_list = ls_raw_data-CreatedByField && ` AS USERID, ` &&
                            ls_raw_data-CreateDateField && ` AS CREATIONDATE, `.
            IF ls_raw_data-GroupByFields IS INITIAL.
              lv_field_list = lv_field_list && `COUNT( * ) AS DOCUMENTCOUNT`.
            ELSE.
              lv_field_list = lv_field_list && `COUNT( ` && ls_raw_data-GroupByFields && ` ) AS DOCUMENTCOUNT`.
            ENDIF.
            lv_groupby_string = ls_raw_data-CreatedByField && `, ` &&
                                ls_raw_data-CreateDateField.
            IF ls_raw_data-groupbyfields IS NOT INITIAL.
              lv_groupby_string = lv_groupby_string && `, ` && ls_raw_data-GroupByFields.
            ENDIF.
            IF ls_raw_data-AdditionalFilter IS NOT INITIAL.
              IF lv_where_string IS INITIAL.
                lv_where_string = ls_raw_data-AdditionalFilter.
              ELSE.
                lv_where_string = lv_where_string && ` AND ` && ls_raw_data-AdditionalFilter.
              ENDIF.
            ENDIF.
            SELECT (lv_field_list)
              FROM (ls_raw_data-DataSource)
              WHERE (lv_where_string)
              GROUP BY (lv_groupby_string)
              INTO TABLE @lt_document_data.
          ENDIF.
          CHECK lt_document_data IS NOT INITIAL.

          APPEND INITIAL LINE TO lt_output ASSIGNING FIELD-SYMBOL(<ls_output>).
          <ls_output> = CORRESPONDING #( ls_raw_data ).

          LOOP AT lt_document_data INTO DATA(ls_document_data).
            MOVE-CORRESPONDING ls_document_data TO <ls_output>.

            READ TABLE lt_user_data INTO DATA(ls_user_data) WITH KEY UserID = <ls_output>-UserID BINARY SEARCH.
            IF sy-subrc = 0.
              <ls_output>-UserName = ls_user_data-username.
            ENDIF.
            IF <ls_output>-DocumentCount < ls_raw_data-LowerLimit.
              <ls_output>-DocumentCriticality = 1.
            ELSEIF <ls_output>-DocumentCount BETWEEN ls_raw_data-LowerLimit AND ls_raw_data-UpperLimit.
              <ls_output>-DocumentCriticality = 2.
            ELSEIF <ls_output>-DocumentCount > ls_raw_data-UpperLimit.
              <ls_output>-DocumentCriticality = 3.
            ELSE.
              <ls_output>-DocumentCriticality = 0.
            ENDIF.
          ENDLOOP.

        ENDLOOP.

        IF io_request->is_total_numb_of_rec_requested(  ).
          io_response->set_total_number_of_records( iv_total_number_of_records = lines( lt_output ) ).
        ENDIF.
        io_response->set_data( it_data = lt_output ).
      CATCH cx_root INTO DATA(lx_root).
    ENDTRY.
  ENDMETHOD.