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

proc onc5mos {} {

	########################################################################
	# Process Specifications
	########################################################################
	# Fabrication grid
	set grid 5e-2
	# Min Length
	set min_length 6e-1

	set min_width 0.8


	# Set inst name	
	set inst	[iPDK_getCurrentInst]
	
	puts "Instance Id: $inst" 

	########################################################################
	# Get Value params
	########################################################################

	set Model 			[iPDK_getParamValue model $inst]
	puts "Model: $Model"

	set L	 			[iPDK_engToSci [iPDK_getParamValue mosL $inst]]
	puts "Length: $L"

	set W	 			[iPDK_engToSci [iPDK_getParamValue mosW $inst]]
	puts "Width: $W"

	set Fingers			[iPDK_engToSci [iPDK_getParamValue fingers $inst]]
	puts "Fingers: $Fingers"


	##################################################################
	# Fingers
	##################################################################	

	if {$Fingers < 1} {
		set Fingers 1
	} elseif {$Fingers >100} {
		set Fingers 100
	}

	##################################################################
	# W & L
	##################################################################


	set L 	[expr {[expr {ceil ($L/$grid)}]*$grid}]
	set W 	[expr {[expr {ceil ($W/$grid)}]*$grid}]	

	puts "Length: $L"
	puts "Width: $W"

	if {$L < $min_length} {
		puts "Warning: The length is lower than 0.6"
		set L $min_length
	}

	if {($W/$Fingers) < $min_width} {
		puts "Warning: The width is lower than 0.8"
		set W [expr {$min_width*$Fingers}]	
	}

	# Update to schematic
	set Lu 		[expr {$L*1e-6}]	
	set Wu 		[expr {$W*1e-6}]	

	iPDK_setParamValue mosL [iPDK_sciToEng $L] $inst 0
	iPDK_setParamValue mosW [iPDK_sciToEng $W] $inst 0
	iPDK_setParamValue mosLu [iPDK_sciToEng $Lu] $inst 0
	iPDK_setParamValue mosWu [iPDK_sciToEng $Wu] $inst 0
	iPDK_setParamValue fingers [iPDK_sciToEng $Fingers] $inst 0
}
