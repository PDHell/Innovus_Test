#Author     : pdhell.
#Tool       : Innovus
#About Code : This script will create routing blockage of 2um around all the instances of ICOVL. 
#Hard coded : This code is hard coded for the instance name of *ICOVL* and the distance of 2um.

foreach cell [dbGet -p top.insts.name *ICOVL*] {
    set cell_name   [dbGet $cell.name]
    set bbox        [dbGet $cell.box]
    puts "$cell_name $bbox"
    set x1 [lindex [lindex $bbox 0] 0]
    set y1 [lindex [lindex $bbox 0] 1]
    set x2 [lindex [lindex $bbox 0] 2]
    set y2 [lindex [lindex $bbox 0] 3]

    set x1_new [expr $x1-2]
    set y1_new [expr $y1-2]
    set x2_new [expr $x2+2]
    set y2_new [expr $y2+2]

    createRouteBlk -layer {M1 VIA1 M2 VIA2 M3 VIA3 M4 VIA4 M5 VIA5 M6 VIA6 M7 VIA7 M8 VIA8 M9}  -box [list $x1_new  $y1_new $x2_new $y2_new ]
}

