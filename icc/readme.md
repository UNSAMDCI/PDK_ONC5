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

## Santana Tech generation

* We have to use the techfile (.tf) to generate SantanaTech and Santana Display File

* SantanaTech generation (c5.tf is the techfile in this case)

```
	cntechconv c5.tf -o Santana.tech
```

* Santana Display from SantanaTech

```
	cndispconv
     --cdstech = <cds-tech-file-name>
     --cdsdisplay = <cds-display-file-name>
     --santanatech = <santana-tech-file-name>
```

For this process:

```
cndispconv --cdstech=c5.tf –-cdsdisplay=display.drf
--santanatech=santana.tech
```

## OA Library generation

* We can update the library from the pdk using the following command:

```
cngenlib --update pkg:MyPyCells c5 <original_library_path>
```

MyPycells is the folder which contain the pycells
c5 is the library to generate. You must define the path in lib.defs

## Example

* To run a ICC Compiler quick example:

	icc_shell -gui

* Run the icc_run script using icc_shel:

	source icc_run.tcl > log.log


