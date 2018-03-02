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

proc loadParams_vpb4u {libName {cellName {}} {overwrite 1} {forceMaster 0}} {

    set data [oa::LibFind $libName]

    if { "" == $data } { set data [oa::LibCreate $libName ./$libName] }
    if { "" != $cellName } { set data [dm::findCell $cellName -libName $libName] }
    if { $overwrite } { db::purgeCDF $data -forceMaster $forceMaster -removeCDF 1 }

    db::createParamDef model            				       	                \
        -data          $data                                                   	\
        -type          cyclic                                                  	\
        -prompt        {Model Name}                                           	\
        -defValue      {vpb4u}                                              	\
        -display       {t}                                                  	\
        -choices       {"vpb4u"}                                                \
        -parseAsPEL    0                                                       	\
        -parseAsNumber 0                                                       	\
        -storeDefault  1                                                       

    db::createParamDef bjtArea           				       		            \
        -data          $data                                                   	\
        -type          string                                                  	\
        -prompt        {Area}				       	                			\
        -callback      {}                                            			\
        -units         {}              	                                        \
        -defValue      {16.81}                            			       	    \
        -display       {t}                                                  	\
        -editable      {!t}  	                                               	\
        -use           {t}                                                     	\
        -parseAsPEL    1                                                       	\
        -parseAsNumber 1                                                       	\
        -storeDefault  1       

    db::createParamDef bjtL                           				       		\
        -data          $data                                                   	\
        -type          string                                                  	\
        -prompt        {Length}	                             			       	\
        -callback      {}                          			                   	\
        -units         {}             	                                        \
        -defValue      {4.1}                              			       		\
        -display       {t}                                                  	\
        -editable      {!t}  													\
        -use           {t}                                                     	\
        -parseAsPEL    1                                                       	\
        -parseAsNumber 1                                                       	\
        -storeDefault  1 

    db::createParamDef bjtW                                                     \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Width}                                         			\
        -callback      {}		                                                \
        -units         {}                                                       \
        -defValue      {4.1}                                                    \
        -display       {t}                                                      \
        -editable      {!t}   													\
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef bjtAreau                                                 \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Area (um)}                   			                \
        -callback      {}                                                		\
        -units         lengthMetric                                             \
        -defValue      {1.68e-11}                                               \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    # Label display section
    db::setNetlistInfo paramLabelSet                                            \
        -value {-model bjtArea bjtW bjtL }					                    \
        -type string                                                            \
        -data $data                                                             \
        -section display                                                        \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo opPointLabelSet                                         	\
        -value {} 	                                                        	\
        -type string                                                           	\
        -data $data                                                            	\
        -section display                                                       	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo modelLabelSet                                           	\
        -value {}                                                            	\
        -type string                                                           	\
        -data $data                                                            	\
        -section display                                                       	\
        -forceMaster $forceMaster                                              

    # Netlister specific information for hspiceD
    db::setNetlistInfo componentName                            	            \
        -value {(model)}                                 	                    \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo instParameters                                          	\
        -value {(area w l)}	                          			                \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo namePrefix                                              	\
        -value {X}                                                             	\
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo netlistProcedure                                        	\
        -value {""}                                             		        \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo propMapping                                             	\
        -value {(nil l bjtL w bjtW area bjtArea)}		                        \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo termOrder                                               	\
        -value {(C B E)}                                                     	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                      

    # Netlister specific information for auCdl
    db::setNetlistInfo componentName                            	            \
        -value {bjt}                                 	                        \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster  

    db::setNetlistInfo modelName                                                \
        -value {vpb4u}                                                          \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                            

    db::setNetlistInfo instParameters                                          	\
        -value {(AREA)}                          			                    \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo namePrefix                                              	\
        -value {Q}                                                             	\
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo netlistProcedure                                        	\
        -value {ansCdlCompPrim}                   				                \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo termOrder                                               	\
        -value {(C B E)}                                                     	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster 

    db::setNetlistInfo propMapping                                             	\
        -value {(nil AREA bjtAreau)}		                                    \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo permuteRule                                             	\
        -value {(p C B E)}                                         		       	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo     							\
        -forceMaster $forceMaster  

    # Top level properties
    db::setNetlistInfo promptWidth                                             	\
        -value {175}                                                           	\
        -type integer                                                          	\
        -data $data                                                            	\
        -section form                                                          	\
        -forceMaster $forceMaster      	

    db::setNetlistInfo fieldWidth                                             	\
        -value {150}                                                           	\
        -type integer                                                          	\
        -data $data                                                            	\
        -section form                                                          	\
        -forceMaster $forceMaster   
                                      
    db::setNetlistInfo fieldHeight                                             	\
        -value {15}                                                           	\
        -type integer                                                          	\
        -data $data                                                            	\
        -section form                                                          	\
        -forceMaster $forceMaster    
                                         
    db::saveCDF $data -forceMaster $forceMaster
}

