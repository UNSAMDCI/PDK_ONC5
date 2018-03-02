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

proc loadParams_pipcxw {libName {cellName {}} {overwrite 1} {forceMaster 0}} {

    set data [oa::LibFind $libName]

    if { "" == $data } { set data [oa::LibCreate $libName ./$libName] }
    if { "" != $cellName } { set data [dm::findCell $cellName -libName $libName] }
    if { $overwrite } { db::purgeCDF $data -forceMaster $forceMaster -removeCDF 1 }

    db::createParamDef model                                                    \
        -data          $data                                                    \
        -type          cyclic                                                   \
        -prompt        {Model Name}                                             \
        -defValue      {pipc}                                                   \
        -display       {t}                                                      \
        -choices       {"pipcxw"}                                               \
        -parseAsPEL    0                                                        \
        -parseAsNumber 0                                                        \
        -storeDefault  1                                                       

    db::createParamDef entryModeDisp                                            \
        -data          $data                                                    \
        -type          radio                                                    \
        -prompt        {Entry Mode}                                             \
        -defValue      {AreaPerimeter}                                          \
        -callback      {onc5cap}                                                \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -choices       {"AreaPerimeter" "LengthWidth"}                          \
        -parseAsPEL    0                                                        \
        -parseAsNumber 0                                                        \
        -storeDefault  1                   

    db::createParamDef capArea                                                  \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Area}                                                   \
        -callback      {onc5cap}                                                \
        -units         {}                                                       \
        -defValue      {100.0}                                                  \
        -display       {t}                                                      \
        -editable      {cdfgData->entryModeDisp->value == "AreaPerimeter"}      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1       

    db::createParamDef capPeri                                                  \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Perimeter}                                              \
        -callback      {onc5cap}                                                \
        -units         {}                                                       \
        -defValue      {40}                                                     \
        -display       {t}                                                      \
        -editable      {cdfgData->entryModeDisp->value == "AreaPerimeter"}      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef capL                                                     \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Capacitor Length}                                       \
        -callback      {onc5cap}                                                \
        -units         {}                                                       \
        -defValue      {10}                                                     \
        -display       {t}                                                      \
        -editable      {cdfgData->entryModeDisp->value == "LengthWidth"}        \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef capW                                                     \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Capacitor Width}                                        \
        -callback      {onc5cap}                                                \
        -units         {}                                                       \
        -defValue      {10}                                                     \
        -display       {t}                                                      \
        -editable      {cdfgData->entryModeDisp->value == "LengthWidth"}        \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1

    db::createParamDef gap                                                      \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Ring Gap}                                               \
        -callback      {onc5cap}                                                \
        -units         {}                                                       \
        -defValue      {0}                                                      \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1

    db::createParamDef shield                                                   \
        -data          $data                                                    \
        -type          radio                                                    \
        -prompt        {Guard Ring}                                             \
        -defValue      {Ptype}                                                  \
        -callback      {onc5cap}                                                \
        -display       {t}                                                      \
        -editable      {t}                                                      \
        -use           {t}                                                      \
        -choices       {"Ptype" "Ntype" "NONE"}                                 \
        -parseAsPEL    0                                                        \
        -parseAsNumber 0                                                        \
        -storeDefault  1        

    db::createParamDef capLu                                                    \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Capacitor Length (um)}                                  \
        -callback      {onc5cap}                                                \
        -units         lengthMetric                                             \
        -defValue      {10u}                                                    \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef capWu                                                    \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Capacitor Width (um)}                                   \
        -callback      {onc5cap}                                                \
        -units         lengthMetric                                             \
        -defValue      {10}                                                     \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef capAreau                                                 \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Capacitor Area (um2)}                                   \
        -callback      {onc5cap}                                                \
        -units         {}                                                       \
        -defValue      {100p}                                                   \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    db::createParamDef capPeriu                                                 \
        -data          $data                                                    \
        -type          string                                                   \
        -prompt        {Capacitor Perimeter (um)}                               \
        -callback      {onc5cap}                                                \
        -units         lengthMetric                                             \
        -defValue      {40u}                                                    \
        -display       {t}                                                      \
        -editable      {!t}                                                     \
        -use           {t}                                                      \
        -parseAsPEL    1                                                        \
        -parseAsNumber 1                                                        \
        -storeDefault  1 

    # Label display section
    db::setNetlistInfo paramLabelSet                                            \
        -value { -model capArea capPeri m }                                     \
        -type string                                                            \
        -data $data                                                             \
        -section display                                                        \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo opPointLabelSet                                          \
        -value {}                                                           \
        -type string                                                            \
        -data $data                                                             \
        -section display                                                        \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo modelLabelSet                                            \
        -value {}                                                               \
        -type string                                                            \
        -data $data                                                             \
        -section display                                                        \
        -forceMaster $forceMaster                                              

    # Netlister specific information for hspiceD
    db::setNetlistInfo componentName                                            \
        -value {(model)}                                                        \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo instParameters                                           \
        -value {(area peri)}                                                    \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo namePrefix                                               \
        -value {X}                                                              \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo netlistProcedure                                         \
        -value {""}                                                             \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo propMapping                                              \
        -value {(nil area capArea peri capPeri)}                                \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
        -forceMaster $forceMaster     

    db::setNetlistInfo termOrder                                                \
        -value {(PLUS MINUS SUB)}                                               \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister hspiceD                                                      \
        -info simInfo                                                           \
        -forceMaster $forceMaster                      

    # Netlister specific information for auCdl
    db::setNetlistInfo componentName                                            \
        -value {cap}                                                            \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster     

    db::setNetlistInfo modelName                                                \
        -value {pipcxw}                                                         \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                                                                     

    db::setNetlistInfo instParameters                                           \
        -value {(L W a p)}                                                      \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo namePrefix                                               \
        -value {C}                                                              \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo netlistProcedure                                         \
        -value {ansCdlCompPrim}                                                 \
        -type symbol                                                            \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster                                              

    db::setNetlistInfo termOrder                                                \
        -value {(PLUS MINUS)}                                                   \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster 

    db::setNetlistInfo propMapping                                              \
        -value {(nil L capLu W capWu a capAreau p capPeriu)}                    \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                                                           \
        -forceMaster $forceMaster     

    db::setNetlistInfo permuteRule                                              \
        -value {(p PLUS MINUS)}                                                 \
        -type list                                                              \
        -data $data                                                             \
        -section netlist                                                        \
        -netlister auCdl                                                        \
        -info simInfo                               \
        -forceMaster $forceMaster  

    # Top level properties
    db::setNetlistInfo promptWidth                                              \
        -value {175}                                                            \
        -type integer                                                           \
        -data $data                                                             \
        -section form                                                           \
        -forceMaster $forceMaster       

    db::setNetlistInfo fieldWidth                                               \
        -value {150}                                                            \
        -type integer                                                           \
        -data $data                                                             \
        -section form                                                           \
        -forceMaster $forceMaster   
                                      
    db::setNetlistInfo fieldHeight                                              \
        -value {15}                                                             \
        -type integer                                                           \
        -data $data                                                             \
        -section form                                                           \
        -forceMaster $forceMaster    
                                         
    db::saveCDF $data -forceMaster $forceMaster
}

