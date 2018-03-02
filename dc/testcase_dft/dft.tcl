read_verilog adder.v
create_clock -period 250 clk
current_design adder
compile
report_area > adder_area_noscan
report_timing > adder_timing_noscan
report_power > adder_power_noscan
set_scan_configuration -style multiplexed_flip_flop
compile -scan

#-style multiplexed_flip_flop | clocked_scan | lssd  |  combinational  |
#       scan_enabled_lssd | none


set_dft_signal -view existing_dft -type ScanClock -port clk -timing [list 60 40]
create_test_protocol
dft_drc
set_scan_configuration -chain_count 1
preview_dft
insert_dft
report_area > adder_area_scan
report_timing > adder_timing_scan
report_power > adder_power_scan
write -format verilog -hierarchy -output adder_dft.v