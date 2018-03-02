# UNSAM Educational PDK ONC5 - ICC ![unsam_logo](../doc/img/logo_unsam.jpg "UNSAM logo")

Celdas Basicas ONC5
-------------------

## Description: ICC Cell Library 

## Structure

	icc : IC Compiler
	icc / uart_example :
		run in bash > icc_shell -gui 
		then in icc_shell: source icc_run.tcl > log.txt (Place & Route of the UART)
	icc / icc_onc5: 
		milkyway db
	icc / io_pads: 
		milkyway db (IO Pads)
	icc / gds : 
		std cells gds format

## Example

* To run a ICC Compiler quick example:

	icc_shell -gui

* Run the icc_run script using icc_shel:

	source icc_run.tcl > log.log


