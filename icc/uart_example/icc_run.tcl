# ***********************************************
# UNSAM - Universidad Nacional San Martin - 2017
# ***********************************************
#   Escuela de Ciencia y Tecnologia 
#   PDK ONC5 para materias de diseno de ICs
#      
#       :ssssssssssoo+/-`   `-/+osssssssssss:       
#       oMMMMMMMMMMMMMMMMmymMMMMMMMMMMMMMMMMo       
#       oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo       
#       oMMMMMd++++oosyhmMMMmhysoo++++dMMMMMo       
#       oMMMMMy          .+.          sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMmyyyysso+:.   .:+ossyyyymMMMMMo       
#       oMMMMMMMMMMMMMMMMmymMMMMMMMMMMMMMMMMo       
#       oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo       
#       -//////////++oshmMMMmhsoo+//////////-       
#                        `/`                                                                
# ***********************************************

# YOU SHOULD REPLACE HERE WITH THE PDK FILES!!!!
set techFile  '../../libs/INSERTHERE.tf'
set max_tluplus '../../libs/INSERTHERE.tluplus'
set min_tluplus '../../libs/INSERTHERE.tluplus'
set tech2itf_map '../../libs/INSERTHERE.map'

extend_mw_layers
create_mw_lib  -technology $techFile -mw_reference_library {../icc_onc5 ../io_pads} -bus_naming_style {[%d]}  -open  CHIP
import_designs -format verilog -top uart_pads -cel CHIP {../../dc/uart_gatelevel.v uart_pads.v}


set_tlu_plus_files -max_tluplus $ -min_tluplus $min_tlplus -tech2itf_map  $tech2itf_map
read_sdc  -version Latest "../../dc/src/uart_constraints.tcl"

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "design_setup"


# FloorPlanning
create_cell {cornerLL cornerLR cornerUL cornerUR} CORNER
create_cell {core_vdd1 core_vdd2 core_vdd3 core_vdd4} PADVDD
create_cell {core_vss1 core_vss2 core_vss3} PADVSS
# create_cell {ipad_RECEIVED ipad_IS_REC ipad_IS_TX ipad_RECV_ERROR} PADIO
# create_cell {ipad_RX0 ipad_RX1 ipad_RX2 ipad_RX3 ipad_RX4 ipad_RX5 ipad_RX6 ipad_RX7} PADIO
# create_cell {ipad_TX0 ipad_TX1 ipad_TX2 ipad_TX3 ipad_TX4 ipad_TX5 ipad_TX6 ipad_TX7} PADIO
# create_cell {ipad_CLK ipad_RST ipad_RX ipad_TRANSMIT ipad_TX} PADIO


read_pin_pad_physical_constraints ./pads.tdf

create_floorplan -core_utilization 0.619192 -core_aspect_ratio 0.977961 -left_io2core 80 -bottom_io2core 80 -right_io2core 80 -top_io2core 80
insert_pad_filler -cell {FILLER1 FILLER0_1} -overlap_cell {FILLER1 FILLER0_1}

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "die_init"

# Power
derive_pg_connection -power_net {D_VDD} -ground_net {D_GND} -power_pin {D_VDD} -ground_pin {D_GND}
create_rectangular_rings  -nets  {D_GND D_VDD}  -left_offset 1 -left_segment_width 1 -right_offset 1 -right_segment_width 2 -bottom_offset 1 -bottom_segment_width 2 -top_offset 1 -top_segment_width 2

preroute_standard_cells -nets  {D_VDD D_GND}  -route_pins_on_layer MET1  -start_share_via_stack MET1  -extend_for_multiple_connections  -extension_gap 10 -connect horizontal  -pin_width_by_most_extended_pin  -extend_to_boundaries_and_generate_pins  -fill_empty_rows  -port_filter_mode off -cell_master_filter_mode off -cell_instance_filter_mode off -voltage_area_filter_mode off -route_type {P/G Std. Cell Pin Conn}

# Placement
create_fp_placement
place_opt  -effort high -power

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "design_planning"


set cts_enable_clock_at_hierarchical_pin true
set power_cg_auto_identify true

check_clock_tree

report_clock
report_clock -skew
report_clock_tree -summary
report_constraint -all

set_fix_hold [all_clocks]

check_physical_design -stage pre_clock_opt
clock_opt -fix_hold_all_clocks -no_clock_route  

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "cts"


#Route
report_timing
derive_pg_connection -power_net {D_VDD} -ground_net {D_GND} -power_pin {D_VDD} -ground_pin {D_GND}

#===============================================================================================
# Antenna Stuff
#==========================================
set_parameter -name doAntennaConx -value 4
set lib [current_mw_lib]
remove_antenna_rules $lib

# metal rules
define_antenna_rule $lib -mode 4 -diode_mode 4 -metal_ratio 400 -cut_ratio 0
define_antenna_layer_rule $lib -mode 4 -layer "MET1"  -ratio 400 -diode_ratio {0 0 0 1e+07}
define_antenna_layer_rule $lib -mode 4 -layer "MET2"  -ratio 400 -diode_ratio {0 0 0 1e+07}
define_antenna_layer_rule $lib -mode 4 -layer "MET3"  -ratio 400 -diode_ratio {0 0 0 1e+07}

set_route_zrt_common_options  -post_detail_route_redundant_via_insertion high -concurrent_redundant_via_mode insert_at_high_cost -concurrent_redundant_via_effort_level high
route_zrt_group -all_clock_nets
route_zrt_auto  

set_route_zrt_detail_options  -diode_libcell_names ANTENNA -insert_diodes_during_routing true
verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true
derive_pg_connection -power_net {D_VDD} -ground_net {D_GND} -power_pin {D_VDD} -ground_pin {D_GND}

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "route"
#===============================================================================================
# Fillers
insert_stdcell_filler -cell_without_metal "FEED5 FEED3 FEED2 FEED1"

# StreamOut
#set_write_stream_options -map_layer ../libs/c5.layermap -child_depth 20 -flatten_via
write_stream -format gds -lib_name CHIP -cells {CHIP } CHIP.gds

write_verilog uart-post-pr.v

