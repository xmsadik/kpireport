CLASS ycl_kpi_report_collection DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES BEGIN OF mty_document_data.
    TYPES UserID TYPE abp_creation_user.
    TYPES CreationDate TYPE abp_creation_date.
    TYPES  DocumentCount TYPE ykpi_e_document_count.
    TYPES END OF mty_document_data.
    TYPES mty_document_data_list TYPE STANDARD TABLE OF mty_document_data WITH DEFAULT KEY.

    INTERFACES if_rap_query_provider .