module 075_SDN250S(){
    // QATech.com 075-SDN250S
    color("Gray")
    translate([0,0,7.8])cylinder(h=29.72,d=1.021,center=false);
    color("yellow")
    translate([0,0,7.8+7.62])cylinder(h=1,d=1.46,center=false);
}


/* Define the hole that needs to be cut for this socket */
module 075_SDN250S_pinhole() {
    d_top_ring = 1;  //  top ring diameter
    d_bottom_ring = 0.85;  //  lower ring diameter
    d_shaft = 0.68;  //  diameter of shaft
    rings_dz = 2;  //  separation between rings
    ring_top_dz = 1;  //  opening to top ring separation
    
    through_all = 1000;
    cylinder(h=through_all,d=d_shaft,center=true);
    translate([0,0,through_all/2-ring_top_dz])cylinder(h=through_all,d=d_top_ring,center=true);
    translate([0,0,through_all/2-(ring_top_dz+rings_dz)])cylinder(h=through_all,d=d_bottom_ring,center=true);
}
075_SDN250S();
