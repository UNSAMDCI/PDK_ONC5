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

proc onc5res {} {

	########################################################################
	# Process Specifications
	########################################################################
	# Fabrication grid
	set grid 0.05
	# Min Width
	set min_width 0.6

	# Resistivity (options)
	set res 0


	# Set inst name	
	set inst	[iPDK_getCurrentInst]
	
	puts "Instance Id: $inst" 

	########################################################################
	# Get Value params
	########################################################################

	set Model 			[iPDK_getParamValue model $inst]
	puts "Model: $Model"

	set entryMode	 	[iPDK_getParamValue entryModeDisp $inst]
	puts "Entry Mode: $entryMode"

	set L	 			[iPDK_engToSci [iPDK_getParamValue resL $inst]]
	puts "Length: $L"

	set W	 			[iPDK_engToSci [iPDK_getParamValue resW $inst]]
	puts "Width: $W"

	set Nsq	 			[iPDK_engToSci [iPDK_getParamValue resNsq $inst]]
	puts "Nro Square: $Nsq"

	set R				[iPDK_engToSci [iPDK_getParamValue Resistance $inst]]
	puts "Resistance: $R"

	set Unit			[iPDK_engToSci [iPDK_getParamValue resUnit $inst]]
	puts "Resistance Unit: $Unit"


	##################################################################
	# Fingers
	##################################################################	

	if {$Unit < 1} {
		set Unit 1
	} elseif {$Unit >100} {
		set Unit 100
	}

	##################################################################
	# Resistivity for different resistances
	##################################################################

	if {$Model == "npor"} {
		set res 25.5
	} elseif {$Model == "hipor"} {
		set res 1000
	} elseif {$Model == "hiporxwnl"} {
		set res 1000
	} elseif {$Model == "nporxwnl"} {
		set res 25.5
	} elseif {$Model == "po2r"} {
		set res 45.5
	} elseif {$Model == "po2rxwnl"} {
		set res 45.5
	}

	if {$entryMode == "LengthWidth"} {
			
		# L & W proportional to the grid (0.05)

		set L 	[expr {[expr {int ($L/$grid)}]*$grid}]
		set W 	[expr {[expr {int ($W/$grid)}]*$grid}]	

		if {$W < 0.6} {
			puts "Warning: The width of the resistance is lower than 0.6"
			set W 0.6
		}

		# Update de Resistance value
		set R 	[expr {$res*$L/$W}]	

	} elseif {$entryMode == "ResistanceWidth"} {

			
		# W proportional to the grid (0.05)
		set W 	[expr {[expr {int ($W/$grid)}]*$grid}]	

		if {$W < 0.6} {
			puts "Warning: The width of the resistance is lower than 0.6"
			set W 0.6
		}

		# Update de Length value
		set L 	[expr {$R*$W/($res)}]	

		# L proportional to the grid (0.05)
		set L 	[expr {[expr {int ($L/$grid)}]*$grid}]

	} elseif {$entryMode == "ResistanceLength"} {

		# L proportional to the grid (0.05)
		set L 	[expr {[expr {int ($L/$grid)}]*$grid}]	

		# Update de Width value
		set W 	[expr {$L*$res/$R}]	

		if {$W < 0.6} {
			puts "Warning: The width of the resistance is lower than 0.6"
			set W 0.6
		}

		# W proportional to the grid (0.05)
		set W 	[expr {[expr {int ($W/$grid)}]*$grid}]	

	} 

	# Update to schematic
	set	Nsq 	[expr {$L/$W}]	
	set Lu 		[expr {$L*1e-6}]	
	set Wu 		[expr {$W*1e-6}]	

	iPDK_setParamValue resNsq [iPDK_sciToEng $Nsq] $inst 0
	iPDK_setParamValue resL [iPDK_sciToEng $L] $inst 0
	iPDK_setParamValue resW [iPDK_sciToEng $W] $inst 0
	iPDK_setParamValue resLu [iPDK_sciToEng $Lu] $inst 0
	iPDK_setParamValue resWu [iPDK_sciToEng $Wu] $inst 0
	iPDK_setParamValue Resistance [iPDK_sciToEng $R] $inst 0
	iPDK_setParamValue resUnit [iPDK_sciToEng $Unit] $inst 0
}
