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



