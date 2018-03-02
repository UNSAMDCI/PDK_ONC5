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

###########################################################################
#####							AN21X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AN21X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AN21X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AN21X1
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

###########################################################################
#####							AND2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AND2X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AND2X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AND2X1
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

###########################################################################
#####							AND3X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AND3X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AND3X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AND3X1
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

###########################################################################
#####							AND4X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AND4X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AND4X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AND4X1
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

###########################################################################
#####							AND5X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AND5X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AND5X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AND5X1
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

###########################################################################
#####							AND6X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AND6X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AND6X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all F] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AND6X1
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

###########################################################################
#####							ANTENNAN4								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAN4
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAN4
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAN4
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

###########################################################################
#####							ANTENNAN5								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAN5
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAN5
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAN5
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

###########################################################################
#####							ANTENNAN10								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAN10
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAN10
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAN10
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

###########################################################################
#####							ANTENNAN25								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAN25
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAN25
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAN25
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

###########################################################################
#####							ANTENNAP4								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAP4
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAP4
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAP4
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

###########################################################################
#####							ANTENNAP5								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAP5
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAP5
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAP5
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

###########################################################################
#####							ANTENNAP10								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAP10
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAP10
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAP10
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

###########################################################################
#####							ANTENNAP25								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ANTENNAP25
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ANTENNAP25
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ANTENNAP25
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

###########################################################################
#####							AO21X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AO21X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AO21X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AO21X1
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

###########################################################################
#####							AO22X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AO22X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AO22X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AO22X1
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

###########################################################################
#####							AO31X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AO31X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AO31X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AO31X1
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

###########################################################################
#####							AO32X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AO32X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AO32X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AO32X1
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

###########################################################################
#####							AO222X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name AO222X1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel AO222X1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all F] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name AO222X1
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

###########################################################################
#####							BUX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUX1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUX1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUX1
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

###########################################################################
#####							BUX2								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUX2
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUX2
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUX2
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

###########################################################################
#####							BUX3								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUX3
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUX3
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUX3
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

###########################################################################
#####							BUX4								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUX4
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUX4
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUX4
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

###########################################################################
#####							BUX6								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUX6
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUX6
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUX6
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

###########################################################################
#####							BUX8								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUX8
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUX8
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUX8
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

###########################################################################
#####							BUF1X4								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUF1X4
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUF1X4
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUF1X4
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

###########################################################################
#####							BUF2X8								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name BUF2X8
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel BUF2X8
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name BUF2X8
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


###########################################################################
#####							DFFX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DFFX1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DFFX1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all ICLK] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DFFX1
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

###########################################################################
#####							DFRQX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DFRQX1
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DFRQX1
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all ICLK] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DFRQX1
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

###########################################################################
#####							DFRRSX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DFRRSX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DFRRSX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all SN] port_type "Input"
set_attribute [get_ports -all RN] port_type "Input"
set_attribute [get_ports -all ICLK] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DFRRSX1	
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

###########################################################################
#####							DFRRX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DFRRX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DFRRX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all RN] port_type "Input"
set_attribute [get_ports -all ICLK] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DFRRX1	
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

###########################################################################
#####							DFRX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DFRX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DFRX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all ICLK] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DFRX1	
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

###########################################################################
#####							DLHLX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLHLX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLHLX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all G] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLHLX1	
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

###########################################################################
#####							DLHQLX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLHQLX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLHQLX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all G] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLHQLX1	
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

###########################################################################
#####							DLHRLX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLHRLX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLHRLX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all G] port_type "Input"
set_attribute [get_ports -all R] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLHRLX1	
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

###########################################################################
#####							DLHRQLX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLHRQLX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLHRQLX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all G] port_type "Input"
set_attribute [get_ports -all R] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLHRQLX1	
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

###########################################################################
#####							DLY1LX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLY1LX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLY1LX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLY1LX1	
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

###########################################################################
#####							DLY1p6LX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLY1p6LX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLY1p6LX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLY1p6LX1	
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

###########################################################################
#####							DLY2LX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLY2LX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLY2LX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLY2LX1	
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

###########################################################################
#####							DLY4LX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLY4LX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLY4LX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLY4LX1	
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

###########################################################################
#####							DLY8LX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name DLY8LX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel DLY8LX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name DLY8LX1	
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

###########################################################################
#####							EO2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name EO2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel EO2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all Z] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name EO2X1	
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

###########################################################################
#####							FAX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FAX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FAX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all CI] port_type "Input"
set_attribute [get_ports -all S] port_type "Output"
set_attribute [get_ports -all CO] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FAX1	
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

###########################################################################
#####							FEED1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FEED1	
setFormField mark_cell_type cell_type "std filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FEED1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FEED1	
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

###########################################################################
#####							FEED2								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FEED2	
setFormField mark_cell_type cell_type "std filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FEED2	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FEED2	
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

###########################################################################
#####							FEED3								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FEED3	
setFormField mark_cell_type cell_type "std filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FEED3	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FEED3	
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

###########################################################################
#####							FEED5								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FEED5	
setFormField mark_cell_type cell_type "std filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FEED5	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FEED5	
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

###########################################################################
#####							FEED10								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FEED10	
setFormField mark_cell_type cell_type "std filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FEED10	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FEED10	
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

###########################################################################
#####							FEEDCAP2L								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name FEEDCAP2L
setFormField mark_cell_type cell_type "std filler"
formOK mark_cell_type


# Abro la FEEDCAP2L
open_mw_cel FEEDCAP2L
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name FEEDCAP2L
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

###########################################################################
#####							HAX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name HAX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel HAX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all S] port_type "Output"
set_attribute [get_ports -all CO] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name HAX1	
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

###########################################################################
#####							INX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX1	
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

###########################################################################
#####							INX2								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX2	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX2	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX2	
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

###########################################################################
#####							INX4								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX4	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX4	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX4	
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

###########################################################################
#####							INX6								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX6	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX6	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX6	
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

###########################################################################
#####							INX8								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX8	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX8	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX8	
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

###########################################################################
#####							INX16								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX16	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX16	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX16	
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

###########################################################################
#####							INX32								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name INX32	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel INX32	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name INX32	
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

###########################################################################
#####							LGCPX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LGCPX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LGCPX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LGCPX1	
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

###########################################################################
#####							LGCPX2								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LGCPX2	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LGCPX2	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LGCPX2	
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

###########################################################################
#####							LGCPX3								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LGCPX3	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LGCPX3	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LGCPX3	
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

###########################################################################
#####							LOGIC0								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LOGIC0	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LOGIC0	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LOGIC0	
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

###########################################################################
#####							LOGIC1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LOGIC1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LOGIC1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LOGIC1	
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

###########################################################################
#####							LSGCPX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LSGCPX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LSGCPX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LSGCPX1	
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

###########################################################################
#####							LSGCPX2								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LSGCPX2	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LSGCPX2	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LSGCPX2	
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

###########################################################################
#####							LSGCPX3								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LSGCPX3	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LSGCPX3	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LSGCPX3	
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

###########################################################################
#####							LSOGCPX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LSOGCPX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LSOGCPX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
set_attribute [get_ports -all CGOBS] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LSOGCPX1	
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

###########################################################################
#####							LSOGCPX2								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LSOGCPX2	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LSOGCPX2	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
set_attribute [get_ports -all CGOBS] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LSOGCPX2	
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

###########################################################################
#####							LSOGCPX3								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name LSOGCPX3	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel LSOGCPX3	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all CLK] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all GCLK] port_type "Output"
set_attribute [get_ports -all CGOBS] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name LSOGCPX3	
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

###########################################################################
#####							MU2IX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name MU2IX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel MU2IX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN0] port_type "Input"
set_attribute [get_ports -all IN1] port_type "Input"
set_attribute [get_ports -all S] port_type "Input"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name MU2IX1	
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

###########################################################################
#####							MU2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name MU2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel MU2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN0] port_type "Input"
set_attribute [get_ports -all IN1] port_type "Input"
set_attribute [get_ports -all S] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name MU2X1	
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

###########################################################################
#####							MU4IX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name MU4IX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel MU4IX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN0] port_type "Input"
set_attribute [get_ports -all IN1] port_type "Input"
set_attribute [get_ports -all IN2] port_type "Input"
set_attribute [get_ports -all IN3] port_type "Input"
set_attribute [get_ports -all S0] port_type "Input"
set_attribute [get_ports -all S1] port_type "Input"
set_attribute [get_ports -all NQ] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name MU4IX1	
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

###########################################################################
#####							MU4X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name MU4X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel MU4X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all IN0] port_type "Input"
set_attribute [get_ports -all IN1] port_type "Input"
set_attribute [get_ports -all IN2] port_type "Input"
set_attribute [get_ports -all IN3] port_type "Input"
set_attribute [get_ports -all S0] port_type "Input"
set_attribute [get_ports -all S1] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name MU4X1	
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

###########################################################################
#####							NA2I1X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA2I1X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA2I1X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA2I1X1	
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

###########################################################################
#####							NA2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA2X1	
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

###########################################################################
#####							NA3I1X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA3I1X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA3I1X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all NA] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA3I1X1	
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

###########################################################################
#####							NA3I2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA3I2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA3I2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA3I2X1	
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

###########################################################################
#####							NA3X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA3X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA3X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA3X1	
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

###########################################################################
#####							NA4X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA4X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA4X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA4X1	
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

###########################################################################
#####							NA4I1X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA4I1X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA4I1X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA4I1X1	
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

###########################################################################
#####							NA4I2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA4I2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA4I2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA4I2X1	
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

###########################################################################
#####							NA4I3X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA4I3X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA4I3X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA4I3X1	
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

###########################################################################
#####							NA5X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA5X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA5X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA5X1	
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

###########################################################################
#####							NA5I1X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA5I1X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA5I1X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA5I1X1	
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

###########################################################################
#####							NA6X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NA6X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NA6X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all F] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NA6X1	
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

###########################################################################
#####							NO2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NO2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NO2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NO2X1	
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

###########################################################################
#####							NO3X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NO3X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NO3X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NO3X1	
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

###########################################################################
#####							NO4X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NO4X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NO4X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NO4X1	
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

###########################################################################
#####							NO5X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NO5X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NO5X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NO5X1	
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

###########################################################################
#####							NO6X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name NO6X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel NO6X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all F] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name NO6X1	
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

###########################################################################
#####							OA211X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name OA211X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel OA211X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name OA211X1	
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

###########################################################################
#####							ON32X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name ON32X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel ON32X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all E] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name ON32X1	
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

###########################################################################
#####							OR2X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name OR2X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel OR2X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name OR2X1	
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

###########################################################################
#####							OR3X1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name OR3X1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel OR3X1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all A] port_type "Input"
set_attribute [get_ports -all B] port_type "Input"
set_attribute [get_ports -all C] port_type "Input"
set_attribute [get_ports -all OUT] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name OR3X1	
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

###########################################################################
#####							SDFRX1								#######
###########################################################################

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name icc_onc5
setFormField mark_cell_type cell_name SDFRX1	
setFormField mark_cell_type cell_type "std cell"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel SDFRX1	
set_attribute [get_ports -all D_VDD] port_type "Power"
set_attribute [get_ports -all D_GND] port_type "Ground"
set_attribute [get_ports -all D] port_type "Input"
set_attribute [get_ports -all SD] port_type "Input"
set_attribute [get_ports -all SE] port_type "Input"
set_attribute [get_ports -all ICLK] port_type "Input"
set_attribute [get_ports -all Q] port_type "Output"
set_attribute [get_ports -all QN] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name icc_onc5
setFormField extract_blockage cell_name SDFRX1	
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