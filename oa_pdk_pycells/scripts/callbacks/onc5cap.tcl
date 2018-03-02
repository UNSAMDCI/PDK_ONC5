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

proc onc5cap {} {

	########################################################################
	# Process Specifications
	########################################################################
	# Fabrication grid
	set grid 0.05

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

	set L	 			[iPDK_engToSci [iPDK_getParamValue capL $inst]]
	puts "Length: $L"

	set W	 			[iPDK_engToSci [iPDK_getParamValue capW $inst]]
	puts "Width: $W"

	set Area	 		[iPDK_engToSci [iPDK_getParamValue capArea $inst]]
	puts "Area: $Area"

	set Peri			[iPDK_engToSci [iPDK_getParamValue capPeri $inst]]
	puts "Perimeter: $Peri"

	##################################################################
	# Resistivity for different resistances
	##################################################################

	if {$Model == "pipc"} {
		set capA 0.9
		set capP 0.065 
	} 
	if {$entryMode == "LengthWidth"} {
			
		# L & W proportional to the grid (0.05)

		set L 	[expr {[expr {int ($L/$grid)}]*$grid}]
		set W 	[expr {[expr {int ($W/$grid)}]*$grid}]	

		if {$W < 4} {
			puts "Warning: The width of the resistance is lower than 4"
			set W 4
		}

		if {$L < 4} {
			puts "Warning: The length of the resistance is lower than 4"
			set L 4
		}

		# Update de Area & Perimeter
		set Area 	[expr {$L*$W}]	
		set Peri 	[expr {2*$L+2*$W}]

	} elseif {$entryMode == "AreaPerimeter"} {
		
		set a 		2
		set b 		[expr {-1*$Peri*1}]
		set c 		[expr {2*$Area*1}]				

		set L 		[expr {sqrt(($b**2)-4*$a*$c)}]
		set L       [expr {-1*$b+$L}]	
		set L 		[expr {$L/4}]
		set W 		[expr {$Area/$L}]

		puts "Width: $W"
		puts "Length: $L"
		# L & W proportional to the grid (0.05)

		set L 	[expr {[expr {int ($L/$grid)}]*$grid}]
		set W 	[expr {[expr {int ($W/$grid)}]*$grid}]

		if {$W < 4} {
			puts "Warning: The width of the resistance is lower than 4"
			set W 4

		}

		if {$L < 4} {
			puts "Warning: The length of the resistance is lower than 4"
			set L 4
		}

		# Update de Area & Perimeter
		set Area 	[expr {$L*$W}]	
		set Peri 	[expr {2*$L+2*$W}]
	}

	# Update to schematic	
	set Lu 		[expr {$L*1e-6}]	
	set Wu 		[expr {$W*1e-6}]
	set Areau 	[expr {$Wu*$Lu}]
	set Periu 	[expr {2*$Lu+2*$Wu}]
 
	iPDK_setParamValue capLu [iPDK_sciToEng $Lu] $inst 0
	iPDK_setParamValue capWu [iPDK_sciToEng $Wu] $inst 0
	iPDK_setParamValue capAreau [iPDK_sciToEng $Areau] $inst 0
	iPDK_setParamValue capPeriu [iPDK_sciToEng $Periu] $inst 0

	iPDK_setParamValue capL [iPDK_sciToEng $L] $inst 0
	iPDK_setParamValue capW [iPDK_sciToEng $W] $inst 0
	iPDK_setParamValue capArea [iPDK_sciToEng $Area] $inst 0
	iPDK_setParamValue capPeri [iPDK_sciToEng $Peri] $inst 0
}
