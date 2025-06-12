projection;
strict ( 1 );

define behavior for ykpi_c_main_modules alias MainModules
{
  use create;
  use update;
  use delete;

  use association _businessProcesses { create; }
  use action generate_data;
}

define behavior for ykpi_c_business_processes alias BusinessProcesses
{
  use update;
  use delete;

  use association _mainModules;
  use association _dataSources { create; }
}

define behavior for ykpi_c_data_sources alias DataSources
{
  use update;
  use delete;

  use association _businessProcesses;
  use association _mainModule;
}