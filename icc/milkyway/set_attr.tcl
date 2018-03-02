# ***********************************************
# UNSAM - Universidad Nacional San Martin - 2017
# ***********************************************
#   Escuela de Ciencia y Tecnologia 
#   PDK ONC5 para materias de diseno de ICs
#      
#       :ssssssssssoo+/-`   `-/+osssssssssss:       
#       oMMMMMMMMMMMMMMMMmymMMMMMMMMMMMMMMMMo       
#       oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo       
#       oMMMMMd++++oosyhmMMMmhysoo++++dMMMMMo       
#       oMMMMMy          .+.          sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMmyyyysso+:.   .:+ossyyyymMMMMMo       
#       oMMMMMMMMMMMMMMMMmymMMMMMMMMMMMMMMMMo       
#       oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo       
#       -//////////++oshmMMMmhsoo+//////////-       
#                        `/`                                                                
# ***********************************************

set cells {LGCPX2 LGCPX3 LGCPX1 ON32X1 OA211X1 NO2X1 DFFX1 NO3X1 HAX1 DLHLX1 BUX1 DFRRSX1 BUX2 BUX3 BUX4 BUX8 BUX6 DLY1LX1 DLY1p6LX1 DLY2LX1 DLY4LX1 DLY8LX1 FAX1 AO22X1 NA2I1X1 NA4X1 SDFRX1 MU2IX1 MU2X1 NA2X1 NA3X1 NA3I1X1 EO2X1 LOGIC1 LOGIC0 ANTENNAP25 ANTENNAN4 ANTENNAN10 ANTENNAP5 ANTENNAN25 ANTENNAN5 ANTENNAP4 ANTENNAP10 DLHRQLX1 DLHQLX1 DLHRLX1 OR2X1 MU4IX1 NO5X1 AND4X1 AND5X1 NA3I2X1 AND2X1 AND3X1 AN21X1 AO222X1 AO31X1 AO32X1 AO21X1 DFRQX1 DFRRX1 DFRX1 INX1 AND6X1 NA6X1 NO4X1 NA5X1 OR3X1 NO6X1 MU4X1}
set feed_cells {FEED1 FEED5 FEEDCAP2L FEED2 FEED3 FEED10}


foreach x $cells {
	#Marco el tipo de celda
	cmMarkCellType
	setFormField mark_cell_type library_name icc_onc5
	setFormField mark_cell_type cell_name $cells
	setFormField mark_cell_type cell_type "std cell"
	formOK mark_cell_type

	# Abro la celda y seteo atributos
	open_mw_cel $cells
	set_attribute [get_ports -all D_VDD] port_type "Power"
	set_attribute [get_ports -all D_GND] port_type "Ground"

	set_attribute [get_ports -all A] port_type "Input"
	set_attribute [get_ports -all B] port_type "Input"
	set_attribute [get_ports -all C] port_type "Input"
	set_attribute [get_ports -all D] port_type "Input"
	set_attribute [get_ports -all E] port_type "Input"
	set_attribute [get_ports -all F] port_type "Input"
	set_attribute [get_ports -all G] port_type "Input"
	set_attribute [get_ports -all R] port_type "Input"
	set_attribute [get_ports -all S] port_type "Input"
	set_attribute [get_ports -all CI] port_type "Input"
	set_attribute [get_ports -all CO] port_type "Input"
	set_attribute [get_ports -all CLK] port_type "Input"
	set_attribute [get_ports -all ICLK] port_type "Input"
	set_attribute [get_ports -all IN] port_type "Input"
	set_attribute [get_ports -all SN] port_type "Input"
	set_attribute [get_ports -all RN] port_type "Input"
	set_attribute [get_ports -all IN0] port_type "Input"
	set_attribute [get_ports -all IN1] port_type "Input"
	set_attribute [get_ports -all IN2] port_type "Input"
	set_attribute [get_ports -all IN3] port_type "Input"
	set_attribute [get_ports -all S0] port_type "Input"
	set_attribute [get_ports -all S1] port_type "Input"

	set_attribute [get_ports -all OUT] port_type "Output"
	set_attribute [get_ports -all Z] port_type "Output"
	set_attribute [get_ports -all Q] port_type "Output"
	set_attribute [get_ports -all QN] port_type "Output"
	set_attribute [get_ports -all NQ] port_type "Output"
	set_attribute [get_ports -all GCLK] port_type "Output"
	save_mw_cel
	close_mw_cel

	# Extraigo la FRAM 
	auExtractBlockagePinVia
	setFormField extract_blockage library_name icc_onc5
	setFormField extract_blockage cell_name $cells
	setFormField extract_blockage preserve_all_metal_blockage 1
	setFormField extract_blockage merge_blockage 0
	setFormField extract_blockage treat_all_blockage_as_thin_wire 1
	setFormField extract_blockage merge_blockage 0
	formButton extract_blockage extractPin
	setFormField extract_blockage extract_connectivity 1
	setFormField extract_blockage merge_blockage 0
	formButton extract_blockage extractVia
	setFormField extract_blockage extract_via_region_for_pg 1
	formOK extract_blockage
}

foreach y $feed_cells {
	#Marco el tipo de celda
	cmMarkCellType
	setFormField mark_cell_type library_name icc_onc5
	setFormField mark_cell_type cell_name $cells
	setFormField mark_cell_type cell_type "std filler"
	formOK mark_cell_type

	# Abro la celda y seteo atributos
	open_mw_cel $cells
	set_attribute [get_ports -all D_VDD] port_type "Power"
	set_attribute [get_ports -all D_GND] port_type "Ground"
	save_mw_cel
	close_mw_cel

	# Extraigo la FRAM 
	auExtractBlockagePinVia
	setFormField extract_blockage library_name icc_onc5
	setFormField extract_blockage cell_name $cells
	setFormField extract_blockage preserve_all_metal_blockage 1
	setFormField extract_blockage merge_blockage 0
	setFormField extract_blockage treat_all_blockage_as_thin_wire 1
	setFormField extract_blockage merge_blockage 0
	formButton extract_blockage extractPin
	setFormField extract_blockage extract_connectivity 1
	setFormField extract_blockage merge_blockage 0
	formButton extract_blockage extractVia
	setFormField extract_blockage extract_via_region_for_pg 1
	formOK extract_blockage
}
