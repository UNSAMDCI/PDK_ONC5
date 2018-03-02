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
setFormField open_library library_name icc_onc5
formOK open_library

# Reemplazo la techfile
cmReplaceTech
setFormField replace_technology_file library_name ../../icc_onc5/icc_onc5
setFormField replace_technology_file technology_file_name ../../icc_onc5/libs
setFormField replace_technology_file technology_file_name ../../icc_onc5/libs/ami500hxgc_3m.tf
formOK replace_technology_file

# Seteo atributos de la celda
source set_attr_bis.tcl

# Seteo la Boundary
auSetPRBdry
setFormField set_pr_boundary library_name icc_onc5
setFormField set_pr_boundary left_boundary specify
setFormField set_pr_boundary left_from "Origin (0,0)"
setFormField set_pr_boundary width auto
setFormField set_pr_boundary width specify
setFormField set_pr_boundary width_value 1.6
setFormField set_pr_boundary bottom_boundary specify
setFormField set_pr_boundary bottom_offset 0.0000
setFormField set_pr_boundary bottom_from "Bottom P/G Pin"
setFormField set_pr_boundary left_offset 0.0000
setFormField set_pr_boundary height auto
setFormField set_pr_boundary adjacent_rows "shared P/G (double-back)"
setFormField set_pr_boundary multiple_(2x,_3x) "all cells are single-height"
setFormField set_pr_boundary tile_name unit
setFormField set_pr_boundary cell_p/g_rail_orientation Horizontal
setFormField set_pr_boundary cell_ground_rail_position Auto
setFormField set_pr_boundary 1st_layer_parallel_to_p/g_rail Metal1
setFormField set_pr_boundary 1st_layer_perpendicular_to_p/g_rail Metal2
formOK set_pr_boundary

# Defino el offset de los tracks
axgDefineWireTracks
setFormField define_wire_track poly_offset 0
setFormField define_wire_track m1_offset 0
setFormField define_wire_track m2_offset 0
setFormField define_wire_track m3_offset 0
setFormField define_wire_track polydir vertical
setFormField define_wire_track m1dir horizontal
setFormField define_wire_track m2dir vertical
setFormField define_wire_track m3dir horizontal
formOK define_wire_track

# Cierro la libreria
geConfirmCloseLib
formYes dialog_box

# Extraigo propiedades de antena
source antenna.tcl

# Updateo las patas de la MW con la DB
update_mw_port_by_db -db_file ../libs/nldm_op_cond_typ.db -mw_lib ../../icc_onc5/icc_onc5

# Cierro Milkyway
menuQuit
formYes dialog_box
