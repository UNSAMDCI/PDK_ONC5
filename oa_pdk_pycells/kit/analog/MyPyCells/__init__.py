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

from grilla     import *
from resistor_unit     import *
from resistor import *
from capacitor_unit import *
from pipc import *
from pipcxw import *
from transistor_unit import *
from transistor import *
from power_transistor_unit import *
from power_transistor import *
from power_transistor20_unit import *


def definePcells(lib):
    lib.definePcell(resistor_unit, "resistor_unit")
    lib.definePcell(resistor, "resistor")
    lib.definePcell(capacitor_unit, "capacitor_unit")
    lib.definePcell(pipc, "pipc")
    lib.definePcell(pipcxw, "pipcxw")
    lib.definePcell(transistor_unit, "transistor_unit")
    lib.definePcell(transistor, "transistor")
    lib.definePcell(power_transistor_unit, "power_transistor_unit")
    lib.definePcell(power_transistor20_unit, "power_transistor20_unit")
    lib.definePcell(power_transistor, "power_transistor")
    
