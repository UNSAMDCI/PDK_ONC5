
#=============================================================================
# Default Datasheet Generation Format File
#
# This file contains the HTML prototypes and fragments required by the
# the default data sheet generation procedure (genDataSheet). This file
# is automatically sourced by that procedure.
# 
# This file will normally be in the "reports" subdir of the characterization
# directory.
#
#=============================================================================


#=============================================================================
# NOTE:
# When embedding variables in definitions, always use define_parameters
# if embedded variables (e.g., $<var>) reference other variables previously
# defined with either set_parameter or define_parameter (for the same parm
# block). If variables are local, then use set_parameter. If mixing, then
# reference parm block variables with late-evaluated variables (e.g., @@<var>@@)
# along with set_parameter.
#=============================================================================

#
# Define units used in the report. If you delete any or all of these,
# the missing unit spec will default to that assumed by the modeler.
# Specifically, to a well-known Synopsys liberty attribute, as follows:
#
#   User Spec                 Defaults to Liberty Attribute
# -------------         -------------------------------------
# user_time_unit           time_unit
# user_capacitance_unit    capacitive_load_unit
# user_resistance_unit     pulling_resistance_unit
# user_voltage_unit        voltage_unit
# user_current_unit        current_unit
# user_power_unit          leakge_power_unit
# user_energy_unit         (user_capacitance_unit) * (user_voltage_unit)^2
#
# Use these in conjunction with num_digits_after_decimal to get desired
# precision on report.
#
# The name of each, without the "user_" prefix, is used in the HTML
# and text prototypes as placeholders for the unit name. I.e., 
# placing the variable @@capacitance_unit@@ anywhere in the text or HTML
# will cause the user_capacitance_unit spec to be substituted. Don't
# use the user_xxx_yyy variables, since final coercion to these may not
# be possible for some reason.
#
# The final unit parameters (time_unit, capacitance_unit, etc.) are
# always written to the first parameter block specified in the
# list of parameter blocks.
#
define_parameters -append ioreport {
    set user_time_unit ns
    set user_capacitance_unit pf
    set user_resistance_unit ohm
    set user_voltage_unit V
    set user_current_unit A
    set user_power_unit nW
    set user_energy_unit pJ
    #
    set num_digits_after_decimal 4     ;# desired resolution after dec pt.
}


#
# Define table formatting defaults used throughout
#
define_parameters -append ioreport {
    set table_font "Arial"              ;# base table font
    set table_font_size "10pt"           ;# base table font size
}


#
# Define table borders and internal grid format
#
# dsRowGridLine/dsColGridLine specifies the internal grid line format
# for all tables, except where a separator or border is required.
# dsRowSeparator/dsColSeparator specifies the border format for
# explicitly inserted row and column separators, normally used to
# separate results from the the remainder of the table.
#
# The order of the table_borders is {top, bottom, left, right}
#
define_parameters -append ioreport {
    set table_borders {
        "solid windowtext 2pt"
        "solid windowtext 2pt"
        "solid windowtext 2pt"
        "solid windowtext 2pt"
    }
    set row_gridLine "solid windowtest 1pt"
    set col_gridLine "solid windowtext 1pt"
    set row_separator "solid windowtext 2pt"
    set col_separator "solid windowtext 2pt"
}


#
# Define the captions for all the tables. The main title
# will appear in the foreground of the title images. The relative
# font size here is relative to the font set for the table.
#
define_parameters -append ioreport {
    set function_table_title {<font size="+1">OUTPUT FUNCTIONS</font> }
    set functional_schematic_title {<font size="+1">FUNCTIONAL SCHEMATIC</font> }
    set cap_table_title {<font size="+1">PIN CAPACITANCE (@@capacitance_unit@@)</font>}
    set delay_table_title {<font size="+1">DELAY AND OUTPUT TRANSITION TIME</font>}
    set constraints_table_title {<font size="+1">CONSTRAINTS</font>}
    set energy_table_title {<font size="+1">DYNAMIC ENERGY</font>}
    set leakage_table_title {<font size="+1">LEAKAGE POWER</font>}
    set instance_table_title {<font size="+1">INSTANCE SETTINGS</font>}
    set memory_symbol_title {<font size="+1">SYMBOL</font>}
    set pin_description_title {<font size="+1">PIN DESCRITION</font>}
    set setup_cond_table_title {<font size="+1">SETUP AND CONDITIONS</font>}
    set flop_group_title {<font size="+1">FLOP GROUP</font>}
    set latch_group_title {<font size="+1">LATCH GROUP</font>}
}



#
# Define the column headers for all tables.
# DO NOT change the order of the columns and do not add additional ones.
#
define_parameters -append ioreport {
    set input_cap_headers {
        "Pin"
        "Type"
        "Capacitance (@@capacitance_unit@@)"
    }
    #
    # The rel output  columns are conditional, based on available information.
    # DO NOT change the order of the columns and do not add additional ones.
    #
    set delay_headers {
        "Input Pin"
        "Output"
        "When Condition"
        "Tin (@@time_unit@@)"
        "Out Load (@@capacitance_unit@@)"
        "Rel. Output"
        "Rel. Out Load (@@capacitance_unit@@)"
        "Delay (@@time_unit@@)"
        "Tout (@@time_unit@@)"
    }
    #
    # The output and rel output  columns are conditional, based on
    # available information.
    #
    set energy_headers {
        "Input Pin"
        "When Condition"
        "Tin (@@time_unit@@)"
        "Output"
        "Out Load (@@capacitance_unit@@)"
        "Opp. Out Pin"
        "Opp. Out Load (@@capacitance_unit@@)"
        "Energy (@@energy_unit@@)"
    }
    set function_headers {
        "Output Pin"
        "Function"
    }
    set leakage_headers {
        "When Condition"
        "Power (@@power_unit@@)"
    }
    set sequential_headers {
        "Attribute"
        "Expression"
    }
}

#
# Define the various types of cell formats. Each format specification constists
# of the cell prolog and the cell prototype. The prolog is an HTML string
# that immediately follows the <td for a cell. The prototype is the formatting
# HTML that normally constains cell value placeholder(s) encapsulated by HTML
# tags.  The first item in the list is the prolog followed by the prototype.
#
define_parameters -append ioreport {
    set normal_cell_fmt {
        "align=left valign=middle"
        "<p>@@value@@"
    }
    set center_cell_fmt {
        "align=middle valign=middle"
        "<p>@@value@@"
    }
    set pin_dir_cell_fmt {
        "align=left valign=middle"
        "<p>@@pin@@(@@dir@@)"
    }
    set numeric_cell_fmt {
        "align=right valign=middle"
        "<p>@@value@@"
    }
    set col_header_fmt {
        "align=middle valign=middle"
        "<p><b>@@value@@</b>"
    }
}


#
# This HTML fragment defines the start of the HTML file. Note the embedded
# variables defined previously.
#
define_parameters -append ioreport {
    set prolog [subst {\
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>
  <head>
    <title>SMC Datasheet</title>
  </head>

<body bgcolor="#FFFFFF" text="#000000" link="#006699" vlink="#999966" alink="#CCCC99"
      topmargin="0" marginheight="0">
   <basefont face="$table_font" size="$table_font_size"</font>

    }]
}

#
# Define main report banner parameters, which are images file and dir
# locations and company name.  SiliconSmart will have the image directory
# set to the etc/images directory under the SiliconSmart installation
# directory. Note that imageDir must be specified first. This must be defined
# before the report banner.
#
define_parameters -append ioreport {
    set banner_title "SILICONSMART"
    set banner_sub_title "CHARACTERIZATION DATASHEET"
    set banner_company_name "SYNOPSYS"
    set image_dir [file join . images]
    set image_title_bg [file join $image_dir "title_bg.gif"]
    set image_title_left [file join $image_dir "title_left.gif"]
    #set image_logo [file join $image_dir "magma_logo.gif"]
}

#
# This fragment contains the banner definition for the report (logo, title).
# Note embedded variables.
#
define_parameters -append ioreport {
    set banner [subst {
    <!-- Standard page header. Puts the company logo to the left with a blue -->
    <!-- bar extending right.  The title appears right, bottom justified in the bar. -->
  <table border="1" width="100%" cellspacing="0" cellpadding="0">
    <tr>
      <td width="50%" background="$image_title_bg" valign="top" align="left">
  	<font face="Courier New" size="15" color="#ffffff">$banner_company_name<SUP>&reg;</SUP></font>
      </td>
      <td width="50%" background="$image_title_bg" valign="bottom" align="right">
          <font face="Courier New" size="10" color="#ffffff">$banner_title<SUP>&trade;</SUP></font>
          <br><font face="Courier New" size="5" color="#ffffff">$banner_sub_title</font><br> </br>
      </td>
      </td>
    </tr>
  </table>
  <br><br>
    }]
}

#
# define company title
#
define_parameters -append ioreport {
    set company_name "UNSAM"
}


#
# This defines the functional header for ther report (cell name, descr, etc).
# Note the late-evaluated variables (@@<var>@@) which aren't defined until
# the report is generated.
#
define_parameters -append ioreport {
    set header [subst {\
  <table border=1 cellspacing=0 cellpadding=0 width="100%" style='width:100.0%;
         border-collapse:collapse;border:none;mso-border-top-alt:1.5pt;mso-border-left-alt:
        .5pt;mso-border-bottom-alt:1.5pt;mso-border-right-alt:.5pt;mso-border-color-alt:
        windowtext;mso-border-style-alt:solid;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
   <tr>
     <td valign=top align=left style='width:65%;border-top:solid windowtext 1.5pt;
        border-left:none;border-bottom:solid windowtext .5pt;border-right:none;
        padding:5.75pt 5.75pt 5.75pt 5.75pt'>
        <font size="+3">@@cell_name@@ @@cell_description@@</font>
        <br><font size="+2">@@company_name@@</font>
     </td>
     <td valign=top align=right style='width:35%;border-top:solid windowtext 1.5pt;
        border-left:none;border-bottom:solid windowtext .5pt;border-right:none;
        padding:5.75pt 5.75pt 5.75pt 5.75pt'>
        <font size="+3"><A href=@@index_file@@>@@index_file_msg@@</A></font><br>
        <font size="+2">&nbsp</font>
     </td>
   </tr>
   <tr>
     <td valign=top align=left style='width:65%;border:none;border-bottom:
         solid windowtext 1.5pt;padding:.05in 5.75pt 0in 5.75pt'>
         <p class=MsoNormal>@@opc_vol_temp@@</p>
         <p class=MsoNormal>@@timestamp@@</p>
     </td>
     <td valign=top align=right style='width:35%;border:none;border-bottom:
         solid windowtext 1.5pt;padding:.05in 5.75pt 0in 5.75pt'>
         <p class=MsoNormal>SiliconSmart Software Version: @@software_version@@</p>
     </td>
   </tr>
  </table>
  <br><br>
    }]
}

#
# Put any cell descriptions here. The parameter containing the description
# for cell MYCELL should be named MYCELL__description, as shown below.
#
define_parameters -append ioreport {
    set default_cell_description ""
    set MYCELL__description "My cell"
}

#
# This is written at the end of the report
#
define_parameters -append ioreport {
    set epilog [subst {\
<font size = "+1">LEGEND:<br>
&nbsp; n/a = not applicable<br> </font>
</body>
</html>
    }]
}
