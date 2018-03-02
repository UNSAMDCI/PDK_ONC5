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


# Abro la celda
geOpenLib
setFormField open_library library_path ../
setFormField open_library library_name io_pads
formOK open_library

# Reemplazo la techfile
cmReplaceTech
setFormField replace_technology_file library_name ../../icc_onc5/io_pads
setFormField replace_technology_file technology_file_name ../../icc_onc5/libs
setFormField replace_technology_file technology_file_name ../../icc_onc5/libs/ami500hxgc_3m.tf
formOK replace_technology_file

# FRAM

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name io_pads
setFormField mark_cell_type cell_name PADIO
setFormField mark_cell_type cell_type "pad"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel PADIO
set_attribute [get_ports -all VDD] port_type "Power"
set_attribute [get_ports -all VSS] port_type "Ground"
set_attribute [get_ports -all IN1] port_type "Input"
set_attribute [get_ports -all IN2] port_type "Input"
set_attribute [get_ports -all ANA] port_type "Output"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name io_pads
setFormField extract_blockage cell_name PADIO
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

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name io_pads
setFormField mark_cell_type cell_name PADVDD
setFormField mark_cell_type cell_type "pad"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel PADVDD
set_attribute [get_ports -all VDD] port_type "Power"
set_attribute [get_ports -all VSS] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name io_pads
setFormField extract_blockage cell_name PADVDD
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

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name io_pads
setFormField mark_cell_type cell_name PADVSS
setFormField mark_cell_type cell_type "pad"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel PADVSS
set_attribute [get_ports -all VDD] port_type "Power"
set_attribute [get_ports -all VSS] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name io_pads
setFormField extract_blockage cell_name PADVSS
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

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name io_pads
setFormField mark_cell_type cell_name FILLER0_1
setFormField mark_cell_type cell_type "pad filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FILLER0_1
set_attribute [get_ports -all VDD] port_type "Power"
set_attribute [get_ports -all VSS] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name io_pads
setFormField extract_blockage cell_name FILLER0_1
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

#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name io_pads
setFormField mark_cell_type cell_name FILLER1
setFormField mark_cell_type cell_type "pad filler"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel FILLER1
set_attribute [get_ports -all VDD] port_type "Power"
set_attribute [get_ports -all VSS] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name io_pads
setFormField extract_blockage cell_name FILLER1
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


#Marco el tipo de celda
cmMarkCellType
setFormField mark_cell_type library_name io_pads
setFormField mark_cell_type cell_name CORNER
setFormField mark_cell_type cell_type "corner"
formOK mark_cell_type

# Abro la celda y seteo atributos
open_mw_cel CORNER
set_attribute [get_ports -all VDD] port_type "Power"
set_attribute [get_ports -all VSS] port_type "Ground"
save_mw_cel
close_mw_cel

# Extraigo la FRAM 
auExtractBlockagePinVia
setFormField extract_blockage library_name io_pads
setFormField extract_blockage cell_name CORNER
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







# Seteo la orientacion de los pads

auLoadCLF
setFormField "Load CLF File" "Load CLF File Without Timing Related Information" "1"
setFormField "Load CLF File" "CLF File Name" "io.clf"
setFormField "Load CLF File" "Library Name" "io_pads"
formOK "Load CLF File"

# Cierro la libreria
geConfirmCloseLib
formYes dialog_box

# Cierro Milkyway
menuQuit
formYes dialog_box
