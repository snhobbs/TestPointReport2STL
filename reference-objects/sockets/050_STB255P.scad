module 050_STB255P() {
    color("Gray")
    // QATech.com
    translate([0,0,43.18-36.27])cylinder(h=31.83,d=0.95,center=false);
    translate([0,0,8+5.08])cylinder(h=1,d=1.0,center=false);
    color("fuchsia")
    translate([0,0,8+7.37])cylinder(h=1,d=1.05,center=false);
    translate([0,0,8+11.71])cylinder(h=1,d=1.0,center=false);      
}

/* Define the hole that needs to be cut for this socket */
module 050_STB255P_pinhole() {
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
050_STB255P();
