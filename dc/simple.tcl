read_verilog src/uart.v

source src/uart_constraints.tcl 

compile_ultra -gate_clock

ungroup -all -flatten

write -format verilog -hierarchy -o uart_gatelevel.v
exit
