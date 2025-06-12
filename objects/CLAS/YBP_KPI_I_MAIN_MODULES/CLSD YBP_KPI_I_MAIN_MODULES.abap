class-pool .
*"* class pool for class YBP_KPI_I_MAIN_MODULES

*"* local type definitions
include YBP_KPI_I_MAIN_MODULES========ccdef.

*"* class YBP_KPI_I_MAIN_MODULES definition
*"* public declarations
  include YBP_KPI_I_MAIN_MODULES========cu.
*"* protected declarations
  include YBP_KPI_I_MAIN_MODULES========co.
*"* private declarations
  include YBP_KPI_I_MAIN_MODULES========ci.
endclass. "YBP_KPI_I_MAIN_MODULES definition

*"* macro definitions
include YBP_KPI_I_MAIN_MODULES========ccmac.
*"* local class implementation
include YBP_KPI_I_MAIN_MODULES========ccimp.

*"* test class
include YBP_KPI_I_MAIN_MODULES========ccau.

class YBP_KPI_I_MAIN_MODULES implementation.
*"* method's implementations
  include methods.
endclass. "YBP_KPI_I_MAIN_MODULES implementation
