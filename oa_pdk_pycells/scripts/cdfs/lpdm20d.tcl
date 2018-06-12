# ***********************************************
# UNSAM - Universidad Nacional San Martin - 2017
# ***********************************************
#   Escuela Ciencia y Tecnica 
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

proc loadParams_lpdm20d {libName {cellName {}} {overwrite 1} {forceMaster 0}} {

    set data [oa::LibFind $libName]

    if { "" == $data } { set data [oa::LibCreate $libName ./$libName] }
    if { "" != $cellName } { set data [dm::findCell $cellName -libName $libName] }
    if { $overwrite } { db::purgeCDF $data -forceMaster $forceMaster -removeCDF 1 }

    db::createParamDef model            				       	                \
        -data          $data                                                   	\
        -type          cyclic                                                  	\
        -prompt        {Model Name}                                           	\
        -defValue      {lpdm20d}                                              	\
        -display       {t}                                                  	\
        -choices       {"lndm12dt" "lndm12t" "lpdm12dt" "lpdm12t" "lndm20dt" "lndm20d" "lpdm20dt" "lpdm20d"}                                            \
        -parseAsPEL    0                                                       	\
        -parseAsNumber 0                                                       	\
        -storeDefault  1                                                       

db::createParamDef mosW                                                     \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Device Width}                                           \
        -callback      {onc5mos}                                                \
        -units         {}                                                       \
        -defValue      {4}                                                      \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef mosL                           				       		\
        -data          $data                                                   	\
        -type          string                                                  	\
        -prompt        {Device Length}	                   		    	       	\
        -callback      {onc5mos}                                                \
        -units         {}             	                                        \
        -defValue      {10}                              			       		\
        -display       {t}                                                  	\
        -editable      {t}  	                                                \
        -use           {t}                                                     	\
        -parseAsPEL    1                                                       	\
        -parseAsNumber 1                                                       	\
        -storeDefault  1 

    db::createParamDef fingers                                                  \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Fingers}                                                \
        -callback      {onc5mos}                                                \
        -units         {}                                                       \
        -defValue      {1}                                                      \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1


    db::createParamDef mosLu                                                    \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Device Length (um)}                                     \
        -callback      {}                                                       \
        -units         lengthMetric                                             \
        -defValue      {10u}                                                    \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef mosWu                                                    \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Device Width (um)}                                      \
        -callback      {}                                                       \
        -units         lengthMetric                                             \
        -defValue      {4u}                                                     \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef mosGateContact            				       	        \
        -data          $data                                                   	\
        -type          cyclic                                                  	\
        -prompt        {Gate Contact}                                         	\
        -defValue      {TOP}                                              	    \
        -display       {t}                                                  	\
        -choices       {"TOP" "BOT" "BOTH" "NONE"}                              \
        -parseAsPEL    0                                                       	\
        -parseAsNumber 0                                                       	\
        -storeDefault  1                                                       


    # Label display section
    db::setNetlistInfo paramLabelSet                                            \
        -value {-model mosW mosL fingers }					                    \
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
        -value {lpdm20d}                                 	                        \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                 

    db::setNetlistInfo modelName                                                \
        -value {lpdm20d}                                                            \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
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
        -value {(nil l mosL w mosW)}		                                    \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo termOrder                                               	\
        -value {(D G S B)}                                                  	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister hspiceD                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster                      

    # Netlister specific information for auCdl
    db::setNetlistInfo componentName                            	            \
        -value {mos}                                 	                        \
        -type symbol                                                           	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster  

    db::setNetlistInfo modelName                                                \
        -value {lpdm20d}                                                           \
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
        -value {MP}                                                           	\
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
        -value {(D G S B)}                                                  	\
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster 

    db::setNetlistInfo propMapping                                             	\
        -value {(nil l mosLu w mosWu)}		                                    \
        -type list                                                             	\
        -data $data                                                            	\
        -section netlist                                                       	\
        -netlister auCdl                                                     	\
        -info simInfo                                                          	\
        -forceMaster $forceMaster     

    db::setNetlistInfo permuteRule                                             	\
        -value {(p D G S B)}                                                	\
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

