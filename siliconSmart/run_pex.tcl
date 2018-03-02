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


set cells {all}
set charpoint testcase_pex
create $charpoint
set_log_file $charpoint/siliconsmart.log
exec cp configure.tcl $charpoint/config/configure.tcl
exec cp gends_config.tcl $charpoint/reports/gends_config.tcl
exec cp -r netlists_pex/ $charpoint/
exec rm -rf $charpoint/netlists
exec mv $charpoint/netlists_pex $charpoint/netlists
exec cp control/LOGIC0.inst $charpoint/control/LOGIC0.inst
exec cp control/LOGIC1.inst $charpoint/control/LOGIC1.inst
set_location $charpoint
import -recognize -netlist_dir $charpoint/netlists -extension .pex.netlist -clocks {ICLK}

# Set attributes
source atributos.tcl

configure -timing -power -ccs $cells
characterize $cells
model -timing -power -output nldm -operating_condition op_cond_slow $cells
model -timing -power -output nldm -operating_condition op_cond_fast $cells
model -timing -power -output nldm -operating_condition op_cond_typ $cells
model -timing -power -ccs -output ccs -operating_condition op_cond_slow $cells
model -timing -power -ccs -output ccs -operating_condition op_cond_fast $cells
model -timing -power -ccs -output ccs -operating_condition op_cond_typ $cells
model -verilog -output my_model $cells
generate_datasheet -operating_condition {op_cond_typ op_cond_fast op_cond_slow} $cells


