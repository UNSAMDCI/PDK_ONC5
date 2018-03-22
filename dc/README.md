# UNSAM Educational PDK ONC5 - DC ![unsam_logo](../doc/img/logo_unsam.jpg "UNSAM logo")


## Description: DC Shell 

## Structure

	dc : DC Compiler
		the simple.tcl script synthesizes an uart with clock gating, which is then used in ICC
	dc / testcase_dft : 
		another script that uses DFT on an adder to test the scan flip flops

## TLUPlus : File generation

* If the Foundry provides an .nxtgrd file (in the PDK),  it already contains the necessary things to assemple the .itf file. If we look at the beginning of the .nxtgrd file, it is written similarly to an .itf file and contains all the information we need.

* In order to get the .itf file we run the following script:

```
	# Find only lines that begin with a comment character
	# Delete everything from the pattern "end of itf file" to the end of the file
	# Delete everything from the pattern "TimeStamp" to the pattern "echoing ITF file"
	# From what is remaining, which is the .itf file commented out, remove the first comment character
 
	grep '^\$' some.nxtgrd | \
      	sed -e '/end of itf file/,/$$/d' \
            -e '/TimeStamp/,/echoing ITF file/d' \
            -e 's/^\$//'
```

* Then we have to generate the TLU File using .itf

```
	grdgenxo -itf2TLUPlus -i cb_mini_max.itf -o cb_mini_max.capTable
```

* Once generated the TLUPlus, put it in ** PDK_ONC5/libs** folder.


## Example

* To run a DC Compiler quick example:

	dc_shell -f simple.tcl 

* Then you can try DFT, use the example included in the folder "testcase_dft".

* All libraries are referenced by .synopsys_dc.setup