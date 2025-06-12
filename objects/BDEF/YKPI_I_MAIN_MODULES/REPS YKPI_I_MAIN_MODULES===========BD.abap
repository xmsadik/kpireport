managed implementation in class ybp_kpi_i_main_modules unique;
strict ( 1 );

define behavior for ykpi_i_main_modules alias MainModules
with unmanaged save
lock master
authorization master ( instance )
{
  create;
  update;
  delete;
  field ( readonly : update ) MainModule;
  association _businessProcesses { create; }

  static action generate_data;
}

define behavior for ykpi_i_business_processes alias BusinessProcesses
with unmanaged save
lock dependent by _mainModules
authorization dependent by _mainModules
{
  update;
  delete;
  field ( readonly : update ) MainModule, BusinessProcess;
  association _mainModules;
  association _dataSources { create; }
}

define behavior for ykpi_i_data_sources alias DataSources
with unmanaged save
lock dependent by _mainModule
authorization dependent by _mainModule
{
  update;
  delete;
  field ( readonly : update ) MainModule, BusinessProcess, DataSource;
  association _businessProcesses;
  association _mainModule;
}