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

# Source callbacks

source ../callbacks/onc5res.tcl
source ../callbacks/onc5cap.tcl
source ../callbacks/onc5mos.tcl

# Source cdfs

source ../cdfs/npor.tcl
loadParams_npor c5 npor

source ../cdfs/nporxw.tcl
loadParams_nporxw c5 nporxw

source ../cdfs/hipor.tcl
loadParams_hipor c5 hipor

source ../cdfs/hiporxw.tcl
loadParams_hiporxw c5 hiporxw

source ../cdfs/po2r.tcl
loadParams_po2r c5 po2r

source ../cdfs/po2rxw.tcl
loadParams_po2rxw c5 po2rxw

source ../cdfs/m1r.tcl
loadParams_m1r c5 m1r

source ../cdfs/m2r.tcl
loadParams_m2r c5 m2r

source ../cdfs/m3r.tcl
loadParams_m3r c5 m3r

source ../cdfs/pipc.tcl
loadParams_pipc c5 pipc

source ../cdfs/pipcxw.tcl
loadParams_pipcxw c5 pipcxw

source ../cdfs/vpb4u.tcl
loadParams_vpb4u c5 vpb4u

source ../cdfs/vpb20u.tcl
loadParams_vpb20u c5 vpb20u

source ../cdfs/enm.tcl
loadParams_enm c5 enm

source ../cdfs/epm.tcl
loadParams_epm c5 epm

source ../cdfs/lndm12dt.tcl
loadParams_lndm12dt c5 lndm12dt

source ../cdfs/lndm12t.tcl
loadParams_lndm12t c5 lndm12t

source ../cdfs/lpdm12dt.tcl
loadParams_lpdm12dt c5 lpdm12dt

source ../cdfs/lpdm12t.tcl
loadParams_lpdm12t c5 lpdm12t

source ../cdfs/lndm20dt.tcl
loadParams_lndm20dt c5 lndm20dt

source ../cdfs/lndm20d.tcl
loadParams_lndm20d c5 lndm20d

source ../cdfs/lpdm20dt.tcl
loadParams_lpdm20dt c5 lpdm20dt

source ../cdfs/lpdm20d.tcl
loadParams_lpdm20d c5 lpdm20d

source ../cdfs/schd.tcl
loadParams_schd c5 schd

