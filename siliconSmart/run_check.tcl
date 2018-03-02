set charpt testcase_pex
set_log_file $charpt/sis_validation.log
set_location $charpt

set nldm_tst_lib $charpt/models/liberty/nldm_op_cond_typ.lib
set ccs_tst_lib $charpt/models/liberty/ccs_op_cond_typ.lib
set ver_file $charpt/models/verilog/my_model.v


####################################
# Run Library Qualification
####################################

set_log_file $charpt/sis_qualification.log


# Control to keep intermediate files or not
set_config_opt qualification_cleanup 0

# LC Controls
set_config_opt qualification_lc_shell lc_shell
set_config_opt qualification_lc_suppress {LBDB-605 LBDB-712}

# Settings for data range check
# Types available are : delay, transition, constraint, energy, current, capacitance, dc_current, ccsn, pg_current
set_config_opt qualification_data_range {delay 0.1 0.2 transition 0.1 0.2}

# Settings for tolerances for consistency checks
# Types available are : delay, slew, delay_ccsn, slew_ccsn, delay_sensitivity, slew_sensitivity, voltage
# Order is : <type> <relative_tolerance> <absolute_tolerance>
set_config_opt qualification_tol {delay 0.1 0.2 slew 0.3 0.4}

# Following command will check for:
# 1. Lib Compilation
# 2. NLDM vs. CCST Delay/Slew Consistency
# 3. NLDM vs. CCSN Delay/Slew Consistency
# 4. Voltage Range
# 5. Cell Sensitivity
# 6. Data Range Checks

qualify_library -check {data_range sensitivity} [get_location]/models/liberty/ccs_op_cond_typ.lib


log_info "IAMDONE"
