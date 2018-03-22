# UNSAM Educational PDK ONC5 - DC ![unsam_logo](../doc/img/logo_unsam.jpg "UNSAM logo")


## Description: DC Shell 

## Structure

	dc : DC Compiler
		the simple.tcl script synthesizes an uart with clock gating, which is then used in ICC
	dc / testcase_dft : 
		another script that uses DFT on an adder to test the scan flip flops

## Example

* To run a DC Compiler quick example:

	dc_shell -f simple.tcl 

* Then you can try DFT, use the example included in the folder "testcase_dft".

* All libraries are referenced by .synopsys_dc.setup