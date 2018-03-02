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

proc loadParams_schd {libName {cellName {}} {overwrite 1} {forceMaster 0}} {

    set data [oa::LibFind $libName]

    if { "" == $data } { set data [oa::LibCreate $libName ./$libName] }
    if { "" != $cellName } { set data [dm::findCell $cellName -libName $libName] }
    if { $overwrite } { db::purgeCDF $data -forceMaster $forceMaster -removeCDF 1 }

    db::createParamDef model            				       	                \
        -data          $data                                                   	\
        -type          cyclic                                                  	\
        -prompt        {Model Name}                                           	\
        -defValue      {schd}                                              	    \
        -display       {t}                                                  	\
        -choices       {"schd"}                                                 \
        -parseAsPEL    0                                                       	\
        -parseAsNumber 0                                                       	\
        -storeDefault  1                    

    db::createParamDef diodeArea                                                \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Area}                                                   \
        -callback      {}                                                       \
        -units         {}                                                       \
        -defValue      {5.27}                                                   \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1       

    db::createParamDef diodePeri                                                \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Perimeter}                                              \
        -callback      {}                                                       \
        -units         {}                                                       \
        -defValue      {9.6}                                                    \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1       

    # Label display section
    db::setNetlistInfo paramLabelSet                                            \
        -value {-model }					                                    \
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
        -value {}	                          	           		                \
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
        -value {}		                                                        \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo termOrder                                               	\
        -value {(Anode Cathode SUBSTRATE)}                                    	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                      

    # Netlister specific information for auCdl
    db::setNetlistInfo componentName                            	            \
        -value {subcircuit}                           	                        \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster  

    db::setNetlistInfo modelName                                                \
        -value {schd}                                                           \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                            

    db::setNetlistInfo instParameters                                          	\
        -value {(area pj)}                 			                            \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo namePrefix                                              	\
        -value {X}                                                             	\
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
        -value {(Anode Cathode SUBSTRATE)}                                    	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster 

    db::setNetlistInfo propMapping                                             	\
        -value {(nil area diodeArea pj diodePeri)}		                        \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo permuteRule                                             	\
        -value {(p Anode Cathode SUBSTRATE)}                       		       	\
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

