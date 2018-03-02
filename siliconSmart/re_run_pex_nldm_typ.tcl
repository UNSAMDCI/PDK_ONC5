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


set charpoint testcase_pex_recharac
create $charpoint 
set_log_file $charpoint/siliconsmart.log

exec cp re_configure_typ.tcl $charpoint/config/configure.tcl
exec cp gends_config.tcl $charpoint/reports/gends_config.tcl
exec cp -r netlists_pex/ $charpoint/
exec rm -rf $charpoint/netlists
exec mv $charpoint/netlists_pex $charpoint/netlists
exec cp control/LOGIC0.inst $charpoint/control/LOGIC0.inst
exec cp control/LOGIC1.inst $charpoint/control/LOGIC1.inst
set_location $charpoint


import -fast -liberty libs/pex/nldm_op_cond_typ.lib -extension .pex.netlist -clocks {ICLK} -netlist_dir $charpoint/netlists all

# Seteo los atributos
source atributos.tcl

# Configuro y caracterizo
source recharac.tcl

generate_datasheet -operating_condition {op_cond_typ} $cells
compare_library -reference libs/pex/nldm_op_cond_typ.lib -test $charpoint/models/liberty/nldm_op_cond_typ.lib -output_dir structural_comparison -user_defined -compare_values {ccst ccsn ccsp}
