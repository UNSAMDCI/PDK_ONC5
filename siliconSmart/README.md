# UNSAM Educational PDK ONC5 - S.Smart ![unsam_logo](../doc/img/logo_unsam.jpg "UNSAM logo")


## Description: Silicon Smart 

## Structure

	siliconSmart : configure.tcl
		SiliconSmart configuration file
	siliconSmart: gends_config.tcl
		Datasheet configuration file
	siliconSmart / scripts :
		Create .db files from .lib


## Example

* To characterize the libraries, run one of the following scripts, it depends if you want to characterize SPICE or PEX netlists:

	siliconsmart run.tcl
	
	siliconsmart run_pex.tcl
