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

Calibre Enviroment variables:
	```
	export c5_calibre_path=$DRC_SCRIPTS_PATH
	```

	Where DRC_SCRIPTS_PATH contains the path of DRC and LVS rules.

## DRC scripts modification

Some version of Calibre require changes in the original DRC/LVS Script.

* Comment lines 48 to 50 of "drc.rf" file:

```
	//LAYOUT SYSTEM GDSII
	//LAYOUT PATH "CELLNAME.gds"
	//LAYOUT PRIMARY "CELLNAME"
```

* Comment lines 56 to 58 of "drc.rf" file:

```
	//DRC RESULTS DATABASE "drc_results.gds" GDSII
	//DRC RESULTS DATABASE "drc_results.db" ASCII
	//DRC SUMMARY REPORT drc_summary HIER
```

* Comment lines 181 to 195 of "Calibre_DRC_amis500cxakxx.rf" file:

```
	//#IFDEF $CALIBRE_METAL 
	//  SVRF ERROR "ERROR! \$CALIBRE_METAL is obsolete and has been replaced by the process option environment variables. Please unset \$CALIBRE_METAL."
	//#ENDIF
	//#IFDEF $c52lm 
	//  #IFDEF $c53lm 
	//    SVRF ERROR "ERROR! Multiple Process Option Tool top metal levels defined ($c52lm and $c53lm)!"
	//  #ENDIF
	//  #DEFINE TOPMETAL2 
	//#ELSE
	//  #IFDEF $c53lm 
	//    #DEFINE TOPMETAL3 
	//  #ELSE
	//    SVRF ERROR "ERROR! Process option top metal environment variable not defined."
	//  #ENDIF
	//#ENDIF
```

	And add the following line:
	
```
	// Define 3 metal option
	#DEFINE TOPMETAL3
```

## LVS scripts modification

Some version of Calibre require changes in the original DRC/LVS Script.

* Comment lines 37 to 43 of "lvs.rf" file:

```
	//LAYOUT SYSTEM GDSII
	//LAYOUT PATH "CELLNAME.gds"
	//LAYOUT PRIMARY "CELLNAME"

	//SOURCE SYSTEM SPICE
	//SOURCE PATH "netlist"
	//SOURCE PRIMARY "CELLNAME"
```

* Comment lines 254 and 260 of "lvs.rf" file:

```
	//  MASK SVDB DIRECTORY "svdb" QUERY

	//LVS REPORT "lvs_summary"
```

* Comment lines 177 to 191 of "Calibre_EXT_amis500cxakxx.rf" file:

```
	//#IFDEF $CALIBRE_METAL 
	//  SVRF ERROR "ERROR! \$CALIBRE_METAL is obsolete and has been replaced by the process option environment variables. Please unset \$CALIBRE_METAL."
	//#ENDIF
	//#IFDEF $c52lm 
	//  #IFDEF $c53lm 
	//    SVRF ERROR "ERROR! Multiple Process Option Tool top metal levels defined ($c52lm and $c53lm)!"
	//  #ENDIF
	//  #DEFINE TOPMETAL2 
	//#ELSE
	//  #IFDEF $c53lm 
	//    #DEFINE TOPMETAL3 
	//  #ELSE
	//    SVRF ERROR "ERROR! Process option top metal environment variable not defined."
	//  #ENDIF
	//#ENDIF
```

	And add the following line:
	
```
	// Define 3 metal option
	#DEFINE TOPMETAL3
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


## Santana Tech file changes

* In **layerMaterials** section, add **POLY2  poly**:

```
	layerMaterials(
;( layer  material )
;( -----  -------- )
 ( CNT    cut      )
 ( DIF    nDiff    )
 ( M1     metal    )
 ( M2     metal    )
 ( M3     metal    )
 ( POLY1  poly     )
 ( POLY2  poly     )
 ( TUB    nWell    )
 ( VIA    cut      )
 ( VIA2   cut      )
);layerMaterials
```

* In **connectivity**, add **connectBy(M1 POLY2 CNT)**:

```
connectivity(
; connectivity-statement(layer-parameters)
; ----------------------------------------
  connectBy(M1 M2 VIA)
  connectBy(M1 POLY1 CNT)
  connectBy(M1 POLY2 CNT)
  connectBy(M2 M3 VIA2)
  logicalConnect(M1 M1)
  logicalConnect(M2 M2)
  logicalConnect(POLY1 POLY1)
  logicalConnect(M3 M3)
);connectivity

```

* In **viaLayers**, add **( POLY2         CNT        M1        )**:

```
viaLayers(
;( bottom-layer  via-layer  top-layer )
;( ------------  ---------  --------- )
 ( DIF           CNT        M1        )
 ( M1            VIA        M2        )
 ( M2            VIA2       M3        )
 ( POLY1         CNT        M1        )
 ( POLY2         CNT        M1        )
);viaLayers
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



