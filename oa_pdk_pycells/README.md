# UNSAM Educational PDK ONC5 - Analog PDK ![unsam_logo](../doc/img/logo_unsam.jpg "UNSAM logo")

## Requirements:
Environment variables that point to tools

```
		CDESIGNER_HOME
		HSPICE_HOME
		MILKYWAY_HOME
		SILICON_SMART_HOME
		STAR_RC_HOME
		CUSTOM_WAVE_HOME
		PYROS
		IC_COMPILER
		LC_COMPILER
		DC_COMPILER
		ICV_HOME_DIR
```
	Example bash config:

	```
		./scripts/bash/example_bash_config
	```


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

## Run:

	cd scripts/bash
	./run_cdesigner



