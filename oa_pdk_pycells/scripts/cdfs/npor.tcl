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

proc loadParams_npor {libName {cellName {}} {overwrite 1} {forceMaster 0}} {

    set data [oa::LibFind $libName]

    if { "" == $data } { set data [oa::LibCreate $libName ./$libName] }
    if { "" != $cellName } { set data [dm::findCell $cellName -libName $libName] }
    if { $overwrite } { db::purgeCDF $data -forceMaster $forceMaster -removeCDF 1 }

    db::createParamDef model            				       	                \
        -data          $data                                                   	\
        -type          cyclic                                                  	\
        -prompt        {Model Name}                                           	\
        -defValue      {npor}                                              	    \
        -display       {t}                                                  	\
        -choices       {"npor" "nporxwnl" "hipor" "hiporxwnl" "po2r" "po2rxwnl" "m1r" "m2r" "m3r" "nprpwnl"} \
        -parseAsPEL    0                                                       	\
        -parseAsNumber 0                                                       	\
        -storeDefault  1                                                       

    db::createParamDef entryModeDisp           				       	            \
        -data          $data                                                   	\
        -type          radio                                                  	\
        -prompt        {Entry Mode}			       	                            \
        -defValue      {LengthWidth}                  			       	        \
        -callback      {onc5res}                                                \
        -display       {t}                                                  	\
        -editable      {t}  	                                               	\
        -use           {t}                                                     	\
	    -choices       {"LengthWidth" "ResistanceWidth" "ResistanceLength"}	    \
        -parseAsPEL    0                                                       	\
        -parseAsNumber 0                                                       	\
        -storeDefault  1                   

    db::createParamDef resNsq           				       		            \
        -data          $data                                                   	\
        -type          string                                                  	\
        -prompt        {Num. of Squares}				       	                \
        -callback      {onc5res}                                            	\
        -units         {}              	                                        \
        -defValue      {4}                                			       	    \
        -display       {t}                                                  	\
        -editable      {!t}  	                                               	\
        -use           {t}                                                     	\
        -parseAsPEL    1                                                       	\
        -parseAsNumber 1                                                       	\
        -storeDefault  1       

    db::createParamDef resL                           				       		\
        -data          $data                                                   	\
        -type          string                                                  	\
        -prompt        {Resistor Length}	                   			       	\
        -callback      {onc5res}                                             	\
        -units         {}             	                                        \
        -defValue      {16}                              			       		\
        -display       {t}                                                  	\
        -editable      {cdfgData->entryModeDisp->value != "ResistanceWidth"}  	\
        -use           {t}                                                     	\
        -parseAsPEL    1                                                       	\
        -parseAsNumber 1                                                       	\
        -storeDefault  1 

    db::createParamDef resW                                                     \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Resistor Width}                                         \
        -callback      {onc5res}                                                \
        -units         {}                                                       \
        -defValue      {4}                                                      \
        -display       {t}                                                      \
        -editable      {cdfgData->entryModeDisp->value != "ResistanceLength"}   \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef resUnit                                                  \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Number of Units}                                        \
        -callback      {onc5res}                                                \
        -units         {}                                                       \
        -defValue      {1}                                                      \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1

    db::createParamDef resSpacing                                               \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Unit Spacing}                                           \
        -callback      {}                                                       \
        -units         {}                                                       \
        -defValue      {4}                                                      \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1

    db::createParamDef Resistance                                               \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Resistance}                                             \
        -callback      {onc5res}                                                \
        -units         {}                                                       \
        -defValue      {102}                                                    \
        -display       {t}                                                      \
        -editable      {cdfgData->entryModeDisp->value != "LengthWidth"}        \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1

    db::createParamDef resLu                                                    \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Resistor Length (um)}                                   \
        -callback      {onc5res}                                                \
        -units         lengthMetric                                             \
        -defValue      {16u}                                                    \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef resWu                                                    \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Resistor Width (um)}                                    \
        -callback      {onc5res}                                                \
        -units         lengthMetric                                             \
        -defValue      {4u}                                                     \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    # Label display section
    db::setNetlistInfo paramLabelSet                                            \
        -value {-model resW resL resUnit }					                    \
        -type string                                                            \
        -data $data                                                             \
        -section display                                                        \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo opPointLabelSet                                         	\
        -value {} 	                                                        \
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
        -value {(l w)}	                          			                    \
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
        -value {(nil l resL w resW ns resNsq)}		                            \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo termOrder                                               	\
        -value {(PLUS MINUS)}                                                  	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                      

    # Netlister specific information for auCdl
    db::setNetlistInfo componentName                            	            \
        -value {res}                                 	                        \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster  

    db::setNetlistInfo modelName                                                \
        -value {npor}                                                           \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                            

    db::setNetlistInfo instParameters                                          	\
        -value {(l w)}                          			                    \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                                              

    db::setNetlistInfo namePrefix                                              	\
        -value {R}                                                             	\
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
        -value {(PLUS MINUS)}                                                  	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster 

    db::setNetlistInfo propMapping                                             	\
        -value {(nil l resLu w resWu)}		                                    \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo permuteRule                                             	\
        -value {(p PLUS MINUS)}                                                	\
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

